/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Cart;
import entity.Order;
import entity.OrderDetail;
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
public class OrderDetailDao {

    public boolean add(List<Cart> list, int orderId) {
        String query = "INSERT INTO dbo.order_detail\n"
                + "        ( order_id ,\n"
                + "          product_id ,\n"
                + "          product_name ,\n"
                + "          product_price ,\n"
                + "          quantity ,\n"
                + "          product_image\n"
                + "        )\n"
                + "VALUES  (?,?,?,?,?,?)";
        int[] arr = {};
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {

                for (Cart c : list) {

                    ps.setObject(1, orderId);
                    ps.setObject(2, c.getProductId());
                    ps.setObject(3, c.getProductName());
                    ps.setObject(4, c.getProductPrice());
                    ps.setObject(5, c.getQuantity());
                    ps.setObject(6, c.getProductImg());
                    ps.addBatch();
                }
                arr = ps.executeBatch();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return arr.length > 0;
    }

    public List<OrderDetail> getOrderDetailByOrderId(int orderId) {
        String query = "SELECT * FROM dbo.order_detail WHERE order_id =?";
        List<OrderDetail> list = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, orderId);
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    OrderDetail orderDetail = OrderDetail.builder()
                            .id(rs.getInt(1))
                            .orderId(rs.getInt(2))
                            .productId(rs.getInt(3))
                            .productName(rs.getString(4))
                            .productPrice(rs.getDouble(5))
                            .quantity(rs.getInt(6))
                            .productImage(rs.getString(7))
                            .build();
                    list.add(orderDetail);
                }
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public List<OrderDetail> getAllOrderSuccess(String customer) {
        String query = "SELECT dbo.order_detail.* FROM dbo.order_detail INNER JOIN dbo.[order] on dbo.[order].id=order_id WHERE status = ? AND Customer=?";
        List<OrderDetail> list = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setInt(1, Order.STATUS_SUCCESS);
                ps.setString(2, customer);
            }
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            while (rs != null && rs.next()) {
                Order order = new OrderDao().getOne(rs.getInt(2));
                OrderDetail orderDetail = OrderDetail.builder()
                        .id(rs.getInt(1))
                        .orderId(rs.getInt(2))
                        .productId(rs.getInt(3))
                        .productName(rs.getString(4))
                        .productPrice(rs.getDouble(5))
                        .quantity(rs.getInt(6))
                        .productImage(rs.getString(7))
                        .Order(order)
                        .build();
                list.add(orderDetail);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public boolean removeByOrderId(int orderID) {
        String query = "DELETE FROM [dbo].[order_detail]\n"
                + "      WHERE order_id=?";
        int check = 0;
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, orderID);
                check = ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

}
