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
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.NumberHelper;
import util.ServletHelper;

/**
 *
 * @author ThinkPro
 */
@WebServlet(name = "Search", urlPatterns = {"/search"})
public class Search extends HttpServlet {

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
            String text = request.getParameter("inputSearch");
            int pageindex = NumberHelper.getInt(request.getParameter("page"));
            System.out.println("page    ="+pageindex);
            int pageCount = new ProductDao().countProductWhenSearch(text);
            pageCount=(pageCount%20==0)?pageCount/20:pageCount/20+1;
            ArrayList<Integer> listCount = new ArrayList<>();
            for(int i=1;i<=pageCount;i++){
                listCount.add(i);
            }
            if(pageindex==-1){
                pageindex=1;
            }
            
            List<Product> listProduct = new ProductDao().search(text, pageindex, 20);
            List<Category> listCategory = new CategoryDao().getAll();
            
            request.setAttribute("page", pageindex);
            request.setAttribute("inputSearch", text);
            request.setAttribute("listCount", listCount);
            request.setAttribute("listProduct", listProduct);
            request.setAttribute("listCategory", listCategory);
            request.getSession().setAttribute("url", ServletHelper.getFullURL(request));
            request.getRequestDispatcher("client/search.jsp").forward(request, response);
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
