<%-- 
    Document   : viewDetails
    Created on : Sep 9, 2022, 11:51:08 AM
    Author     : Shakith
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.citizen.webapp.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sessions = request.getSession();
    if (!sessions.getAttribute("type").equals("Admin")) {
        response.sendRedirect("index.jsp");
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=getServletContext().getInitParameter("app-title")%></title>
    </head>
    <body>
        <h1>View Details</h1>

        <%
            String acc = request.getParameter("acc");

            ServletContext context = getServletContext();

            ArrayList<User> users = (ArrayList) context.getAttribute("user");

            for (User user : users) {
                if (user.getAccount().getNo().equals(acc)) {
        %>
        <table border="1">
            <tr>
                <td>Account Number : </td>
                <td><%=user.getAccount().getNo()%></td>
            </tr>
            <tr>
                <td>ID Number : </td>
                <td><%=user.getId()%></td>
            </tr>
            <tr>
                <td>First Name : </td>
                <td><%=user.getFname()%></td>
            </tr>
            <tr>
                <td>Last Name : </td>
                <td><%=user.getLname()%></td>
            </tr>
            <tr>
                <td>Mobile : </td>
                <td><%=user.getMobile()%></td>
            </tr>
            <tr>
                <td>User Name : </td>
                <td><%=user.getUsername()%></td>
            </tr>           
            <tr>
                <td>Password : </td>
                <td><%=user.getPassword()%></td>
            </tr>
            <tr>
                <td>Available Balance : </td>
                <td><%=user.getAccount().getAmount()%></td>
            </tr>
            <tr>
                <td>Date Created : </td>
                <td><%=user.getAccount().getDate()%></td>
            </tr>
        </table>
        <%
                }
            }
        %>
    </body>
</html>
