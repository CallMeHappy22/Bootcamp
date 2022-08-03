/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author win
 */
@Getter
@Setter
@Builder
@ToString
public class Category {

    private int id;
    private String categoryName;
    private int status;

    public List<SubCategory> getListSubCategories() {
        try {
            List<SubCategory> list = new ArrayList<>();
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "select s.*, category_name \n"
                    + "from sub_category s \n"
                    + "inner join category c on s.category_id=c.id\n"
                    + "where s.category_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, this.id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SubCategory subCategory = SubCategory.builder()
                        .id(rs.getInt(1))
                        .category(Category.builder()
                                .id(rs.getInt(2))
                                .categoryName(rs.getString(5))
                                .build())
                        .subCategoryName(rs.getString(3))
                        .status(rs.getInt(4))
                        .build();
                list.add(subCategory);
            }
            return list;
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return null;
    }

}
