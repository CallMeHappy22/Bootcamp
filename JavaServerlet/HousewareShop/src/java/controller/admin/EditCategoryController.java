/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import dao.CategoryDao;
import dao.StatusCategoryDao;
import entity.Category;
import entity.StatusCategory;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.NumberHelper;

/**
 *
 * @author ThinkPro
 */
@WebServlet(name = "EditCategoryController", urlPatterns = {"/edit-category"})
public class EditCategoryController extends HttpServlet {

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
        HttpSession session = request.getSession();

        int id = NumberHelper.getInt(request.getParameter("id"));
        Category category = new CategoryDao().getOne(id);
        List<Category> listCategory = new CategoryDao().getAll();
        List<StatusCategory> listStatusCategory = new StatusCategoryDao().getAll();

        request.setAttribute("categoryEdit", category);
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("listStatusCategory", listStatusCategory);
        request.setAttribute("path", "category");
        request.getRequestDispatcher("admin/category.jsp").forward(request, response);

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

        int id = NumberHelper.getInt(request.getParameter("id"));

        if (id == -1) {
            response.sendRedirect("client/error.jsp");
        } else {
            Category categoryOld = new CategoryDao().getOne(id);

            String category = request.getParameter("category");

            if (category.trim().equals("")) {
                category = categoryOld.getCategory();
            }
            int status = NumberHelper.getInt(request.getParameter("status"));
            if (status == -1) {
                status = categoryOld.getStatus();
            }
            Category categoryNew = Category.builder()
                    .id(id).category(category)
                    .status(status).build();
            boolean check = new CategoryDao().update(categoryNew, id);
            if (!check) {
                request.setAttribute("error", "Update Failed!");
                request.setAttribute("message", "Please go to dashboard and try again!");
                request.getRequestDispatcher("admin/ErrorAdmin.jsp").forward(request, response);
            } else {
                response.sendRedirect("get-categories");
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
