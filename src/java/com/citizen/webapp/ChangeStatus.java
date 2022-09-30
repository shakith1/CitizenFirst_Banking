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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Shakith
 */
@WebServlet(name = "ChangeStatus", urlPatterns = {"/ChangeStatus"})
public class ChangeStatus extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String acc = req.getParameter("acc");

        ServletContext context = getServletContext();

        ArrayList<User> users = (ArrayList) context.getAttribute("user");

        for (User user : users) {
            if (user.getAccount().getNo().equals(acc)) {

                if (user.getStatus().equals("Active")) {
                    user.setStatus("Deactive");
                } else  if (user.getStatus().equals("Deactive")){
                    user.setStatus("Active");
                }
            }
        }
        resp.sendRedirect(resp.encodeRedirectURL("listAccount.jsp"));
    }

}
