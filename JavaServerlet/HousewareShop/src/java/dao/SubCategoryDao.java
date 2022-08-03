/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

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
public class SubCategoryDao implements MethodDao<SubCategory> {

    /**
     *
     * @inheritDoc
     */
    @Override
    public List<SubCategory> getAll() {
        String query = "SELECT * FROM dbo.sub_category";
        List<SubCategory> list = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    SubCategory subCategory = SubCategory.builder()
                            .id(rs.getInt(1))
                            .categoryId(rs.getInt(2))
                            .subCategoryName(rs.getString(3))
                            .status(rs.getInt(4))
                            .build();
                    list.add(subCategory);
                }
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public int countSubCategory() {
        String query = "SELECT COUNT(*) FROM dbo.sub_category";
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            if (rs != null && rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    @Override
    public SubCategory getOne(int id) {
        String query = "SELECT * FROM dbo.sub_category WHERE id=?";
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, id);
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    SubCategory subCategory = SubCategory.builder()
                            .id(rs.getInt(1))
                            .categoryId(rs.getInt(2))
                            .subCategoryName(rs.getString(3))
                            .status(rs.getInt(4))
                            .build();
                    return subCategory;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public boolean add(SubCategory object) {
        String query = "INSERT INTO [dbo].[sub_category]\n"
                + "           ([category_id]\n"
                + "           ,[sub_category_name]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?, ?, ?)";
        int check = 0;
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, object.getCategoryId());
                ps.setObject(2, object.getSubCategoryName());
                ps.setObject(3, object.getStatus());
                check = ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    @Override
    public boolean update(SubCategory object, int id) {
        String query = "UPDATE [dbo].[sub_category]\n"
                + "   SET [category_id] = ?\n"
                + "      ,[sub_category_name] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE id=?";
        int check = 0;
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, object.getCategoryId());
                ps.setObject(2, object.getSubCategoryName());
                ps.setObject(3, object.getStatus());
                ps.setObject(4, id);
                check = ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    @Override
    public boolean remove(int id) {
        String query = "DELETE FROM dbo.sub_category WHERE id = ?";
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

    public List<SubCategory> getAllByCategoryId(int CategoryId) {
        String query = "SELECT * FROM dbo.sub_category WHERE category_id =?";
        List<SubCategory> list = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, CategoryId);
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    SubCategory subCategory = SubCategory.builder()
                            .id(rs.getInt(1))
                            .categoryId(rs.getInt(2))
                            .subCategoryName(rs.getString(3))
                            .status(rs.getInt(4))
                            .build();
                    list.add(subCategory);
                }
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public boolean removeByCategoryId(int categoryId) {
        String query = "DELETE FROM sub_category WHERE category_id = ?";
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setInt(1, categoryId);
                return ps.executeUpdate() > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return false;
    }

}
