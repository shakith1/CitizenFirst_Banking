<%-- 
    Document   : listAccount
    Created on : Sep 9, 2022, 10:15:20 AM
    Author     : Shakith
--%>

<%@page import="com.citizen.webapp.User"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sessions = request.getSession();
    if (!sessions.getAttribute("type").equals("Admin")) {
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
        <h1>List Accounts</h1>

        <table border="1">
            <tr>
                <td>Account Number</td>
                <td>Account Holder Name</td>
                <td>Available Amount</td>
                <td>Account Status</td>
            </tr>

            <tr>
                <%
                    ServletContext servletContext = getServletContext();

                    if (servletContext.getAttribute("user") != null) {
                        ArrayList<User> ar = (ArrayList<User>) servletContext.getAttribute("user");

                        for (User user : ar) {
                %>
                <td><%=user.getAccount().getNo()%></td>
                <td><%=user.getFname() + " " + user.getLname()%></td>
                <td><%=user.getAccount().getAmount()%></td>
                <td><%=user.getStatus()%></td>
            <form method="POST" action="<%=response.encodeURL("ChangeStatus")%>">
                <td><input type="hidden" name="acc" value="<%=user.getAccount().getNo()%>"/><input type="submit" value="Change Status"/></td>
            </form>
            <form method="POST" action="<%=response.encodeURL("viewDetails.jsp")%>">
                <td><input type="hidden" name="acc" value="<%=user.getAccount().getNo()%>"/><input type="submit" value="View Details"/></td>
            </form>
        </tr>
        <%                        }
            }
        %>
    </table>

    <button><a href="<%=response.encodeURL("adminHome.jsp")%>">Home</a></button>
</body>
</html>
