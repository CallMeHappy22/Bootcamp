/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import dao.ImageDao;
import dao.ProductDao;
import dao.SubCategoryDao;
import entity.Image;
import entity.Product;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import util.NumberHelper;

/**
 *
 * @author ThinkPro
 */
@WebServlet(name = "AddProductController", urlPatterns = {"/add-product"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AddProductController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public static final String SAVE_DIRECTORY = "images";

    public AddProductController() {
        super();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        int id = NumberHelper.getInt(request.getParameter("id"));
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
        String appPath = request.getServletContext().getRealPath("");
        appPath = appPath.replace('\\', '/');
        appPath = appPath + "../../web/";

        // Thư mục để save file tải lên.
        String fullSavePath = null;
        if (appPath.endsWith("/")) {
            fullSavePath = appPath + SAVE_DIRECTORY;
        } else {
            fullSavePath = appPath + "/" + SAVE_DIRECTORY;
        }

        // Tạo thư mục nếu nó không tồn tại.
        File fileSaveDir = new File(fullSavePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }

        String code = request.getParameter("code");
        String name = request.getParameter("name");

        int subCategory = NumberHelper.getInt(request.getParameter("subCategory"));
        int category = new SubCategoryDao().getOne(subCategory).getCategoryId();
        int quantity = NumberHelper.getInt(request.getParameter("quantity"));
        double price = NumberHelper.getDouble(request.getParameter("price"));
        double sale = NumberHelper.getDouble(request.getParameter("sale")) / 100;
        int status = NumberHelper.getInt(request.getParameter("status"));
        String description = request.getParameter("description");
        if (category == -1 || subCategory == -1 || quantity == -1 || price == -1) {
            request.setAttribute("error", "Add Product Failed!");
            request.setAttribute("message", "Please go to dashboard and try again!");
            request.getRequestDispatcher("admin/ErrorAdmin.jsp").forward(request, response);
        } else {
            String fileName1 = "";
            int count = 0;
            int product_id = -1;
            Product product = Product.builder()
                    .code(code)
                    .name(name)
                    .image(fileName1)
                    .categoryId(category)
                    .subCategoryId(subCategory)
                    .quantity(quantity)
                    .price(price)
                    .sale(sale)
                    .status(status)
                    .description(description)
                    .build();
            for (Part part : request.getParts()) {
                String fileName = extractFileName(part);
                if (fileName != null && fileName.length() > 0) {
                    String filePath = fullSavePath + File.separator + fileName;
                    if (count == 0) {
                        product.setImage(fileName);
                        product_id = new ProductDao().addProductReturnProductId(product);

                    } else {
                        if (product_id != -1) {
                            Image image = Image.builder()
                                    .productId(product_id)
                                    .imageName(fileName)
                                    .status(1)
                                    .build();
                            boolean check = new ImageDao().add(image);
                            if (check) {
                                response.sendRedirect("admin-manager");
                            } else {
                                request.setAttribute("error", "Add Product Failed!");
                                request.setAttribute("message", "Please go to dashboard and try again!");
                                request.getRequestDispatcher("admin/ErrorAdmin.jsp").forward(request, response);
                            }
                        }

                    }
                    count++;
                    if (count == 7) {
                        break;
                    }
                    System.out.println("Write attachment to file: " + filePath);

                    // Ghi vào file.
                    part.write(filePath);
                }
            }

        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    private String extractFileName(Part part) {
        // form-data; name="file"; filename="C:\file1.zip"
        // form-data; name="file"; filename="C:\Note\file2.zip"
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                // C:\file1.zip
                // C:\Note\file2.zip
                String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
                clientFileName = clientFileName.replace("\\", "/");
                int i = clientFileName.lastIndexOf('/');
                // file1.zip
                // file2.zip
                return clientFileName.substring(i + 1);
            }
        }
        return null;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
