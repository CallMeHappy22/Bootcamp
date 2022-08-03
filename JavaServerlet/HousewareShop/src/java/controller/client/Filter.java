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
@WebServlet(name = "Filter", urlPatterns = {"/filter"})
public class Filter extends HttpServlet {

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

        int pageindex = NumberHelper.getInt(request.getParameter("page"));

        ArrayList<Integer> listCount = new ArrayList<>();
        int pageCount;
        if (pageindex == -1) {
            pageindex = 1;
        }
        int id = NumberHelper.getInt(request.getParameter("id"));
        int cid = NumberHelper.getInt(request.getParameter("cid"));
        if (id == -1 && cid == -1) {
            response.sendRedirect("client/error.jsp");
        } else {
            List<Product> listProduct;
            List<Category> listCategory;
            if (cid == -1) {
                if (id == 0) {
                    pageCount = new ProductDao().countPage();
                    pageCount = (pageCount % 20 == 0) ? pageCount / 20 : pageCount / 20 + 1;
                    if (pageindex > pageCount) {
                        pageindex = 1;
                    }
                    listProduct = new ProductDao().getAllPaging(pageindex, 20);
                } else {
                    pageCount = new ProductDao().countPageByCategory(id);
                    pageCount = (pageCount % 20 == 0) ? pageCount / 20 : pageCount / 20 + 1;
                    if (pageindex > pageCount) {
                        pageindex = 1;
                    }
                    listProduct = new ProductDao().getAllByCategoryIdPaging(id, pageindex, 20);
                }
            } else {
                if (cid == 0) {
                    pageCount = new ProductDao().countPage();
                    pageCount = (pageCount % 20 == 0) ? pageCount / 20 : pageCount / 20 + 1;
                    if (pageindex > pageCount) {
                        pageindex = 1;
                    }
                    listProduct = new ProductDao().getAllPaging(pageindex, 20);
                } else {
                    pageCount = new ProductDao().countPageBySubCategory(id);
                    pageCount = (pageCount % 20 == 0) ? pageCount / 20 : pageCount / 20 + 1;
                    if (pageindex > pageCount) {
                        pageindex = 1;
                    }
                    listProduct = new ProductDao().getAllBySubCategoryIdPaging(cid, pageindex, 20);
                }
            }

            for (int i = 1; i <= pageCount; i++) {
                listCount.add(i);
            }
            listCategory = new CategoryDao().getAll();

            request.setAttribute("id", id);
            request.setAttribute("cid", cid);
            request.setAttribute("page", pageindex);
            request.setAttribute("listCount", listCount);
            request.setAttribute("listProduct", listProduct);
            request.setAttribute("listCategory", listCategory);
            request.getSession().setAttribute("url", ServletHelper.getFullURL(request));
            request.getRequestDispatcher("client/filterByCategory.jsp").forward(request, response);
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
