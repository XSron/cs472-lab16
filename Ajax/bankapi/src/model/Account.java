package model;

public class Account {
	private String accountNo;
	private String customerName;
	private String accountType;
	public Account(String accountNo, String customerName, String accountType) {
		super();
		this.accountNo = accountNo;
		this.customerName = customerName;
		this.accountType = accountType;
	}
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getAccountType() {
		return accountType;
	}
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
}
