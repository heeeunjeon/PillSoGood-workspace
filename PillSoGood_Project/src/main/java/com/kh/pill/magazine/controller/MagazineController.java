package com.kh.pill.magazine.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pill.common.model.vo.PageInfo;
import com.kh.pill.common.template.Pagination;
import com.kh.pill.magazine.model.service.MagazineService;
import com.kh.pill.magazine.model.vo.Magazine;
import com.kh.pill.magazine.model.vo.MagazinePage;
import com.kh.pill.notice.model.vo.NoticeDetail;

@Controller
public class MagazineController {

	@Autowired
	private MagazineService magazineService;
	
	@RequestMapping("list.mag")
	public String SelectMagazineList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) { 
		
		int listCount = magazineService.selectListCount();
		
		int pageLimit = 5; 
		int boardLimit = 6; 
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Magazine> list = magazineService.selectMagazineList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		
		return "magazine/magazineListView";
		
	}

	@RequestMapping("enrollForm.mag")
	public String enrollForm() {
		
		return "magazine/magazineEnrollForm";
	
	}
	
	@RequestMapping("enroll.mag")
	public ModelAndView insertMagazine(Magazine mag, MultipartFile upfile, HttpSession session, ModelAndView mv) throws IllegalStateException, IOException {
		
		if(!upfile.getOriginalFilename().contentEquals("")) {
			
			String ChangeName = saveFile(upfile, session);
			
			mag.setMagazineImgName("resources/magazineUploadFiles/" + ChangeName);

		}

		int result = magazineService.insertMagazine(mag);
	
		if (result > 0) { 
			
			session.setAttribute("alertMsg", "게시글이 등록되었습니다.");
			mv.setViewName("redirect:/list.mag");
			
		} else {
			
			mv.addObject("errorMsg", "게시글 작성에 실패했습니다.").setViewName("common/errorPage");
			
		}
		
		return mv;
		
	}
	

	private String saveFile(MultipartFile upfile, HttpSession session) throws IllegalStateException, IOException {

		String originName = upfile.getOriginalFilename(); 
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int ranNum = (int)(Math.random() * 90000) + 10000;
		
		String ext = originName.substring(originName.lastIndexOf(".")); 

		String ChangeName = currentTime + ranNum + ext;

		String savePath = session.getServletContext().getRealPath("/resources/magazineUploadFiles/");
		
		upfile.transferTo((new File(savePath + ChangeName)));

		return ChangeName;
	}

	
	@RequestMapping("detail.mag")
	public String selectMagazine(int magazineNo, Model model) {

		
		int result = magazineService.updateViewCount(magazineNo);
		
		if(result > 0) {
			
			Magazine m = magazineService.selectMagazine(magazineNo);
			
			Magazine prev = magazineService.selectMagazine(magazineNo - 1);
			Magazine next = magazineService.selectMagazine(magazineNo + 1);
			
			// 이전글, 다음글 로직 수정
			model.addAttribute("prev", prev);
			model.addAttribute("next", next);
			
			model.addAttribute("mag" , m);
	
			
			return "magazine/magazineDetailView";
			
		} else {
			
			return null;
		}
	}
	
	@RequestMapping("delete.mag")
	public String deleteMagazine(int magazineNo, String filePath, HttpSession session, Model model) {

		int result = magazineService.deleteMagazine(magazineNo);
		
		if(result > 0) {

			if(!filePath.equals("")) {
				
				String realPath = session.getServletContext().getRealPath(filePath);
				new File(realPath).delete();
				
			}
			
			session.setAttribute("alertMsg", "게시글이 삭제되었습니다.");
			
			return "redirect:/list.mag";
			
		} else { 
			
			model.addAttribute("errorMsg", "게시글 삭제이 실패했습니다.");
			
			return "common/errorPage";
		}
				
	}
	
	
	@RequestMapping("updateForm.mag")
	public String updateForm(int magazineNo, Model model) {
		
		Magazine mag = magazineService.selectMagazine(magazineNo);
		
		model.addAttribute("mag", mag);

		return "magazine/magazineUpdateForm";

	}
	
	
	@RequestMapping("update.mag")
	public String updateMagazine(Magazine mag, MultipartFile reupfile, HttpSession session, Model model) throws IllegalStateException, IOException {

		if(!reupfile.getOriginalFilename().equals("")) {
 
			if(mag.getMagazineImgName() != null) {
				
				String realPath = session.getServletContext().getRealPath(mag.getMagazineImgName());
				
				new File(realPath).delete();
				
			} 

			String ChangeName = saveFile(reupfile, session);

			mag.setMagazineImgName(reupfile.getOriginalFilename());
			mag.setMagazineImgName("resources/magazineUploadFiles/" + ChangeName);
			
			System.out.println(mag.getMagazineImgName());
			
		}
		
		int result = magazineService.updateMagazine(mag);
		
		System.out.println(result);


		if(result > 0) {
			
			System.out.println(result);
			
			session.setAttribute("alertMsg", "게시글이 수정되었습니다.");
			
			return "redirect:/detail.mag?magazineNo=" + mag.getMagazineNo();
			
			
		} else { 
			
			model.addAttribute("errorMsg", "게시글 수정에 실패했습니다.");
			
			return "common/errorPage";
			
		}
	
		
	}
	


}
