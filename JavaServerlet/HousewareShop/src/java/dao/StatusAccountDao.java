/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.StatusAccount;
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
public class StatusAccountDao implements MethodDao<StatusAccount> {

    @Override
    public List<StatusAccount> getAll() {
        String query = "SELECT * FROM dbo.status_Account";
        List<StatusAccount> list = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            while (rs != null && rs.next()) {
                StatusAccount statusAccount = StatusAccount.builder()
                        .id(rs.getInt(1))
                        .status(rs.getString(2))
                        .build();
                list.add(statusAccount);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public StatusAccount getOne(int id) {
        String query = "SELECT * FROM dbo.status_Account WHERE id =?";
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, id);
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    StatusAccount statusAccount = StatusAccount.builder()
                            .id(rs.getInt(1))
                            .status(rs.getString(2))
                            .build();
                    return statusAccount;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public boolean add(StatusAccount object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(StatusAccount object, int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean remove(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
