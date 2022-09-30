<%-- 
    Document   : transaction
    Created on : Sep 9, 2022, 12:49:52 PM
    Author     : Shakith
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.citizen.webapp.Transaction"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.citizen.webapp.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=getServletContext().getInitParameter("app-title")%></title>
    </head>
    <body>
        <h1>All Transactions</h1>

        <%
            User user = (User) request.getSession().getAttribute("user");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            ArrayList<Transaction> transaction = user.getAccount().getTransaction();

            if (transaction == null) {
        %>
    <tr>You have no transaction details yet.</tr>
    <%
    } else {
    %>
    <table border="1">
        <tr>
            <td>Date</td>
            <td>Description</td>
            <td>Amount</td>
            <td>Balance</td>
        </tr>
        <%
            for (Transaction tr : transaction) {
        %>
        <tr>
            <td><%=sdf.format(tr.getDate())%></td>
            <td><%=tr.getType()%></td>
            <td><%=tr.getAmount()%></td>
            <td><%=tr.getBalance()%></td>
        </tr>
        <%
                }
            }
        %>
    </table>
</body>
</html>
