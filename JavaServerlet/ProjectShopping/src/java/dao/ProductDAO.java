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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Product;
import model.StatusProduct;

/**
 *
 * @author win
 */
public class ProductDAO implements IMethodDAO<Product> {

    @Override
    public List<Product> getAll() {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            List<Product> list = new ArrayList<>();
            //mo ket noi
            conn = new DBContext().getConnection();
            String sql = "select * from product";
            ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = Product.builder()
                        .id(rs.getInt(1))
                        .category(new CategoryDAO().getOne(rs.getInt(2)))
                        .code(rs.getString(3))
                        .name(rs.getString(4))
                        .quantity(rs.getInt(5))
                        .price(rs.getDouble(6))
                        .description(rs.getString(7))
                        .imageUrl(rs.getString(8))
                        .createdDate(rs.getString(9))
                        .status(new StatusProductDAO().getOne(rs.getInt(10)))
                        .subCategory(new SubCategoryDAO().getOne(rs.getInt(11)))
                        .sale(rs.getDouble(12)).build();
                list.add(product);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }

    @Override
    public Product getOne(int id) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            //mo ket noi
            conn = new DBContext().getConnection();
            String sql = "select * from product where id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = Product.builder()
                        .id(rs.getInt(1))
                        .category(new CategoryDAO().getOne(rs.getInt(2)))
                        .code(rs.getString(3))
                        .name(rs.getString(4))
                        .quantity(rs.getInt(5))
                        .price(rs.getDouble(6))
                        .description(rs.getString(7))
                        .imageUrl(rs.getString(8))
                        .createdDate(rs.getString(9))
                        .status(new StatusProductDAO().getOne(rs.getInt(10)))
                        .subCategory(new SubCategoryDAO().getOne(rs.getInt(11)))
                        .sale(rs.getDouble(12)).build();
                return product;
            }

        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }

    @Override
    public boolean insert(Product p) {
        Connection conn = null;
        PreparedStatement ps = null;
        int numRow = 0;
        try {
            //mo ket noi
            conn = new DBContext().getConnection();
            String sql = "INSERT INTO [dbo].[product]\n"
                    + "           ([category_id]\n"
                    + "           ,[code]\n"
                    + "           ,[name]\n"
                    + "           ,[quantity]\n"
                    + "           ,[price]\n"
                    + "           ,[description]\n"
                    + "           ,[image]\n"
                    + "           ,[create_date]\n"
                    + "           ,[status]\n"
                    + "           ,[sub_category_id]\n"
                    + "           ,[sale])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?,?,?,?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, p.getCategory().getId());
            ps.setString(2, p.getCode());
            ps.setString(3, p.getName());
            ps.setInt(4, p.getQuantity());
            ps.setDouble(5, p.getPrice());
            ps.setString(6, p.getDescription());
            ps.setString(7, p.getImageUrl());
            ps.setString(8, p.getCreatedDate());
            ps.setInt(9, p.getStatus().getId());
            ps.setInt(10, p.getSubCategory().getId());
            ps.setDouble(11, p.getSale());
            numRow = ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return (numRow > 0);
    }

    @Override
    public boolean update(Product p) {
        Connection conn = null;
        PreparedStatement ps = null;
        int numRow = 0;
        try {
            //mo ket noi
            conn = new DBContext().getConnection();
            String sql = "UPDATE [dbo].[product]\n"
                    + "   SET [category_id] =?\n"
                    + "      ,[code] =?\n"
                    + "      ,[name] =?\n"
                    + "      ,[quantity] =?\n"
                    + "      ,[price] =?\n"
                    + "      ,[description] =?\n"
                    + "      ,[image] =?\n"
                    + "      ,[create_date] =?\n"
                    + "      ,[status] =?\n"
                    + "      ,[sub_category_id] =?\n"
                    + "      ,[sale] =?\n"
                    + " WHERE id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, p.getCategory().getId());
            ps.setString(2, p.getCode());
            ps.setString(3, p.getName());
            ps.setInt(4, p.getQuantity());
            ps.setDouble(5, p.getPrice());
            ps.setString(6, p.getDescription());
            ps.setString(7, p.getImageUrl());
            ps.setString(8, p.getCreatedDate());
            ps.setInt(9, p.getStatus().getId());
            ps.setInt(10, p.getSubCategory().getId());
            ps.setDouble(11, p.getSale());
            numRow = ps.executeUpdate();

        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return (numRow > 0);
    }

    @Override
    public boolean delete(int id) {
        Connection conn = null;
        PreparedStatement ps = null;
        int numRow = 0;
        try {
            //mo ket noi
            conn = new DBContext().getConnection();
            String sql = "DELETE FROM [dbo].[product]\n"
                    + "      WHERE id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            numRow = ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return (numRow > 0);
    }

}
