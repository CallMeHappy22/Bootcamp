/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import dao.AccountDao;
import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "AddAccountController", urlPatterns = {"/add-account"})
public class AddAccountController extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddAccountController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddAccountController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String password = request.getParameter("password");
        String displayName = request.getParameter("displayName");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        int status = NumberHelper.getInt(request.getParameter("status"));
        int role = NumberHelper.getInt(request.getParameter("role"));

        Account accountOld = new AccountDao().getOne(username);
        if (accountOld != null) {
            request.setAttribute("error", "Account is exist");
            request.setAttribute("message", "Please go to dashboard and try again!");
            request.getRequestDispatcher("admin/ErrorAdmin.jsp").forward(request, response);
        } else {
            Account AccountCheckEmail = new AccountDao().getOneByEmail(email);
            if (AccountCheckEmail != null && !AccountCheckEmail.getUserName().equals(accountOld.getUserName())) {
                request.setAttribute("error", "Email is exist");
                request.setAttribute("message", "Please go to dashboard and put onother email");
                request.getRequestDispatcher("admin/ErrorAdmin.jsp").forward(request, response);
            } else {
                Account accountNew = Account.builder()
                        .userName(username).password(password).displayName(displayName)
                        .address(address).email(email)
                        .phone(phone).status(status).roleId(role).build();
                boolean check = new AccountDao().add(accountNew);
                if (!check) {
                    request.setAttribute("error", "Add Account Failed!");
                    request.setAttribute("message", "Please go to dashboard and try again!");
                    request.getRequestDispatcher("admin/ErrorAdmin.jsp").forward(request, response);
                } else {
                    response.sendRedirect("get-accounts");
                }
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
