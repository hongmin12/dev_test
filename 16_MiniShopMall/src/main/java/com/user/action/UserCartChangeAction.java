package com.user.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.controller.Action;
import com.shop.controller.ActionForward;

public class UserCartChangeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		int amount = Integer.parseInt(request.getParameter("amount").trim());
		
		int price = Integer.parseInt(request.getParameter("price").trim());
		
		PrintWriter out = response.getWriter();
		
		System.out.println(amount * price);
		
		out.println(amount * price);
		
		return null;
	}

}
