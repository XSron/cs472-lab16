package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Account;

@WebServlet("/account")
public class AccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private List<Account> accounts = new ArrayList<Account>();
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setAttribute("accounts", accounts);
		req.getRequestDispatcher("/WEB-INF/views/bank.jsp").forward(req, res);
	}
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//validation
		String error = "";
		if(req.getParameter("accountNo").isBlank())
			error += "<p style='color: red'>accountNo is Empty</p>";
		if(req.getParameter("customerName").isBlank())
			error += "<p style='color: red'>customerName is Empty</p>";
		if(req.getParameter("typeOfAccount").isBlank())
			error += "<p style='color: red'>typeOfAccount is Empty</p>";
		Account account = new Account(req.getParameter("accountNo"), 
				 					  req.getParameter("customerName"), 
				 					  req.getParameter("typeOfAccount"));
		if(error.isBlank()) {
			accounts.add(account);
			account = null;
		}
		req.setAttribute("error", error);
		req.setAttribute("account", account);
		doGet(req, res);
	}
}
