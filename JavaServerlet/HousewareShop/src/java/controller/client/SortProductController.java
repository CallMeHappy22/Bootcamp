/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.client;

import dao.CategoryDao;
import dao.ProductDao;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
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
@WebServlet(name = "SortProductController", urlPatterns = {"/sort-product"})
public class SortProductController extends HttpServlet {

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
            int price = NumberHelper.getInt(request.getParameter("price"));
            String newRaw = request.getParameter("news");
            boolean news = false;
            if (newRaw != null && (newRaw.equalsIgnoreCase("on") || newRaw.equalsIgnoreCase("true"))) {
                news = true;
            }

            String freeRaw = request.getParameter("free");
            boolean free = false;
            if (freeRaw != null && (freeRaw.equalsIgnoreCase("on") || freeRaw.equalsIgnoreCase("true"))) {
                free = true;
            }
            double min = 0, max = 0;
            if (price >= 0) {
                if (price < 4) {
                    for (int i = 0; i < 4; i++) {
                        if (price == i) {
                            min = i * 50000;
                            max = min + 50000;
                        }
                    }
                } else {
                    min = 200000;
                    max = 1000000000;
                }

            }

            int pageindex = NumberHelper.getInt(request.getParameter("page"));
            if (pageindex == -1) {
                pageindex = 1;
            }

            int pageCount = new ProductDao().countPageByAllAttribute(price, min, max, news, free);
            pageCount = (pageCount % 20 == 0) ? pageCount / 20 : pageCount / 20 + 1;
            if (pageindex > pageCount) {
                pageindex = 1;
            }
            List<Product> listProduct = new ProductDao().sortAllAttribute(price, min, max, news, free, pageindex, 20);
            ArrayList<Integer> listCount = new ArrayList<>();
            for (int i = 1; i <= pageCount; i++) {
                listCount.add(i);
            }
            List<Category> listCategory = new CategoryDao().getAll();
            request.getSession().setAttribute("url", "sort-product?page=" + pageindex);
            request.setAttribute("price", price);
            request.setAttribute("news", news);
            request.setAttribute("free", free);
            request.setAttribute("page", pageindex);
            request.setAttribute("listCount", listCount);
            request.setAttribute("listProduct", listProduct);
            request.setAttribute("listCategory", listCategory);
            request.getRequestDispatcher("client/sort-product-All-Attribute.jsp").forward(request, response);
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
