/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.citizen.webapp;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Shakith
 */
@WebServlet(name = "Withdraw", urlPatterns = {"/Withdraw"})
public class Withdraw extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        double amount = Double.parseDouble(req.getParameter("amount"));

        User user = (User) req.getSession(false).getAttribute("user");
        double aval = user.getAccount().getAmount();

        if (aval < amount) {
            resp.setContentType("text/html");
            resp.getWriter().write("Your balance is insufficient");
        } else {
            Transaction tr = new Transaction();
            tr.setAmount(amount);
            tr.setDate(new Date());
            tr.setType("Withdraw");

            aval = aval - amount;
            tr.setBalance(aval);

            ArrayList<Transaction> ar = new ArrayList<>();

            if (user.getAccount().getTransaction() != null) {
                ar = user.getAccount().getTransaction();
            }

            ar.add(tr);

            user.getAccount().setAmount(aval);
            user.getAccount().setTransaction(ar);
            
            resp.sendRedirect(resp.encodeRedirectURL("Home.jsp"));
        }
    }

}
