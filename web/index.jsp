<%-- 
    Document   : index
    Created on : Sep 9, 2022, 8:59:23 AM
    Author     : Shakith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%

    String username = "", password = "";
    boolean checked = false;

    if (request.getCookies() != null) {
        for (Cookie cookie : request.getCookies()) {
            if (cookie.getName().equals("username")) {
                username = cookie.getValue();
            }
            if (cookie.getName().equals("password")) {
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

        <h3>Login</h3>

        <form method="POST" action="<%=response.encodeURL("Login")%>">
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
                    <td><input type="checkbox" name="check" value="true" <%= checked ? "checked": ""%>/></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Login" /></td>
                </tr>
            </table>
        </form>
        
        <button><a href="<%=response.encodeURL("admin.jsp")%>">Admin</a></button>
    </body>
</html>
