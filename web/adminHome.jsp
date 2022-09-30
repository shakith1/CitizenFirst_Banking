<%-- 
    Document   : adminHome
    Created on : Sep 9, 2022, 9:15:30 AM
    Author     : Shakith
--%>

<%
    HttpSession sessions = request.getSession();
    if (!sessions.getAttribute("type").equals("Admin")) {
        response.sendRedirect(response.encodeRedirectURL("index.jsp"));
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=getServletContext().getInitParameter("app-title")%></title>
    </head>
    <body>
        <h1>Welcome, <%=request.getSession().getAttribute("name")%></h1>

        <button><a href="<%=response.encodeURL("addUser.jsp")%>">Add User</a></button>
        <button><a href="<%=response.encodeURL("listAccount.jsp")%>">List Account</a></button>
        <button><a href="<%=response.encodeURL("AdminLogout")%>">Logout</a></button>
    </body>
</html>
