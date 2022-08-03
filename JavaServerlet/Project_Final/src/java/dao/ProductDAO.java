/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;

/**
 *
 * @author win
 */
public class ProductDAO implements IMethodDAO<Product> {

    @Override
    public List<Product> getAll() {
        try {
            List<Product> list = new ArrayList<>();
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "select * from product";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = Product.builder()
                        .id(rs.getInt(1))
                        .code(rs.getString(2))
                        .name(rs.getString(3))
                        .quantity(rs.getInt(4))
                        .price(rs.getDouble(5))
                        .description(rs.getString(6))
                        .imageUrl(rs.getString(7))
                        .createdDate(rs.getString(8))
                        .status(rs.getInt(9))
                        .subCategoryId(rs.getInt(10))
                        .sale(rs.getDouble(11)).build();
                list.add(product);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Product> getAllPaging(int pageIndex, int pageSize) {
        try {
            List<Product> list = new ArrayList<>();
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "select * from product order by id\n"
                    + "OFFSET (?-1)*? ROW FETCH NEXT ? ROW ONLY";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, pageIndex);
            ps.setInt(2, pageSize);
            ps.setInt(3, pageSize);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = Product.builder()
                        .id(rs.getInt(1))
                        .code(rs.getString(2))
                        .name(rs.getString(3))
                        .quantity(rs.getInt(4))
                        .price(rs.getDouble(5))
                        .description(rs.getString(6))
                        .imageUrl(rs.getString(7))
                        .createdDate(rs.getString(8))
                        .status(rs.getInt(9))
                        .subCategoryId(rs.getInt(10))
                        .sale(rs.getDouble(11)).build();
                list.add(product);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int totalProducts() {
        try {
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "select count(*) from product";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return 0;
    }

    @Override
    public Product getOne(int id) {
        try {
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "select * from product where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return Product.builder()
                        .id(rs.getInt(1))
                        .code(rs.getString(2))
                        .name(rs.getString(3))
                        .quantity(rs.getInt(4))
                        .price(rs.getDouble(5))
                        .description(rs.getString(6))
                        .imageUrl(rs.getString(7))
                        .createdDate(rs.getString(8))
                        .status(rs.getInt(9))
                        .subCategoryId(rs.getInt(10))
                        .sale(rs.getDouble(11))
                        .build();
            }
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public boolean insert(Product product) {
        int numRow = 0;
        try {
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "INSERT INTO [dbo].[product]\n"
                    + "           ([code]\n"
                    + "           ,[name]\n"
                    + "           ,[quantity]\n"
                    + "           ,[price]\n"
                    + "           ,[description]\n"
                    + "           ,[image_url]\n"
                    + "           ,[create_date]\n"
                    + "           ,[status]\n"
                    + "           ,[sub_category_id]\n"
                    + "           ,[sale])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, product.getCode());
            ps.setString(2, product.getName());
            ps.setInt(3, product.getQuantity());
            ps.setDouble(4, product.getPrice());
            ps.setString(5, product.getDescription());
            ps.setString(6, product.getImageUrl());
            ps.setString(7, product.getCreatedDate());
            ps.setInt(8, product.getStatus());
            ps.setInt(9, product.getSubCategoryId());
            ps.setDouble(10, product.getSale());
            numRow = ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return (numRow > 0);
    }

    @Override
    public boolean update(Product product) {
        int numRow = 0;
        try {
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "UPDATE [dbo].[product]\n"
                    + "   SET [code] = ?\n"
                    + "      ,[name] = ?\n"
                    + "      ,[quantity] = ?\n"
                    + "      ,[price] = ?\n"
                    + "      ,[description] = ?\n"
                    + "      ,[image_url] = ?\n"
                    + "      ,[create_date] = ?\n"
                    + "      ,[status] = ?\n"
                    + "      ,[sub_category_id] = ?\n"
                    + "      ,[sale] = ?\n"
                    + " WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, product.getCode());
            ps.setString(2, product.getName());
            ps.setInt(3, product.getQuantity());
            ps.setDouble(4, product.getPrice());
            ps.setString(5, product.getDescription());
            ps.setString(6, product.getImageUrl());
            ps.setString(7, product.getCreatedDate());
            ps.setInt(8, product.getStatus());
            ps.setInt(9, product.getSubCategoryId());
            ps.setDouble(10, product.getSale());
            ps.setInt(11, product.getId());
            numRow = ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return (numRow > 0);
    }

    @Override
    public boolean delete(int id) {
        int numRow = 0;
        try {
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "DELETE FROM [dbo].[product]\n"
                    + "      WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            numRow = ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return (numRow > 0);
    }

    public List<Product> filter(String categoryId_str, String subCategoryId_str, int pageIndex, int pageSize) {
        try {
            List<Product> list = new ArrayList<>();
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "select product.* from product inner join sub_category\n"
                    + "on product.sub_category_id = sub_category.id";
            if (subCategoryId_str != null) {
                sql += " where sub_category.id=?";
            } else if (categoryId_str != null) {
                sql += " where sub_category.category_id=?";
            }
            sql += " order by product.id\n"
                    + "offset (?-1)*? row fetch next ? row only";
            PreparedStatement ps = conn.prepareStatement(sql);
            if (subCategoryId_str != null) {
                ps.setInt(1, Integer.parseInt(subCategoryId_str));
            } else if (categoryId_str != null) {
                ps.setInt(1, Integer.parseInt(categoryId_str));
            }
            ps.setInt(2, pageIndex);
            ps.setInt(3, pageSize);
            ps.setInt(4, pageSize);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = Product.builder()
                        .id(rs.getInt(1))
                        .code(rs.getString(2))
                        .name(rs.getString(3))
                        .quantity(rs.getInt(4))
                        .price(rs.getDouble(5))
                        .description(rs.getString(6))
                        .imageUrl(rs.getString(7))
                        .createdDate(rs.getString(8))
                        .status(rs.getInt(9))
                        .subCategoryId(rs.getInt(10))
                        .sale(rs.getDouble(11)).build();
                list.add(product);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int totalProductByCategory(String categoryId_str, String subCategoryId_str) {
        try {
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "select count(*) from product inner join sub_category\n"
                    + "on product.sub_category_id = sub_category.id";
            if (subCategoryId_str != null) {
                sql += " where sub_category.id=?";
            } else if (categoryId_str != null) {
                sql += " where sub_category.category_id=?";
            }
            PreparedStatement ps = conn.prepareStatement(sql);
            if (subCategoryId_str != null) {
                ps.setInt(1, Integer.parseInt(subCategoryId_str));
            } else if (categoryId_str != null) {
                ps.setInt(1, Integer.parseInt(categoryId_str));
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return 0;
    }

}
