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

/**
 *
 * @author Shakith
 */
@WebServlet(name = "Deposit", urlPatterns = {"/Deposit"})
public class Deposit extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        double amount = Double.parseDouble(req.getParameter("amount"));

        User user = (User) req.getSession(false).getAttribute("user");
        double aval = user.getAccount().getAmount();

        Transaction tr = new Transaction();
        tr.setAmount(amount);
        tr.setDate(new Date());
        tr.setType("Deposit");

        aval = aval + amount;
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
