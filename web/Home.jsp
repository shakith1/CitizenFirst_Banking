<%-- 
    Document   : Home
    Created on : Sep 9, 2022, 11:23:43 AM
    Author     : Shakith
--%>

<%@page import="com.citizen.webapp.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sessions = request.getSession(false);
    System.out.println(sessions);
    if (sessions == null) {
        response.sendRedirect(response.encodeRedirectURL("index.jsp"));
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=getServletContext().getInitParameter("app-title")%></title>
    </head>
    <body>

        <%
            User user = (User) request.getSession().getAttribute("user");
        %>

        <h1>Welcome, <%=user.getFname() + " " + user.getLname()%></h1>

        <%
            if (user.getStatus().equals("Deactive")) {
        %>
        <br/>
        <h2>Your account is deactivated. Please contact administrator</h2>
        <%
        } else {
        %>
        <h2>Your available balance : <%=user.getAccount().getAmount()%></h2>

        <button><a href="<%=response.encodeURL("transaction.jsp")%>">Show Transaction Details</a></button>

        <h3>Withdraw</h3>

        <form method="POST" action="<%=response.encodeURL("Withdraw")%>">
            <table>
                <tr>
                    <td>Withdraw amount : </td>
                    <td><input type="text" name="amount"/></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Proceed"/></td>
                </tr>
            </table>
        </form>

        <hr/>

        <h3>Deposit</h3>

        <form method="POST" action="<%=response.encodeURL("Deposit")%>">
            <table>
                <tr>
                    <td>Deposit amount : </td>
                    <td><input type="text" name="amount"/></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Proceed"/></td>
                </tr>
            </table>
        </form>
        <%
            }
        %>
        
        <button><a href="<%=response.encodeURL("Logout")%>">Log Out</a></button>
    </body>
</html>
