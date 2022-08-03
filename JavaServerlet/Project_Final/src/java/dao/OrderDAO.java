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
import java.sql.Statement;
import model.Order;
import model.Shipping;

/**
 *
 * @author win
 */
public class OrderDAO {

    public int insertReturnId(Order order) {
        int numRow = 0;
        try {
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "INSERT INTO [dbo].[order]\n"
                    + "           ([customer]\n"
                    + "           ,[shipping_id]\n"
                    + "           ,[total_price]\n"
                    + "           ,[note]\n"
                    + "           ,[status])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, order.getCustomer());
            ps.setInt(2, order.getShippingId());
            ps.setDouble(3, order.getTotalPrice());
            ps.setString(4, order.getNote());
            ps.setInt(5, order.getStatus());
            numRow = ps.executeUpdate();
            if (numRow > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                rs.next();
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return 0;
    }
}
