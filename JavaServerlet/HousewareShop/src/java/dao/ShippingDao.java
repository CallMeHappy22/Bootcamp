/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Shipping;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import jdbc.SQLConnection;

/**
 *
 * @author ThinkPro
 */
public class ShippingDao {

    public int addShippingReturnId(Shipping shipping) {
        String query = "INSERT INTO [dbo].[Shipping]\n"
                + "           ([name]\n"
                + "           ,[phone]\n"
                + "           ,[address])\n"
                + "     VALUES\n"
                + "           (?,?,?)";
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS) : null;) {
            if (ps != null) {
                ps.setObject(1, shipping.getName());
                ps.setObject(2, shipping.getPhone());
                ps.setObject(3, shipping.getAddress());
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
    public int removeShippingReturnId(int id){
        String query = "DELETE dbo.Shipping WHERE id =?";
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query,  Statement.RETURN_GENERATED_KEYS) : null;) {
            if (ps != null) {
                ps.setObject(1, id);
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
}
