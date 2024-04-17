package com.spring.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.model.Category;
import com.spring.model.Product;
import com.spring.model.ProductService;

@Controller
public class ProductController {

	@Inject
	private ProductService service;
	
	
	@RequestMapping("product_list.go")
	public String list(Model model) {
		
		List<Product> list = this.service.getList();
		
		model.addAttribute("List", list);
		
		return "product_list";
	}
	
	
	@RequestMapping("product_insert.go")
	public String insert(Model model) {
		
		// 제품 카테고리 코드 목록을 조회하여 제품 등록 폼 페이지로 이동.
		List<Category> list = this.service.categoryList();
		
		model.addAttribute("CategoryList", list);
		
		return "product_insert";
	}
	
	
	@RequestMapping("product_insert_ok.go")
	public void insertOk(Product dto, HttpServletResponse response) throws IOException {
		
		// 제품 등록하는 메서드 호출.
		int check = this.service.insert(dto);
		
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('제품 등록 성공!!!')");
			out.println("location.href='product_list.go'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('제품 등록 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
	
	@RequestMapping("product_content.go")
	public ModelAndView content(@RequestParam("pnum") int pnum) {
		
		ModelAndView mav = new ModelAndView();
		
		Product cont = this.service.content(pnum);
		
		mav.addObject("Content", cont);
		
		mav.setViewName("product_content");
		
		return mav;
		
	}
	
	
	@RequestMapping("product_update.go")
	public ModelAndView update(@RequestParam("pnum") int pnum) {
		
		ModelAndView mav = new ModelAndView();
		
		Product cont = this.service.content(pnum);
		
		mav.addObject("Content", cont);
		
		mav.setViewName("product_update");
		
		return mav;
		
	}
	
	
	@RequestMapping("product_update_ok.go")
	public void updateOk(Product dto, HttpServletResponse response) throws IOException {
		
		int check = this.service.update(dto);
		
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('제품 수정 성공!!!')");
			out.println("location.href='product_content.go?pnum="+dto.getPnum()+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('제품 수정 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
	
	@RequestMapping("product_delete.go")
	public void delete(@RequestParam("pnum") int pnum, HttpServletResponse response) throws IOException {
		
		int check = this.service.delete(pnum);
		
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			this.service.sequence(pnum);
			
			out.println("<script>");
			out.println("alert('제품 삭제 성공!!!')");
			out.println("location.href='product_list.go'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('제품 삭제 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
	
}
