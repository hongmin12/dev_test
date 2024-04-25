package com.mybatis.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mybatis.model.Category;
import com.mybatis.model.Product;
import com.mybatis.model.ProductDAO;

@Controller
public class ProductController {
	
	@Inject
	private ProductDAO dao;
	
	
	@RequestMapping("products_list.go")
	public String list(Model model) {
		List<Product> list = this.dao.getProductsList();
		
		model.addAttribute("List", list);
		
		return "product_list";
	}
	
	
	@RequestMapping("products_insert.go")
	public String insert(Model model) {
		List<Category> cList = this.dao.getCategoryList();
		
		model.addAttribute("clist", cList);
		
		return "product_insert";
		
	}
	
	
	@RequestMapping("products_insert_ok.go")
	public void insertOk(Product dto, HttpServletResponse response) throws IOException {
		
		int check = this.dao.insertProduct(dto);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('제품 등록 성공!!!')");
			out.println("location.href='products_list.go'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('제품 등록 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
	
	@RequestMapping("products_content.go")
	public String content(@RequestParam("no") int no, Model model) {
		
		Product cont = this.dao.contentProduct(no);
		
		model.addAttribute("Cont", cont);
		
		return "product_content";
	}
	
	
	@RequestMapping("products_update.go")
	public String update(@RequestParam("no") int no, Model model) {
		Product cont = this.dao.contentProduct(no);
		
		model.addAttribute("Cont", cont);
		
		return "product_update";
	}
	
	
	@RequestMapping("product_update_ok.go")
	public void updateOk(Product dto, HttpServletResponse response) throws IOException {
		int check = this.dao.updateProduct(dto);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(check > 0 ) {
			out.println("<script>");
			out.println("alert('제품 수정 성공!!!')");
			out.println("location.href='products_content.go?no="+dto.getPnum()+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('제품 등록 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	
	@RequestMapping("products_delete.go")
	public void delete(@RequestParam("no") int no, HttpServletResponse response) throws IOException {
		int check = this.dao.deleteProduct(no);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			this.dao.updateSequence(no);
			
			out.println("<script>");
			out.println("alert('제품 삭제 성공!!!')");
			out.println("location.href='products_list.go'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('제품 삭제 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

}
