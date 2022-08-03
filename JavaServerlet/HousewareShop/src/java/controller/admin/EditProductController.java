/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import dao.ImageDao;
import dao.ProductDao;
import dao.StatusProductDao;
import dao.SubCategoryDao;
import entity.Image;
import entity.Product;
import entity.StatusProduct;
import entity.SubCategory;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "EditProductController", urlPatterns = {"/edit-product"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB

public class EditProductController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public static final String SAVE_DIRECTORY = "images";

    public EditProductController() {
        super();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            int id = NumberHelper.getInt(request.getParameter("id"));
            
            
            Product product = new ProductDao().getOne(id);
            
            List<Product> listProduct = new ProductDao().getAll();
            List<StatusProduct> listStatusProduct = new StatusProductDao().getAll();
            List<SubCategory> listSubCategory = new SubCategoryDao().getAll();
            
            request.setAttribute("productEdit", product);
            request.setAttribute("listProduct", listProduct);
            request.setAttribute("listSubCategory", listSubCategory);
            request.setAttribute("listStatusProduct", listStatusProduct);
            request.setAttribute("path", "product");
            request.getRequestDispatcher("admin/product.jsp").forward(request, response);

//            HttpSession session = request.getSession();
//
//            Account account = (Account) session.getAttribute("account");
//
//            if (account != null) {
//                List<Account> listAccounts = new AccountService().getAll();
//                int check = 0;
//                for (Account A : listAccounts) {
//                    if (A.getUserName().equals(account.getUserName())
//                            && A.getPassword().equals(account.getPassword()) && account.getRoleId() == 1) {
//                        check = 1;
//                        List<Product> listProduct = new ProductDao().getAll();
//                        List<SubCategory> listSubCategory = new SubCategoryDao().getAll();
//
//                        request.setAttribute("listProduct", listProduct);
//                        request.setAttribute("listSubCategory", listSubCategory);
//                        request.getRequestDispatcher("admin/management.jsp").forward(request, response);
//                    }
//                }
//                if (check == 0) {
//                    response.sendRedirect("client/error.jsp");
//                }
//            } else {
//                response.sendRedirect("login");
//            }
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
        
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        String appPath = request.getServletContext().getRealPath("");
           appPath = appPath.replace('\\', '/');
           appPath=appPath+"../../web/";
 
  
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

        int id = NumberHelper.getInt(request.getParameter("id"));
        System.out.println("id= " + id);
        String code = request.getParameter("code");
        System.out.println("code= " + code);
        String name = request.getParameter("name");
        System.out.println("name= " + name);

        String fileName1="";
        int count=0;
        Image image =Image.builder()
                        .productId(id)
                        .status(1)
                    .build();
        List<Image> listImage=new ImageDao().getAllImageByProductId(id);
        int row =listImage.get(0).getId();
        for (Part part : request.getParts()) {
               String fileName = extractFileName(part);
               if (fileName != null && fileName.length() > 0) {
                   String filePath = fullSavePath + File.separator + fileName;
                   if(count==0){
                       fileName1=fileName;
                   }else{
                       image.setImageName(fileName);
                       new ImageDao().update(image,row);
                       row++;
                   }
                   count++;
                   if(count==7) break;
                   System.out.println("Write attachment to file: " + filePath);
  
                   // Ghi vào file.
                   part.write(filePath);
               }
           }
//        System.out.println("filename= " + fileName);
        int category = NumberHelper.getInt(request.getParameter("category"));
        System.out.println("category= " + category);
        int subCategory = NumberHelper.getInt(request.getParameter("subCategory"));
        System.out.println("subCatogory= " + subCategory);
        int quantity = NumberHelper.getInt(request.getParameter("quantity"));
        System.out.println("quantity= " + quantity);
        double price = NumberHelper.getDouble(request.getParameter("price"));
        double sale = NumberHelper.getDouble(request.getParameter("sale"))/100;
        System.out.println("price= " + price);
        int status =NumberHelper.getInt(request.getParameter("status"));
        System.out.println("status="+status);
        String description = request.getParameter("description");
        System.out.println("description= " + description);

        if (id == -1 || category == -1 || subCategory == -1 || quantity == -1 || price == -1) {
            response.sendRedirect("client/error.jsp");
        } else {
            Product productOld = new ProductDao().getOne(id);
            if (code.trim().equals("")) {
                code = productOld.getCode();
            }
            if (name.trim().equals("")) {
                name = productOld.getCode();
            }
            if (fileName1.trim().equals("")||fileName1==null) {
                fileName1 = productOld.getImage();
            }
            if (category == -1) {
                category = productOld.getCategoryId();
            }
            if (subCategory == -1) {
                subCategory = productOld.getSubCategoryId();
            }
            if (quantity == -1) {
                quantity = productOld.getQuantity();
            }
            if (price == -1) {
                price = productOld.getPrice();
            }
            if(status ==-1){
                status=productOld.getStatus();
            }
            if (description.trim().equals("")) {
                description = productOld.getDescription();
            }
            Product newProduct = Product.builder()
                    .code(code)
                    .name(name)
                    .image(fileName1)
                    .categoryId(category)
                    .subCategoryId(subCategory)
                    .quantity(quantity)
                    .price(price)
                    .status(status)
                    .sale(sale)
                    .description(description)
                    .build();
            System.out.println("product= " + newProduct.toString());;
            ProductDao service = new ProductDao();
            boolean check = service.update(newProduct,id);
            if (check) {
                response.sendRedirect("get-products");
            } else {
                request.setAttribute("error", "Update Failed!");
                request.setAttribute("message", "Please go to dashboard and try again!");
                request.getRequestDispatcher("admin/ErrorAdmin.jsp").forward(request, response);
            }

//            List<SubCategory> listSubCategory = new SubCategoryDao().getAll();
//            request.setAttribute("listSubCategory", listSubCategory);
//
//            request.getRequestDispatcher("admin/update.jsp").forward(request, response);
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
