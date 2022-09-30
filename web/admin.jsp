<%-- 
    Document   : admin
    Created on : Sep 9, 2022, 9:07:52 AM
    Author     : Shakith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    String username = "", password = "";
    boolean checked = false;

    if (request.getCookies() != null) {
        for (Cookie cookie : request.getCookies()) {
            if (cookie.getName().equals("a_username")) {
                username = cookie.getValue();
            }
            if (cookie.getName().equals("a_password")) {
                password = cookie.getValue();
            }
        }
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=getServletContext().getInitParameter("app-title")%></title>
    </head>
    <body>
        <h1><%=getServletContext().getInitParameter("app-name")%></h1>

        <h3>Admin Login</h3>

        <form method="POST" action="<%=response.encodeURL("AdminLogin")%>">
            <table>
                <tr>
                    <td>User Name : </td>
                    <td><input type="text" name="username" value="<%=username%>" /></td>
                </tr>
                <tr>
                    <td>Password : </td>
                    <td><input type="password" name="password" value="<%=password%>"/></td>
                </tr>
                <tr>
                    <td>Remember Me </td>
                    <td><input type="checkbox" value="true" name="check" <%= checked ? "checked" : ""%>/></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Login" /></td>
                </tr>
            </table>
        </form>
        <button><a href="<%=response.encodeURL("index.jsp")%>">Client Login</a></button>
    </body>
</html>
