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
import model.StatusSubCategory;

/**
 *
 * @author win
 */
public class StatusSubCategoryDAO implements IMethodDAO<StatusSubCategory> {

    @Override
    public List<StatusSubCategory> getAll() {
        try {
            List<StatusSubCategory> list = new ArrayList<>();
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "select * from status_sub_category";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                StatusSubCategory statusSubCategory = StatusSubCategory.builder()
                        .id(rs.getInt(1))
                        .status(rs.getString(2)).build();
                list.add(statusSubCategory);
            }
            return list;
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public StatusSubCategory getOne(int id) {
        try {
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "select * from status_sub_category where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return StatusSubCategory.builder()
                        .id(rs.getInt(1))
                        .status(rs.getString(2)).build();
            }
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public boolean insert(StatusSubCategory t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(StatusSubCategory t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
