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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.SendMail;
import util.StringHelper;

/**
 *
 * @author ThinkPro
 */
@WebServlet(name = "SignupController", urlPatterns = {"/sign-up"})
public class SignupController extends HttpServlet {

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
            request.getRequestDispatcher("client/signup.jsp").forward(request, response);
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
        String retypePassword = request.getParameter("retypePassword");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        AccountDao accountDao = new AccountDao();
        String warning = validateInformation(username, password, retypePassword, email, phone);
        if (warning == null) {
            String activeCode = StringHelper.generateActiveCode();
            Account account = Account.builder()
                    .userName(username)
                    .password(password)
                    .displayName(username)
                    .email(email)
                    .phone(phone)
                    .roleId(Account.ROLE_NORMAL)
                    .status(Account.STATUS_PENDING)
                    .activeCode(activeCode)
                    .build();
            boolean check = accountDao.add(account);

            if (!check) {
                warning = "account or email or phone is exist";
            }
        }

        if (warning != null) {
            request.setAttribute("warning", warning);
            request.setAttribute("username", username);
            request.setAttribute("password", password);
            request.setAttribute("retypePassword", retypePassword);
            request.setAttribute("email", email);
            request.setAttribute("phone", phone);
            request.getRequestDispatcher("client/signup.jsp").forward(request, response);
        } else {
            Account account = new AccountDao().getOne(username);

            String subject = "Active Account";
            String message = "Active code is : " + account.getActiveCode();
            SendMail.send(account.getEmail(), subject, message, SendMail.USER, SendMail.PASS);
            request.setAttribute("account", account);
            request.getRequestDispatcher("client/activeCode.jsp").forward(request, response);
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

    

    private String validateInformation(String username, String password, String retypePassword, String email, String phone) {
        String warning = null;
        if (!password.equals(retypePassword)) {
            warning = "Password and RetypePassword is not the same";
        } else if (!email.matches("^[a-zA-Z]\\w+@([a-zA-Z]\\w+\\.)+[a-zA-Z]\\w+$")) {
            warning = "Email invalid, enter egain";
        } else if (!phone.matches("[0-9]{10,11}")) {
            warning = "Phone just include number and >10 and <11 character";
        } else {
            List<Account> listAccount = new AccountDao().getAll();
            for (Account A : listAccount) {
                if (A.getUserName().equalsIgnoreCase(username)) {
                    warning = "Username is exist";
                    break;
                }
                if (A.getEmail() != null && A.getEmail().equalsIgnoreCase(email)) {
                    warning = "Email is exist";
                    break;
                }
                if (A.getPhone() != null && A.getPhone().equalsIgnoreCase(phone)) {
                    warning = "Phone is exist";
                    break;
                }
            }
        }
        return warning;
    }

}
