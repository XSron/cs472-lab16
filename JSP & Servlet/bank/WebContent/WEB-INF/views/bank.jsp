<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bank.css">
    <script defer src="https://code.jquery.com/jquery-3.4.1.js"
        	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
        	crossorigin="anonymous"></script>
    <title>MiniBank Application</title>
</head>
<body>
    <header>
        <nav class="navbar navbar-light bg-light">
            <a class="navbar-brand" href="#">CS472 ::: MiniBanking App</a>
        </nav>
    </header>
    <section>
        <div class="container">
        	${error}
            <form method="POST">
               <div class="form-group col-md-6">
                    <h3>Bank Account Form</h3>
                    <label for="accountNo">Account No</label>
                    <input type="text" value="${account.accountNo}" class="form-control" id="accountNo" name="accountNo" aria-describedby="accountNoHelp" placeholder="01-XXX-XXXX"  pattern="^01-[0-9]{3}-[0-9]{4}">
                    <small id="accountNoHelp" class="form-text text-muted">You unique account number</small>
                </div>  
                <div class="form-group col-md-6">
                    <label for="customerName">Customer Name</label>
                    <input type="text" value="${account.customerName}"class="form-control" id="customerName" name="customerName" placeholder="e.g John B. Smith" >
                </div>
                <div class="form-group col-md-6">
                    <label for="typeOfAccount">Type of Account</label>
                    <select id="typeOfAccount" name="typeOfAccount" class="form-control" >
                    	<c:choose>
                    		<c:when test="${account.accountType == 'Checking'}">
                    			<option selected>Checking</option>
                    		</c:when>
                    		<c:otherwise>
                    			<option>Checking</option>
                    		</c:otherwise>
                    	</c:choose>
                    	
                    	<c:choose>
                    		<c:when test="${account.accountType == 'Saving'}">
                    			<option selected>Saving</option>
                    		</c:when>
                    		<c:otherwise>
                    			<option>Saving</option>
                    		</c:otherwise>
                    	</c:choose>
                    	
                    	<c:choose>
                    		<c:when test="${account.accountType == 'Loan'}">
                    			<option selected>Loan</option>
                    		</c:when>
                    		<c:otherwise>
                    			<option>Loan</option>
                    		</c:otherwise>
                    	</c:choose>
                    </select>
                </div>   
                <div class="form-group col-md-6">
                    <input type="submit" value="Create an Account" class="btn btn-primary">
                </div>
                <div class="form-group col-md-6">
                    <table id="tbAccount" class="table table-hover table-bordered">
                        <thead>
                            <tr class="bg-primary">
                                <th>Account No</th>
                                <th>Customer Name</th>
                                <th>Account Type</th>
                            </tr>
                        </thead>
                        <tbody>
							<c:forEach var="account" items="${accounts}" varStatus="index">
								<tr>
									<td><c:out value="${account.accountNo}" /></td>
									<td><c:out value="${account.customerName}" /></td>
									<td><c:out value="${account.accountType}" /></td>
								</tr>
							</c:forEach>
                        </tbody>
                    </table>
                    <div class="space"></div>
                </div>
            </form>
        </div>
    </section>
    <footer>
        <div class="footer">
            <p class="pFooter">CS472 Bank ::: WAP</p>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </footer>
</body>
</html>