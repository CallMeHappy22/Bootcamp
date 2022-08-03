/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import dao.AccountDao;
import dao.RoleAccountDao;
import dao.StatusAccountDao;
import entity.Account;
import entity.RoleAccount;
import entity.StatusAccount;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.NumberHelper;

/**
 *
 * @author ThinkPro
 */
@WebServlet(name = "EditAccountController", urlPatterns = {"/edit-account"})
public class EditAccountController extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String userName = request.getParameter("user");
            Account accountEdit = new AccountDao().getOne(userName);
            List<Account> listAccount = new AccountDao().getAll();
            List<StatusAccount> listStatusAccount = new StatusAccountDao().getAll();

            List<RoleAccount> listRoleAccount = new RoleAccountDao().getAll();
            request.setAttribute("accountEdit", accountEdit);
            request.setAttribute("listAccount", listAccount);
            request.setAttribute("listStatusAccount", listStatusAccount);
            request.setAttribute("listRoleAccount", listRoleAccount);
            request.setAttribute("path", "account");
            request.getRequestDispatcher("admin/Account.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String displayName = request.getParameter("displayName");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        int status = NumberHelper.getInt(request.getParameter("status"));
        int role = NumberHelper.getInt(request.getParameter("role"));
        
        
        Account accountOld = new AccountDao().getOne(username);
        Account AccountCheckEmail = new AccountDao().getOneByEmail(email);
        if (AccountCheckEmail!=null&&!AccountCheckEmail.getUserName().equals(accountOld.getUserName())) {
            request.setAttribute("error", "Email is exist");
            request.setAttribute("message", "Please go to dashboard and put onother email");
            request.getRequestDispatcher("admin/ErrorAdmin.jsp").forward(request, response);
        } else {
            Account accountNew = Account.builder()
                    .userName(username).displayName(displayName)
                    .address(address).email(email)
                    .phone(phone).status(status).roleId(role).build();

            boolean check = new AccountDao().update(accountNew, username);
            if (!check) {
                request.setAttribute("error", "Update Failed!");
                request.setAttribute("message", "Please go to dashboard and try again!");
                request.getRequestDispatcher("admin/ErrorAdmin.jsp").forward(request, response);
            }else{
                response.sendRedirect("get-accounts");
            }
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
