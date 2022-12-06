package com.kh.pill.product.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.pill.product.model.service.ProductService;
import com.kh.pill.product.model.vo.Product;


@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("list.pr")
	public String selectList(Model model) {
		
		ArrayList<Product> list = productService.selectList();
		
		model.addAttribute("list", list);
		
		return "product/productListView";
	}
	
	@RequestMapping("enrollForm.pr")
	public String enrollForm() {
		
		return "product/productEnrollForm";
	}
	

}
