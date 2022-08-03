/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.authentication;

import dao.AccountDao;
import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.SendMail;

/**
 *
 * @author ThinkPro
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("account");
            if (account == null) {
                request.getRequestDispatcher("client/login.jsp").forward(request, response);
            } else {
                response.sendRedirect("home");
            }
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");

        Account account = new AccountDao().login(username, password);
        String warning = null;
        if (account != null) {
            request.getSession().setAttribute("account", account);
            if (remember != null) {
                Cookie uUser = new Cookie("username", username);
                uUser.setMaxAge(24 * 3600);
                Cookie uPass = new Cookie("password", password);
                uPass.setMaxAge(24 * 3600);
                response.addCookie(uUser);
                response.addCookie(uPass);
            }
            if (account.getStatus() == Account.STATUS_BANED) {
                warning = "You do not have access to this website";
            } else {
                if (account.getRoleId() == Account.ROLE_ADMIN) {
                    response.sendRedirect("admin-manager");
                } else {
                    if (account.getStatus() == Account.STATUS_PENDING) {
                        request.getSession().removeAttribute("account");
                        String subject = "Active Account";
                        String message = "Active code is : " + new AccountDao().generateActiveCode(username);
                        SendMail.send(account.getEmail(), subject, message, SendMail.USER, SendMail.PASS);
                        request.setAttribute("account", account);
                        request.getRequestDispatcher("client/activeCode.jsp").forward(request, response);
                    } else {
                        //Back to url previous login
                        String url = (String) request.getSession().getAttribute("url");
                        if (url != null) {
                            response.sendRedirect(url);
                        } else {
                            response.sendRedirect("home");
                        }
                    }
                }
            }

        } else {
            warning = "Username or password is incorrect";
        }
        if (warning != null) {
            request.setAttribute("warning", warning);
            request.getRequestDispatcher("client/login.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
