package com.kh.pill.review.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.pill.common.model.vo.PageInfo;
import com.kh.pill.common.template.Pagination;
import com.kh.pill.review.model.service.ReviewService;
import com.kh.pill.review.model.vo.Review;
import com.kh.pill.review.model.vo.ReviewFile;
import com.kh.pill.review.model.vo.ReviewReply;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	// 메뉴바 클릭시 => list.re (기본적으로 1번 페이지 요청)
	// 페이징바 클릭 시 => list.re?cpage=요청하는페이지수&order=~~
	@RequestMapping("list.re")
	public String selectList(@RequestParam(value="cpage", defaultValue="1")int currentPage, @RequestParam(value="order", defaultValue="default")String order, Model model) {
		
		// 베스트 리뷰 조회
		ArrayList<Review> bestListAll = reviewService.selectBestList(); // 일반 리뷰 전체를 베스트 기준으로 조회 후 ArrayList bestListAll 에 담음
		ArrayList<Review> bestList = new ArrayList<>(); // 베스트 기준에 맞는 상위 3개 리뷰를 담을 ArrayList bestList 생성 
		// System.out.println(bestList);
		
		for(int i = 0; i < 3; i++) { // 상위 3개를 위해 3번만 반복
			
			Review bestReview = bestListAll.get(i); // bestListAll 에서 상위 3개 리뷰를 추출
			
			int rno = 0; // 일치 조건인 외래키 reviewNo 변수 설정 및 초기화
			rno = bestReview.getReviewNo(); // rno 에 상위 3개 리뷰의 reviewNo 를 담음
			// System.out.println(rno);
				
			ArrayList<ReviewFile> bflist = reviewService.selectBestReviewFile(rno); 
			// REVIEW_FILE 테이블에서 rno 가 일치하는 썸네일 파일만 추출해서  ArrayList bflist 에 담음
			// System.out.println("bflist : " + bflist);
			
			bestReview.setFlist(bflist); // bflist 를 Review 객체 bestReview 에 담음
			bestList.add(bestReview); // bestReview 를 ArrayList bestList 에 담음
			
		}
		
		model.addAttribute("bestList", bestList);
		// System.out.println("bestList : " + bestList);
		
		// 일반 리뷰 전체 조회는 베스트 리뷰 전체 조회와 비슷함
		
		// 일반 리뷰 전체 조회용 페이징
		int listCount = reviewService.selectListCount();
		
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		model.addAttribute("pi", pi);

		// 일반 리뷰 전체 조회
		ArrayList<Review> list = reviewService.selectList(pi, order);
				
		for(int i = 0; i < list.size(); i++) {
			
			Review review = list.get(i);
			
			int rno = 0;
			rno = review.getReviewNo();
				
			ArrayList<ReviewFile> flist = reviewService.selectReviewFile(rno);
			int replyCount = reviewService.selectReplyCount(rno);
			
			review.setFlist(flist);
			review.setReplyCount(replyCount);
		}
		// System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("order", order);

		// System.out.println(list);
		
		// 리턴
		return "review/reviewListView";
	}
	
	@RequestMapping("enrollForm.re")
	public String enrollForm() {
		
		return "review/reviewEnrollForm";
	}
	
	// * 다중파일 업로드 기능 구현시
	// => jsp 에서 여러 개의 input type="file" 요소에 모두 동일한 name 속성을 부여 (ex.upfile)
	// => Controller 의 메소드에서 MultipartFile[] upfile 또는 List<MultipartFile> upfile 로 받으면 됨
	// (0 번째 인덱스에서부터 첨부파일의 정보들이 담겨있음 : 반복문 활용 가능)
	@RequestMapping("insert.re")
	public ModelAndView insertReview(Review r, List<MultipartFile> upfile, HttpSession session, ModelAndView mv) {
		
		System.out.println(r);
		System.out.println(upfile);
		// 요청 시 name 속성과 필드명을 정확하게 맞췄음에도 불구하고 제대로 된 전달값이 안들어옴
		// 요청 시 분명히 파일을 넘겼음에도 불구하고 upfile 값이 null
		// => 파일 업로드에 필요한 Spring 라이브러리를 pom.xml 에 추가하지 않았기 때문
		// 파일 업로드용 라이브러리 : commons-fileupload, commons-io
		
		// MultipartFile : 첨부파일을 선택했든 안했든 생성된 객체 (null 이 아님)
		//				      다만, filename 필드에 원본명이 있냐 없냐의 차이
		
		// 전달된 파일이 있을 경우 => 파일명 수정 작업 후 서버로 업로드
		// => 원본명, 서버에 업로드된 경로를 이어붙이기
		/*
		if(!upfile.getOriginalFilename().equals("")) {
			
			
			// 파일명 수정 작업 후 서버에 업로드 시키기
			// 예) "flower.png" => "2022112210405012345.png"
			// 1. 원본파일명 뽑아오기
			String originName = upfile.getOriginalFilename(); // "flower.png"
			
			// 2. 시간 형식을 문자열로 뽑아내기
			String currentTime =  new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			
			// 3. 뒤에 붙을 5자리 랜덤값 뽑기
			int ranNum = (int)(Math.random() * 90000) + 10000; // 5자리 랜덤값
			
			// 4. 원본 파일로부터 확장자만 뽑기
			String ext = originName.substring(originName.lastIndexOf(".")); //
			
			// 5. 모두 이어 붙이기
			String changeName = currentTime + ranNum + ext;
			
			// 6. 업로드 하고자 하는 서버의 물리적인 실제 경로 알아내기
			String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
			
			// 7. 경로와 수정파일명을 합체 후 파일을 업로드해주기
			try {
				upfile.transferTo(new File(savePath + changeName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			
			// String changeName = saveFile(upfile, session);
			
			// 8. 원본명, 서버에 업로드 된 수정명을 Review r 에 담기
			// => reviewTitle, reviewContent, reviewWriter 필드에만 값이 담겨있음
			// => originName, changeName 필드에도 전달된 파일에 대한 정보를 담을것
			// r.setOriginName(upfile.getOriginalFilename());
			// r.setChangeName("resources/uploadFiles/" + changeName); 
			// 실제 경로도 같이 이어붙일것(FILE_PATH 컬럼을 따로 빼두지 않음)
		}
		
		// 넘어온 첨부파일이 있을 경우 r : 제목, 작성자, 내용, 원본파일명, 경로 + 수정파일명
		// 넘어온 첨부파일이 없을 경우 r : 제목, 작성자, 내용
		int result = reviewService.insertReview(r);
		
		if(result > 0) { // 성공 => 게시글 리스트 페이지로 url 재요청(list.re)
			
			session.setAttribute("alertMsg", "성공적으로 리뷰가 등록되었습니다.");
			
			mv.setViewName("redirect:/list.re");
		}
		else { // 실패 => 에러페이지로 포워딩
			
			// mv.addObject("errorMsg", "리뷰 작성 실패");
			// mv.setViewName("common/errorPage");
			
			// addObject 메소드의 반환형은 ModelAndView 타입임
			// => 다음과 같이 메소드 체이닝도 가능
			mv.addObject("errorMsg", "리뷰 작성 실패").setViewName("common/errorPage");
		}
		*/
		return mv;
		
	}
	
	@ResponseBody
	@RequestMapping(value="rlist.re", produces="application/json; charset=UTF-8")
	public String ajaxSelectReviewReplyList(int rno) {
		
		// System.out.println(rno);
		
		ArrayList<ReviewReply> list = reviewService.selectReviewReplyList(rno);
		
		// System.out.println(list);

		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="rinsert.re", produces="text/html; charset=UTF-8")
	public String ajaxInsertReviewReply(ReviewReply r) {
		
		// System.out.println("r : " + r);
		
		int result = reviewService.insertReviewReply(r);
		
		return (result > 0) ? "success" : "fail";
	}
	
	@ResponseBody
	@RequestMapping(value="rdelete.re", produces="text/html; charset=UTF-8")
	public String ajaxDeleteReviewReply(int replyNo) {
	 		
			// System.out.println("replyNo : " + replyNo);
		
			int result = reviewService.deleteReviewReply(replyNo);
	 
			// System.out.println("result : " + result);
			
	 		return (result > 0 ) ? "success" : "fail";
	}
	 
	// 현재 넘어온 첨부파일 그 자체를 수정명으로 서버의 폴더에 저장시키는 메소드 (일반메소드)
	// => Spring 의 Controller 메소드는 반드시 요청을 처리하는 역할이 아니어도 됨
	/*
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		// 파일명 수정 작업 후 서버에 업로드 시키기
		// 예) "flower.png" => "2022112210405012345.png"
		// 1. 원본파일명 뽑아오기
		String originName = upfile.getOriginalFilename(); // "flower.png"
		
		// 2. 시간 형식을 문자열로 뽑아내기
		// String currentTime =  new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 3. 뒤에 붙을 5자리 랜덤값 뽑기
		int ranNum = (int)(Math.random() * 90000) + 10000; // 5자리 랜덤값
		
		// 4. 원본 파일로부터 확장자만 뽑기
		String ext = originName.substring(originName.lastIndexOf(".")); //
		
		// 5. 모두 이어 붙이기
		// String changeName = currentTime + ranNum + ext;
		
		// 6. 업로드 하고자 하는 서버의 물리적인 실제 경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		// 7. 경로와 수정파일명을 합체 후 파일을 업로드해주기
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
		
	}
	*/
	
	@RequestMapping("detail.re")
	public ModelAndView selectReview(int rno, ModelAndView mv) {
	    
		// System.out.println("rno 값 : " + rno);
		// rno 에는 상세조회하고자 하는 해당 게시글 번호가 담겨있음 
		// 1. 해당 게시글 조회수 증가용 서비스 먼저 호출 결과 받기 (update 하고 오기)
		int result = reviewService.increaseCount(rno);
		  
		if(result > 0) { // 성공적으로 조회수 증가가 일어났다면
		 
			// 2. 상세조회 요청
			// => reviewDetailView.jsp 상에 필요한 데이터 조회
			Review r = reviewService.selectReview(rno);
			
			// 해당 리뷰에 첨부되어 있는 파일 리스트 조회 후 담기
			ArrayList<ReviewFile> flist = reviewService.selectReviewFile(rno);
			r.setFlist(flist);
			
			// 조회된 데이터를 담아서 review/reviewDetailView.jsp 로 포워딩 
			mv.addObject("r", r).setViewName("review/reviewDetailView");
			
			// System.out.println("r : " + r);
		
		}
		else { // 실패 
			
			mv.addObject("errorMsg", "리뷰 조회 실패").setViewName("common/errorPage");
			
		}
		
		return mv;
	}
	
	@RequestMapping("delete.re")
	public String deleteReview(int rno, String filePath, HttpSession session, Model model) {
		
		// System.out.println(rno);
		
		int result = reviewService.deleteReview(rno);
		
		if(result > 0) { // 리뷰 삭제 성공
			
			// 첨부파일이 있을 경우 => 파일 삭제
			// filePath 에는 해당 게시글의 수정파일명이 들어있음
			// filePath 값이 빈 문자열이 아니라면 첨부파일이 있었던 경우임
			if(!filePath.equals("")) {
				
				String realPath = session.getServletContext().getRealPath(filePath);
				new File(realPath).delete();
			}
			
			// 게시판 리스트 페이지 url 재요청
			session.setAttribute("alertMsg", "성공적으로 리뷰가 삭제되었습니다.");
			
			return "redirect:/list.re";
		}
		else { // 리뷰 삭제 실패
			
			model.addAttribute("errorMsg", "리뷰 삭제 실패");
			
			return "common/errorPage";
		}
	}
  
	@RequestMapping("updateForm.re")
	public String updateForm(int rno, Model model) {
		
		// 리뷰 수정 페이지를 포워딩 하기 전에 우선적으로 해당 리뷰 정보 조회
		Review r = reviewService.selectReview(rno); // 기존의 상세보기 서비스 재활용
		
		model.addAttribute("r", r);
		
		return "review/reviewUpdateForm";
	}
	
	@RequestMapping("update.re")
	public String updateReview(Review r, MultipartFile reupfile, HttpSession session, Model model) {
		
		// 새로 넘어온 첨부파일이 있는 경우
		if(!reupfile.getOriginalFilename().equals("")) {
			
			// System.out.println(r);
			// r 의 reviewNo : 내가 수정하고자 하는 리뷰의 번호
			// r 의 reviewTitle : 수정할 제목 (SET 절)
			// r 의 reviewContent : 수정할 내용 (SET 절)
			// r 의 originName : 기존 첨부파일의 원본명
			// r 의 changeName : 기존 첨부파일의 수정명
			
			// 1. 기존 첨부파일이 있었을 경우 => 기존 첨부파일을 찾아서 삭제
			/*
			if(r.getOriginName() != null) {
				String realPath = session.getServletContext().getRealPath(r.getChangeName());
				new File(realPath).delete();
			}
			
			// 2. 새로 넘어온 첨부파일을 수정명으로 바꾸고 서버에 업로드 시키기
			String changeName = saveFile(reupfile, session);
			
			// 3. r 객체에 새로 넘어온 첨부파일에 대한 원본명, 수정파일명 필드에 담기
			r.setOriginName(reupfile.getOriginalFilename());
			r.setChangeName("resources/uploadFiles/" + changeName);
			*/
		}
		
		/*
		 * r 에 무조건 담겨있는 내용
		 * reviewNo, reviewTitle, reviewContent
		 * 
		 * 추가적으로 고려해야할 경우의 수
		 * 1. 새로 첨부된 파일 X, 기존 첨부파일 X
		 * => originName : null, changeName : null
		 * 
		 * 2. 새로 첨부된 파일X, 기존 첨부파일 O
		 * => originName : 새로 첨부된 파일의 원본명
		 *    changeName : 새로 첨부된 파일의 수정명 + 파일경로
		 *    
		 * 4. 새로 첨부된 파일O, 기존 첨부파일 O
		 * => 기존 파일 삭제
		 * => 새로 전달된 파일을 서버에 업로드
		 * => originName : 새로 첨부된 파일의 원본명
		 *    changeName : 새로 첨부된 파일의 수정명 + 파일경로
		 */
		
		// Service 단으로 r 보내기
		int result = reviewService.updateReview(r);
		
		if(result > 0) { // 리뷰 수정 성공
			
			session.setAttribute("alertMsg", "성공적으로 리뷰가 수정되었습니다.");
			
			// 리뷰 상세보기 페이지로 url 재요청
			return "redirect:/detail.re?rno=" + r.getReviewNo();
		}
		else { // 리뷰 수정 실패
			
			model.addAttribute("errorMsg", "리뷰 수정 실패");
			
			return "common/errorPage";
		}
		
	}

	
	
	
	
}
