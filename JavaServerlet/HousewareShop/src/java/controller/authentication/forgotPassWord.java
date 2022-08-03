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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.SendMail;

/**
 *
 * @author ThinkPro
 */
@WebServlet(name = "forgotPassword", urlPatterns = {"/forgot-password"})
public class forgotPassWord extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            request.getRequestDispatcher("client/forgotPassword.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        processRequest(request, response);
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
        String to = request.getParameter("email");
        String phone = request.getParameter("phone");
        String warning = null;
        if (!username.trim().equals("")) {
            Account account = new AccountDao().getOne(username);

            if (account != null) {
                if (to.equals(account.getEmail()) && phone.equals(account.getPhone())) {
                    String subject = "Forgot Password";
                    String message = "Your password is : " + account.getPassword();
                    SendMail.send(to, subject, message, SendMail.USER, SendMail.PASS);
                    response.sendRedirect("login");
                } else {
                    warning = "Phone or email is incorrect";
                }
            } else {
                warning = "Account not found";
            }

        } else {
            warning = "Account is empty";
        }
        if (warning != null) {
            request.setAttribute("warning", warning);
            request.getRequestDispatcher("client/forgotPassword.jsp").forward(request, response);
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
