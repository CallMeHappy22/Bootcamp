/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import dao.AccountDao;
import dao.CategoryDao;
import dao.OrderDao;
import dao.ProductDao;
import dao.RoleAccountDao;
import dao.StatusAccountDao;
import dao.StatusCategoryDao;
import dao.StatusProductDao;
import dao.StatusSubCategoryDao;
import dao.SubCategoryDao;
import entity.Account;
import entity.Category;
import entity.Product;
import entity.RoleAccount;
import entity.StatusAccount;
import entity.StatusCategory;
import entity.StatusProduct;
import entity.StatusSubCategory;
import entity.SubCategory;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ThinkPro
 */
@WebServlet(name = "GetAccountsController", urlPatterns = {"/get-accounts"})
public class GetAccountsController extends HttpServlet {

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
            
        List<Account> listAccount = new AccountDao().getAll();
        List<StatusAccount> listStatusAccount = new StatusAccountDao().getAll();
        List<RoleAccount> listRoleAccount = new RoleAccountDao().getAll();
        List<Product> listProduct = new ProductDao().getAll();
        List<Category> listCategory = new CategoryDao().getAll();
        List<SubCategory> listSubCategory = new SubCategoryDao().getAll();
        List<StatusProduct> listStatusProduct = new StatusProductDao().getAll();
        List<StatusCategory> listStatusCategory = new StatusCategoryDao().getAll();
        List<StatusSubCategory> listStatusSubCategory = new StatusSubCategoryDao().getAll();
        
        int numOfOrder = new OrderDao().countOrderWatting();
                        
        request.setAttribute("numOfOrder", numOfOrder);
        
        listStatusAccount.forEach(System.out::println);
        request.setAttribute("listAccount", listAccount);
        request.setAttribute("listStatusAccount", listStatusAccount);
        request.setAttribute("listRoleAccount", listRoleAccount);
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("listSubCategory", listSubCategory);
        request.setAttribute("listStatusProduct", listStatusProduct);
        request.setAttribute("listStatusCategory", listStatusCategory);
        request.setAttribute("listStatusSubCategory", listStatusSubCategory);
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
