package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Account;

@WebServlet("/NewAccountServlet")
@MultipartConfig
public class NewAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private List<Account> accounts = new ArrayList<>();
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String accountNo = req.getParameter("accountNo");
		String customerName = req.getParameter("customerName");
		String accountType = req.getParameter("accountType");
		accounts.add(new Account(accountNo, customerName, accountType));
		System.out.println(accounts.size());
		res.getWriter().print("succeed");
	}
}
