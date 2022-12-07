package com.kh.pill.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pill.product.model.service.ProductService;
import com.kh.pill.product.model.vo.Product;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	/**
	 * 제품 게시글 전체 리스트 조회
	 * @return
	 */
	@RequestMapping("list.pr")
	public String selectList(Model model) {
		
		ArrayList<Product> list = productService.selectList();
		
		model.addAttribute("list", list);
		
		return "product/productListView";
	}
	
	/**
	 * 게시글 작성 폼 띄우기
	 * @return
	 */
	@RequestMapping("enrollForm.pr")
	public String enrollForm() {
		
		return "product/productEnrollForm";
	}
	
	/**
	 * @param 게시글 작성
	 * @return
	 */
	@RequestMapping("insert.pr")
	public ModelAndView insertProduct(Product p, MultipartHttpServletRequest request, HttpSession session, ModelAndView mv) throws Exception{
		
		List<MultipartFile> upfiles = request.getFiles("upfile"); // 파일 name 담기
		 
		String path = session.getServletContext().getRealPath("/resources/productUploadFiles/"); // 실제 경로 알아내기
		    
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int c = 0; // 파일 레벨을 구분하기 위한 변수선언
		
		for (MultipartFile f : upfiles) {
			
			if(!f.getOriginalFilename().equals("")) {
				
			 
				String originFileName = f.getOriginalFilename(); // 원본파일명
		 
				String ext = originFileName.substring(originFileName.lastIndexOf("."));
				
				String saveFileName = currentTime + ext; // 수정파일명 만들기
				
				if(c == 0) {
					saveFileName = "d" + saveFileName;
					p.setProductImgPath("resources/productUploadFiles/" + saveFileName);
				}
				
				// 파일생성 하기
			    f.transferTo(new File(path, saveFileName));
			    p.setProductDescription("resources/productUploadFiles/" + saveFileName); // Product에 담아주기
			    
			    c++;
			}
		}
		
		int result = productService.insertProduct(p); // Service단으로 보내기
		 
		if(result > 0) {
			
			session.setAttribute("alertMsg", "제품이 성공적으로 등록되었습니다.");
			mv.setViewName("redirect:/list.pr");
		}
		else {
			mv.addObject("errorMsg", "제품 등록에 실패했습니다.");
		}
		 
		return mv;
	}
	
	@RequestMapping("detail.pr")
	public ModelAndView selectProduct(int pno, ModelAndView mv) {
	      
		// 게시글 조회수 증가용 서비스 호출 결과 받기 (update 하고 오기)
		int result = productService.increaseCount(pno);
		  
		if(result > 0) { // 성공적으로 조회수 증가가 일어났다면
		 
			// 상세조회 요청
			// DetailView.jsp 상에 필요한 데이터 조회
			Product p = productService.selectProduct(pno);
			 
			// 조회된 데이터를 담아서 포워딩 
			mv.addObject("p", p).setViewName("product/productDetailView");
		
		}
		else { // 실패 
			
			mv.addObject("errorMsg", "게시글 조회 실패").setViewName("common/errorPage");
			
		}
		
		return mv;
	}
	
	
	

}
