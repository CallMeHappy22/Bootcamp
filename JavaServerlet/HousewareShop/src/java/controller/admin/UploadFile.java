/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import dao.ProductDao;
import entity.Product;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


/**
 *
 * @author ThinkPro
 */
@WebServlet(name = "UploadFile", urlPatterns = {"/UploadFile"})
public class UploadFile extends HttpServlet {

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
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
            if (!isMultiPart) {
                System.out.println("Error");
            } else {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List items = null;
                List<String> lsFileName = new ArrayList<>();

                try {
                    items = upload.parseRequest(request);
                } catch (FileUploadException e) {
                    System.err.println(e.getMessage());
                }

                Iterator iter = items.iterator();
                Hashtable params = new Hashtable();
                while (iter.hasNext()) {
                    FileItem item = (FileItem) iter.next();
                    if (item.isFormField()) {
                        // convert to UTF-8
                        params.put(new String(item.getFieldName().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8),
                                new String(item.getString().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8));
                    } else {
                        try {
                            // get file name
                            String itemName = item.getName();
                            String fileName = itemName.substring(itemName.lastIndexOf("\\") + 1);
                            lsFileName.add(fileName);

                            String readPart = getServletContext().getRealPath("/");
                            String partUpload = readPart.replace("build\\", "") + "assets\\images\\products\\" + fileName;

                            File saveFile = new File(partUpload);
                            item.write(saveFile);
                        } catch (Exception e) {
                            System.err.println(e.getMessage());
                        }
                    }
                }

                // get Product input
                String code = (String) params.get("code");
                String name = (String) params.get("name");
                double price = Double.valueOf((String) params.get("price"));
                int quantity = Integer.valueOf((String) params.get("quantity"));
                String description = (String) params.get("description");
                int status = Integer.valueOf((String) params.get("status"));

                Product p = Product.builder().name(name).price(price).quantity(quantity).description(description).status(status).image(lsFileName.get(0)).build();
                boolean isCheck = new ProductDao().add(p);
                if (isCheck) {
                    // add successfully
                    // add list file name of image
                }
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
