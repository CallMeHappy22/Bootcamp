/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.RoleAccount;
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
public class RoleAccountDao implements MethodDao<RoleAccount>{

    @Override
    public List<RoleAccount> getAll() {
        String query = "SELECT * FROM dbo.role_Account";
        List<RoleAccount> list = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            while (rs != null && rs.next()) {
                RoleAccount roleAccount = RoleAccount.builder()
                        .id(rs.getInt(1))
                        .role(rs.getString(2))
                        .build();
                list.add(roleAccount);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public RoleAccount getOne(int id) {
        String query = "SELECT * FROM dbo.role_Account WHERE id =?";
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, id);
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    RoleAccount roleAccount = RoleAccount.builder()
                            .id(rs.getInt(1))
                            .role(rs.getString(2))
                            .build();
                    return roleAccount;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public boolean add(RoleAccount object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(RoleAccount object, int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean remove(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
