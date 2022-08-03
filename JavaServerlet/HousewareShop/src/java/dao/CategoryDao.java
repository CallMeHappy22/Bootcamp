/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Category;
import entity.SubCategory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import jdbc.SQLConnection;

/**
 *
 * @author ThinkPro
 */
public class CategoryDao implements MethodDao<Category>{

    @Override
    public List<Category> getAll() {
        String query = "SELECT * FROM Category";
        List<Category> list = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            while (rs != null && rs.next()) {
                
                List<SubCategory> listSubCategory= new SubCategoryDao().getAllByCategoryId(rs.getInt(1));
                Category category =Category.builder()
                        .id(rs.getInt(1))
                        .category(rs.getString(2))
                        .status(rs.getInt(3))
                        .listSubCategory(listSubCategory)
                        .build();
                list.add(category);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public Category getOne(int id) {
        String query = "SELECT * FROM Category WHERE id = ?";
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, id);
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    Category category =Category.builder()
                        .id(rs.getInt(1))
                        .category(rs.getString(2))
                        .status(rs.getInt(3))
                        .build();
                    return category;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public boolean add(Category object) {
        String query = "INSERT INTO dbo.Category ( category, status ) "
                + "VALUES  (?,?)";
        int check = 0;
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, object.getCategory());
                ps.setObject(2, object.getStatus());
                check = ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    @Override
    public boolean update(Category object, int id) {
        String query = "UPDATE [dbo].[Category] "
                + "SET [category] = ?,[status] = ? "
                + "WHERE id=?";
        int check = 0;
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                 ps.setObject(1, object.getCategory());
                 ps.setObject(2, object.getStatus());
                 ps.setObject(3, id);
                check = ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    @Override
    public boolean remove(int id) {
        String query = "DELETE FROM category WHERE id = ?";
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, id);
                return ps.execute();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return false;
    }
    
}
