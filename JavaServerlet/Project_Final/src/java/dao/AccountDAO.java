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
import model.Account;
import model.Category;

/**
 *
 * @author win
 */
public class AccountDAO {
    
    public Account login(String username, String password) {
        try {
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "select * from account where userName = ? and password =?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return Account.builder()
                        .username(rs.getString(1))
                        .password(rs.getString(2))
                        .displayName(rs.getString(3))
                        .address(rs.getString(4))
                        .email(rs.getString(5))
                        .phone(rs.getString(6))
                        .roleId(rs.getInt(7))
                        .status(rs.getInt(8))
                        .createdDate(rs.getString(9))
                        .activeCode(rs.getString(10)).build();
            }
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return null;
    }
}
