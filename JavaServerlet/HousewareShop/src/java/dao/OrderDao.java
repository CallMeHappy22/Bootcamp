/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Order;
import entity.OrderDetail;
import entity.Shipping;
import entity.StatusOrder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import jdbc.SQLConnection;

/**
 *
 * @author ThinkPro
 */
public class OrderDao implements MethodDao<Order> {

    @Override
    public List<Order> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Order getOne(int id) {
        String query = "SELECT * FROM dbo.[order] WHERE id= ?";
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, id);
                ResultSet rs = ps.executeQuery();
                if (rs != null && rs.next()) {
                    Order order = Order.builder()
                            .id(rs.getInt(1))
                            .Customer(rs.getString(2))
                            .shippingId(rs.getInt(3))
                            .createDate(rs.getString(4))
                            .totalPrice(rs.getDouble(5))
                            .note(rs.getString(6))
                            .status(rs.getInt(7))
                            .build();
                    return order;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public boolean add(Order object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(Order object, int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean remove(int id) {
        String query = "DELETE FROM [dbo].[order]\n"
                + "      WHERE id=?";
        int check = 0;
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, id);
                check = ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public List<Order> getOrderByCustomer() {
        String query = "SELECT * FROM dbo.[order] WHERE status = 2";
        List<Order> list = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    Order order = Order.builder()
                            .id(rs.getInt(1))
                            .Customer(rs.getString(2))
                            .shippingId(rs.getInt(3))
                            .createDate(rs.getString(4))
                            .totalPrice(rs.getDouble(5))
                            .note(rs.getString(6))
                            .status(rs.getInt(7))
                            .build();
                    list.add(order);
                }
                return list;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;

    }

    public int addOrderReturnId(Order order) {
        String query = "INSERT INTO dbo.[order]\n"
                + "          ( Customer ,\n"
                + "            shipping_id ,\n"
                + "            total_price ,\n"
                + "            note ,\n"
                + "            status\n"
                + "          )\n"
                + "  VALUES  (?,?,?,?,?)";
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS) : null;) {
            if (ps != null) {
                ps.setObject(1, order.getCustomer());
                ps.setObject(2, order.getShippingId());
                ps.setObject(3, order.getTotalPrice());
                ps.setObject(4, order.getNote());
                ps.setObject(5, order.getStatus());
                int isCheck = ps.executeUpdate();
                if (isCheck > 0) {
                    ResultSet rs = ps.getGeneratedKeys();
                    rs.next();
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    public List<Order> getOrderNotSuccesYetByCustomer(String cus, int status) {
        String query = "SELECT dbo.[order].*,dbo.Shipping.name,dbo.Shipping.phone,dbo.Shipping.address,status_order.status \n"
                + "  FROM dbo.[order] INNER JOIN dbo.Shipping\n"
                + "  ON Shipping.id = [order].shipping_id INNER JOIN status_order\n"
                + "  ON status_order.id = dbo.[order].status WHERE Customer =? AND dbo.[order].status <> ?";
        List<Order> list = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, cus);
                ps.setObject(2, status);
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    Shipping shipping = Shipping.builder()
                            .id(rs.getInt(3)).name(rs.getString(8))
                            .phone(rs.getString(9)).address(rs.getString(10)).build();
                    StatusOrder statusOrder = StatusOrder.builder().id(rs.getInt(7))
                            .status(rs.getString(11)).build();
                    Order order = Order.builder()
                            .id(rs.getInt(1))
                            .Customer(rs.getString(2))
                            .shippingId(rs.getInt(3))
                            .createDate(rs.getString(4))
                            .totalPrice(rs.getDouble(5))
                            .note(rs.getString(6))
                            .status(rs.getInt(7))
                            .Shipping(shipping)
                            .statusOrder(statusOrder)
                            .build();
                    list.add(order);
                }
                return list;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public List<Order> getAllOrderByStatus(int status) {
        String query = "SELECT dbo.[order].*,dbo.Shipping.name,dbo.Shipping.phone,dbo.Shipping.address,status_order.status \n"
                + "  FROM dbo.[order] INNER JOIN dbo.Shipping\n"
                + "  ON Shipping.id = [order].shipping_id INNER JOIN status_order\n"
                + "  ON status_order.id = dbo.[order].status WHERE dbo.[order].status =?";
        List<Order> list = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            ps.setInt(1, status);
            if (ps != null) {
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    Shipping shipping = Shipping.builder()
                            .id(rs.getInt(3)).name(rs.getString(8))
                            .phone(rs.getString(9)).address(rs.getString(10)).build();
                    StatusOrder statusOrder = StatusOrder.builder().id(rs.getInt(7))
                            .status(rs.getString(11)).build();
                    Order order = Order.builder()
                            .id(rs.getInt(1))
                            .Customer(rs.getString(2))
                            .shippingId(rs.getInt(3))
                            .createDate(rs.getString(4))
                            .totalPrice(rs.getDouble(5))
                            .note(rs.getString(6))
                            .status(rs.getInt(7))
                            .Shipping(shipping)
                            .statusOrder(statusOrder)
                            .build();
                    list.add(order);
                }
                return list;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public int countOrderWatting() {
        String query = "SELECT COUNT(*)\n"
                + "FROM dbo.[order] INNER JOIN dbo.Shipping\n"
                + "ON Shipping.id = [order].shipping_id INNER JOIN status_order\n"
                + "ON status_order.id = dbo.[order].status WHERE dbo.[order].status = 1";
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ResultSet rs = ps.executeQuery();
                if (rs != null && rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return 0;

    }

    public int removeOrderByShippingIdReturnId(int shipping_id) {
        String query = "DELETE dbo.[order] WHERE id =?";
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS) : null;) {
            if (ps != null) {
                ps.setObject(1, shipping_id);
                int isCheck = ps.executeUpdate();
                if (isCheck > 0) {
                    ResultSet rs = ps.getGeneratedKeys();
                    rs.next();
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    public boolean updateStatus(int status, int id) {
        String query = "UPDATE [dbo].[order]\n"
                + "   SET [status] = ?\n"
                + " WHERE id = ?";
        int check = 0;
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, status);
                ps.setObject(2, id);
                check = ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public double calRevenueInMonth(int month) {
        String query = "SELECT ISNULL(SUM(total_price),'0')AS total FROM dbo.[order] WHERE YEAR(create_date)=YEAR(GETDATE()) and MONTH(create_date)=?";

        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setInt(1, month);
                ResultSet rs = ps.executeQuery();
                if (rs != null && rs.next()) {
                    return rs.getDouble(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    public static void main(String[] args) {
        double a = new OrderDao().calRevenueInMonth(7);
        System.out.println("a= " + a);
    }

}
