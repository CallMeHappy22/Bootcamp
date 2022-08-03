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
import java.util.ArrayList;
import java.util.List;
import model.StatusCategory;

/**
 *
 * @author win
 */
public class StatusCategoryDAO implements IMethodDAO<StatusCategory> {

    @Override
    public List<StatusCategory> getAll() {
        try {
            List<StatusCategory> list = new ArrayList<>();
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "select * from status_category";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                StatusCategory statusCategory = StatusCategory.builder()
                        .id(rs.getInt(1))
                        .status(rs.getString(2)).build();
                list.add(statusCategory);
            }
            return list;
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public StatusCategory getOne(int id) {
        try {
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "select * from status_category where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return StatusCategory.builder()
                        .id(rs.getInt(1))
                        .status(rs.getString(2)).build();
            }
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public boolean insert(StatusCategory t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(StatusCategory t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
