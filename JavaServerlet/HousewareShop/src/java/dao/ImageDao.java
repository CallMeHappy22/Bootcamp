/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Image;
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
public class ImageDao implements MethodDao<Image> {

    @Override
    public List<Image> getAll() {
        String query = "SELECT * FROM Image";
        List<Image> list = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            while (rs != null && rs.next()) {
                Image image = Image.builder()
                        .id(rs.getInt(1))
                        .productId(rs.getInt(2))
                        .imageName(rs.getString(3))
                        .status(rs.getInt(4))
                        .build();
                list.add(image);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public Image getOne(int id) {
        String query = "SELECT * FROM Image WHERE id = ?";
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, id);
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    Image image = Image.builder()
                            .id(rs.getInt(1))
                            .productId(rs.getInt(2))
                            .imageName(rs.getString(3))
                            .status(rs.getInt(4))
                            .build();
                    return image;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public boolean add(Image object) {
        String query = "INSERT INTO [dbo].[Image] ([product_id],[image_name],[status]) "
                + "VALUES(?,?,?)";
        int check = 0;
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, object.getProductId());
                ps.setObject(2, object.getImageName());
                ps.setObject(3, object.getStatus());
                check = ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    @Override
    public boolean update(Image object, int id) {
        String query = "UPDATE [dbo].[Image] SET [product_id] = ?,[image_name] = ?,[status] = ? "
                + "WHERE id=?";
        int check = 0;
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, object.getProductId());
                ps.setObject(2, object.getImageName());
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
        String query = "DELETE FROM Image WHERE id = ?";

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

    public List<Image> getAllImageByProductId(int id) {
        String query = "SELECT * FROM dbo.Image WHERE product_id =?";
        List<Image> list = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, id);
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    Image image = Image.builder()
                            .id(rs.getInt(1))
                            .productId(rs.getInt(2))
                            .imageName(rs.getString(3))
                            .status(rs.getInt(4))
                            .build();
                    list.add(image);
                }
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public boolean UpdateListImage(List<Image> list, int productId) {
        String query = "UPDATE [dbo].[Image] SET [product_id] = ?,[image_name] = ?,[status] = ? "
                + "WHERE id=?";
        int[] arr = {};
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                for (Image image : list) {
                    ps.setObject(1, image.getProductId());
                    ps.setObject(2, image.getImageName());
                    ps.setObject(3, image.getStatus());
                    ps.setObject(4, image.getId());
                    ps.addBatch();
                }

                arr = ps.executeBatch();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return arr.length > 0;
    }

    public boolean removeByProductId(int productId) {
        String query = "DELETE FROM Image WHERE product_id = ?";
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setInt(1, productId);
                return ps.executeUpdate() > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return false;
    }
}
