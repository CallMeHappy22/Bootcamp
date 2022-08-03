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
import dao.ThongKeOrderDao;
import dao.ViewDao;
import entity.Account;
import entity.Category;
import entity.Order;
import entity.Product;
import entity.RoleAccount;
import entity.StatusAccount;
import entity.StatusCategory;
import entity.StatusProduct;
import entity.StatusSubCategory;
import entity.SubCategory;
import entity.ThongkeOrder;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ThinkPro
 */
@WebServlet(name = "managerController", urlPatterns = {"/admin-manager"})
public class managerController extends HttpServlet {

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

            HttpSession session = request.getSession();
            

            Account account = (Account) session.getAttribute("account");

            if (account != null) {
                List<Account> listAccounts = new AccountDao().getAll();
                int check = 0;
                for (Account A : listAccounts) {
                    if (A.getUserName().equals(account.getUserName())
                            && A.getPassword().equals(account.getPassword()) && account.getRoleId() == 1) {
                        check = 1;
                        List<Product> listProduct = new ProductDao().getAll();
                        List<Category> listCategory = new CategoryDao().getAll();
                        List<SubCategory> listSubCategory = new SubCategoryDao().getAll();
                        List<StatusProduct> listStatusProduct = new StatusProductDao().getAll();
                        List<StatusCategory> listStatusCategory = new StatusCategoryDao().getAll();
                        List<StatusSubCategory> listStatusSubCategory = new StatusSubCategoryDao().getAll();
                        List<Order> listOrderWatting = new OrderDao().getOrderNotSuccesYetByCustomer(account.getUserName(), 4);
                        List<StatusAccount> listStatusAccount = new StatusAccountDao().getAll();
                        List<RoleAccount> listRoleAccount = new RoleAccountDao().getAll();
                        int numOfOrder = new OrderDao().countOrderWatting();
                        int count = new ViewDao().getView();
                        int count2 = new ProductDao().countProduct();
                        int count3 = new AccountDao().countAccount();
                        int count4 = new SubCategoryDao().countSubCategory();

                        String thu = "";
                        String data = "";
                        List<ThongkeOrder> listThongKe = new ThongKeOrderDao().getAll();
                        for (ThongkeOrder T : listThongKe) {
                            thu += "\"" + T.getThu() + "\", ";
                            data += T.getNumOfOrder() + ",";
                        }

                        request.setAttribute("thu", thu);
                        request.setAttribute("data", data);

                        request.setAttribute("view", count);
                        request.setAttribute("numSubCategory", count4);
                        request.setAttribute("numAccount", count3);
                        request.setAttribute("numProduct", count2);
                        request.setAttribute("numOfOrder", numOfOrder);
                        request.setAttribute("listOrderWatting", listOrderWatting);
                        request.setAttribute("listProduct", listProduct);
                        request.setAttribute("listCategory", listCategory);
                        request.setAttribute("listSubCategory", listSubCategory);
                        request.setAttribute("listStatusProduct", listStatusProduct);
                        request.setAttribute("listStatusCategory", listStatusCategory);
                        request.setAttribute("listStatusSubCategory", listStatusSubCategory);

                        request.setAttribute("listStatusAccount", listStatusAccount);
                        request.setAttribute("listRoleAccount", listRoleAccount);
                        request.setAttribute("path", "admin-manager");
                        request.getRequestDispatcher("admin/index.jsp").forward(request, response);
                    }
                }
                if (check == 0) {
                    response.sendRedirect("client/error.jsp");
                }
            } else {
                response.sendRedirect("login");
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
