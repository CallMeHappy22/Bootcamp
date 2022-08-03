/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.client;

import dao.AccountDao;
import dao.CategoryDao;
import dao.OrderDao;
import dao.OrderDetailDao;
import entity.Account;
import entity.Category;
import entity.Order;
import entity.OrderDetail;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.ServletHelper;

/**
 *
 * @author ThinkPro
 */
@WebServlet(name = "MyProfileController", urlPatterns = {"/my-profile"})
public class MyProfileController extends HttpServlet {

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
            
            
            Account ac = (Account) request.getSession().getAttribute("account");  
            Account account = new AccountDao().getOne(ac.getUserName());
            List<Category> listCategory = new CategoryDao().getAll();
            List<Order> listOrderWatting = new OrderDao().getOrderNotSuccesYetByCustomer(ac.getUserName(), 5);
            List<OrderDetail>listOrderHistory = new OrderDetailDao().getAllOrderSuccess(ac.getUserName());
            
            request.setAttribute("listOrderHistory", listOrderHistory);
            request.setAttribute("listOrderWatting", listOrderWatting);
            request.setAttribute("account", account);
            request.setAttribute("listCategory", listCategory);
            request.getSession().setAttribute("url", ServletHelper.getFullURL(request));
            
            request.getRequestDispatcher("client/myprofile.jsp").forward(request, response);
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
        processRequest(request, response);
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
