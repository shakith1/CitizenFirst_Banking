<%-- 
    Document   : addUser
    Created on : Sep 9, 2022, 9:37:49 AM
    Author     : Shakith
--%>

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
        <h1>Add User</h1>

        <form method="POST" action="<%=response.encodeURL("AddUser")%>">
            <table>
                <tr>
                    <td>First Name : </td>
                    <td><input type="text" name="fname"/></td>
                </tr>
                <tr>
                    <td>Last Name : </td>
                    <td><input type="text" name="lname"/></td>
                </tr>
                <tr>
                    <td>Contact Number : </td>
                    <td><input type="text" name="mobile"/></td>
                </tr>
                <tr>
                    <td>ID Number : </td>
                    <td><input type="text" name="idnum"/></td>
                </tr>
                <tr>
                    <td>User Name : </td>
                    <td><input type="text" name="username"/></td>
                </tr>
                <tr>
                    <td>Password : </td>
                    <td><input type="text" name="password"/></td>
                </tr>
                <tr>
                    <td>Select Account Type : </td>
                    <td><select name="account">
                            <option value="savings">Savings Account</option>
                            <option value="current">Current Account</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Deposit Amount : </td>
                    <td><input type="text" name="amount"/></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Add User" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
