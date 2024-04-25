package com.mybatis.emp;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mybatis.model.Dept;
import com.mybatis.model.Emp;
import com.mybatis.model.EmpDAO;

@Controller
public class EmpController {
	
	@Inject
	private EmpDAO dao;
	
	
	@RequestMapping("emp_list.go")
	public String list(Model model) {
		
		List<Emp> list = this.dao.getEmpList();
		
		model.addAttribute("EmpList", list);
		
		return "emp_list";
		
	}
	
	
	@RequestMapping("emp_insert.go")
	public String insert(Model model) {
		
		List<Dept> dList = this.dao.getDeptList();
		
		List<String> jList = this.dao.getJobList();
		
		List<Emp> mList = this.dao.getMgrList();
		
		model.addAttribute("Dept", dList);
		model.addAttribute("Job", jList);
		model.addAttribute("Mgr", mList);
		
		return "emp_insert";
		
	}
	
	
	@RequestMapping("emp_insert_ok.go")
	public void insertok(Emp dto, HttpServletResponse response) throws IOException {
		
		int check = this.dao.insertEmp(dto);
		
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('사원 등록 성공')");
			out.println("location.href='emp_list.go'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('사원 등록 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
	
	@RequestMapping("emp_content.go")
	public String cont(@RequestParam("no") int no, Model model) {
		
		Emp cont = this.dao.getEmp(no);
		
		model.addAttribute("Cont", cont);
		
		return "emp_content";
		
	}
	
	
	@RequestMapping("emp_update.go")
	public String modify(@RequestParam("no") int no, Model model) {
		
		List<Dept> dList = this.dao.getDeptList();
		
		List<String> jList = this.dao.getJobList();
		
		List<Emp> mList = this.dao.getMgrList();
		
		Emp cont = this.dao.getEmp(no);
		
		model.addAttribute("Dept", dList);
		model.addAttribute("Job", jList);
		model.addAttribute("Mgr", mList);
		model.addAttribute("Cont", cont);
		
		return "emp_update";
		
	}
	
	
	@RequestMapping("emp_update_ok.go")
	public void modifyok(Emp dto, HttpServletResponse response) throws IOException {
		
		int check = this.dao.updateEmp(dto);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('사원 정보 수정 성공')");
			out.println("location.href='emp_content.go?no="+dto.getEmpno()+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('사원 정보 수정 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
	
	@RequestMapping("emp_delete.go")
	public void delete(@RequestParam("no") int no, HttpServletResponse response) throws IOException {
		
		int check = this.dao.deleteEmp(no);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('사원 삭제 성공')");
			out.println("location.href='emp_list.go'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('사원 삭제 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}

}
