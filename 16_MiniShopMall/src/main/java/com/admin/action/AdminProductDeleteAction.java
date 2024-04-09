package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.controller.Action;
import com.shop.controller.ActionForward;
import com.shop.model.ProductDAO;

public class AdminProductDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// get 방식으로 넘어온 제품번호에 해당하는 제품을
		// shop_products 테이블에서 삭제하는 비지니스 로직.
		
		int product_no= 
				Integer.parseInt(request.getParameter("pnum").trim());
		
		ProductDAO dao = ProductDAO.getInstance();
		
		int check = dao.deleteProduct(product_no);
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			dao.updateSequence(product_no);
			
			out.println("<script>");
			out.println("alert('제품 삭제 성공!!!')");
			out.println("location.href='admin_product_list.go'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('제품 삭제 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return null;
	}

}
