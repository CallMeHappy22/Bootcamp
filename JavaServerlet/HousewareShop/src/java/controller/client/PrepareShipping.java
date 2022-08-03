/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.client;

import dao.AccountDao;
import dao.OrderDao;
import dao.OrderDetailDao;
import dao.ShippingDao;
import entity.Account;
import entity.Cart;
import entity.Order;
import entity.Shipping;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.SendMail;

/**
 *
 * @author ThinkPro
 */
@WebServlet(name = "PrepareShipping", urlPatterns = {"/prepare-shipping"})
public class PrepareShipping extends HttpServlet {

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

            String name = request.getParameter("name");
            String mobile = request.getParameter("mobile");
            String address = request.getParameter("address");
            String note = request.getParameter("note");

            Account account = (Account) request.getSession().getAttribute("account");
            String username = account.getUserName();
            Shipping shipping = Shipping.builder()
                    .name(name).phone(mobile).address(address).build();
            int shippingInfoId = new ShippingDao().addShippingReturnId(shipping);
            if (shippingInfoId > 0) {
                HttpSession session = request.getSession();
                List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");

                double totalPrice = 0;
                for (Cart c : listCart) {
                    totalPrice += c.getQuantity()*c.getProductPrice();
                }

                Order order = Order.builder().Customer(username).shippingId(shippingInfoId).totalPrice(totalPrice)
                        .note(note).status(1).build();//đang xử lý- đang ship-thành công

                int orderId = new OrderDao().addOrderReturnId(order);
                if (orderId > 0) {
                    boolean check = new OrderDetailDao().add(listCart, orderId);
                    if (check) {
                        //Gửi mail đặt hàng thành công
                        Account accountMail = new AccountDao().getOne(username);

                        String subject = "Your order has been processing.";
                        String message = "<!DOCTYPE html>\n"
                                + "<html lang=\"en\">\n"
                                + "\n"
                                + "<head>\n"
                                + "</head>\n"
                                + "\n"
                                + "<body>\n"
                                + "    <h3 style=\"color: blue;\">Your order has been processing.</h3>\n"
                                + "    <div>Full Name : " + name + "</div>\n"
                                + "    <div>Phone : " + mobile + "</div>\n"
                                + "    <div>Address : " + address + "</div>\n"
                                + "    <h3 style=\"color: blue;\">Thank you very much!</h3>\n"
                                + "\n"
                                + "</body>\n"
                                + "\n"
                                + "</html>";
                        SendMail.send(accountMail.getEmail(), subject, message, SendMail.USER, SendMail.PASS);

                        session.removeAttribute("listCart");
                        response.sendRedirect("thank");
                    } else {
                        //remove order (tự code)

                        int orderRemove = new OrderDao().removeOrderByShippingIdReturnId(shippingInfoId);
                        int shippingRemove = new ShippingDao().removeShippingReturnId(shippingInfoId);

                        //remove shippingInfo (tự code)
                        response.sendRedirect("client/error.jsp");
                    }
                } else {
                    //remove shippingInfo (tự code)
                    int shippingRemove = new ShippingDao().removeShippingReturnId(shippingInfoId);
                    response.sendRedirect("client/error.jsp");
                }

            } else {

                response.sendRedirect("client/error.jsp");
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
