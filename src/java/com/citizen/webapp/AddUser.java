/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.citizen.webapp;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Shakith
 */
@WebServlet(name = "AddUser", urlPatterns = {"/AddUser"})
public class AddUser extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fname = req.getParameter("fname");
        String lname = req.getParameter("lname");
        String mobile = req.getParameter("mobile");
        String id = req.getParameter("idnum");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String type = req.getParameter("account");
        String amount = req.getParameter("amount");

        Account account = null;
        
        if(type.equals("savings")){
            account = new SavingAccount();
        }else if(type.equals("current")){
            account = new CurrentAccount();
        }
        
        account.setNo(String.valueOf(System.currentTimeMillis()));
        account.setDate(new Date());
        account.setAmount(Double.parseDouble(amount));
        
        User user = new User(fname, lname, mobile, id, username, password, account);
        
        ServletContext servletContext = getServletContext();
        
        ArrayList<User> ar = new ArrayList<>();
        
        if(servletContext.getAttribute("user") != null)
            ar = (ArrayList<User>) servletContext.getAttribute("user");
        
        ar.add(user);
        
        servletContext.setAttribute("user", ar);
        
        resp.sendRedirect(resp.encodeRedirectURL("adminHome.jsp"));
    }
    
}