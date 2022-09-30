/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.citizen.webapp;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "AdminLogin", urlPatterns = {"/AdminLogin"})
public class AdminLogin extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String check = req.getParameter("check");
        
        if (username.equals("admin") && password.equals("admin")) {
            HttpSession session = req.getSession();
            session.setAttribute("name", username);
            session.setAttribute("type", "Admin");
            session.setMaxInactiveInterval(60 * 30);
            
            if (check != null) {
                Cookie c1 = new Cookie("a_username", username);
                Cookie c2 = new Cookie("a_password", password);
                
                resp.addCookie(c1);
                resp.addCookie(c2);
            }
            
            resp.sendRedirect(resp.encodeRedirectURL("adminHome.jsp"));
        } else {
            resp.setContentType("text/html");
            resp.getWriter().write("Incorrect Username or Password");
        }
    }
    
}
