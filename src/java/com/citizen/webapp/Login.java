/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.citizen.webapp;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Shakith
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String check = req.getParameter("check");

        ServletContext context = getServletContext();

        if (context.getAttribute("user") != null) {
            ArrayList<User> users = (ArrayList) context.getAttribute("user");

            for (User user : users) {

                if (username.equals(user.getUsername()) && password.equals(user.getPassword())) {
                    HttpSession session = req.getSession();
                    session.setAttribute("user", user);

                    if (check != null) {
                        Cookie c1 = new Cookie("username", username);
                        Cookie c2 = new Cookie("password", password);

                        resp.addCookie(c1);
                        resp.addCookie(c2);

                    }
                    resp.sendRedirect(resp.encodeRedirectURL("Home.jsp"));
                } else {
                    resp.setContentType("text/html");
                    resp.getWriter().write("Incorrect Username or Password");
                }
            }
        } else {
            resp.setContentType("text/html");
            resp.getWriter().write("Incorrect Username or Password");
        }
    }

}
