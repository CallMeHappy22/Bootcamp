/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import dao.AccountDao;
import dao.OrderDao;
import entity.Account;
import entity.Order;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.SendMail;
import util.NumberHelper;

/**
 *
 * @author ThinkPro
 */
@WebServlet(name = "UpdateOrder", urlPatterns = {"/accept-order"})
public class AcceptOrderController extends HttpServlet {

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
            OrderDao orderDao = new OrderDao();
            int id = NumberHelper.getInt(request.getParameter("id"));
            int status = NumberHelper.getInt(request.getParameter("status"));
            Order order = orderDao.getOne(id);
            boolean check = false;
            switch (order.getStatus()) {
                case Order.STATUS_WAITING:
                    check = orderDao.updateStatus(Order.STATUS_ACCEPTED, id);
                    break;
                case Order.STATUS_ACCEPTED:
                    check = orderDao.updateStatus(Order.STATUS_SHIPPING, id);
                    break;
                case Order.STATUS_ONLINE:
                    check = orderDao.updateStatus(Order.STATUS_SUCCESS, id);
                    break;
                case Order.STATUS_SHIPPING:
                    check = orderDao.updateStatus(Order.STATUS_SUCCESS, id);
                    break;
            }
            if (check) {
                Account accountMail = new AccountDao().getOne(order.getCustomer());

                String subject = "Your order has been processing.";
                String message = "<!DOCTYPE html>\n"
                        + "<html lang=\"en\">\n"
                        + "\n"
                        + "<head>\n"
                        + "</head>\n"
                        + "\n"
                        + "<body>\n"
                        + "    <h3 style=\"color: green;\">Your order has been Accepted.</h3>\n"
                        + "    <h3 style=\"color: green;\">Thank you very much!</h3>\n"
                        + "    <h3 style=\"color: green;\">Please confirm your order when you receive your order.</h3>\n"
                        + "\n"
                        + "</body>\n"
                        + "\n"
                        + "</html>";
                SendMail.send(accountMail.getEmail(), subject, message, SendMail.USER, SendMail.PASS);
                response.sendRedirect("process-order?status=" + status);
            } else {
                response.getWriter().println("Accept failed!");
            }
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
