/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jdbc.SQLConnection;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author ThinkPro
 */

@Getter
@Setter
@Builder
@ToString
public class SubCategory {
    private int id;
    private int categoryId;
    private String subCategoryName;
    private int status;
    
    public static final int STATUS_SELLING = 1;
    public static final int STATUS_SALLING= 2;
    public static final int STATUS_FREE_SHIP = 3;
    public static final int STATUS_OUT_OF_STOCK = 4;
    public static final int STATUS_STOP_BUSINESS = 5;
    
    public Category getCategory(int id) {
        String query = "SELECT * FROM Category WHERE id = ?";
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, this.categoryId);
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    Category category =Category.builder()
                        .id(rs.getInt(1))
                        .category(rs.getString(2))
                        .status(rs.getInt(3))
                        .build();
                    return category;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }
    
    public StatusSubCategory getStatus(int id) {
        String query = "SELECT * FROM dbo.status_sub_category WHERE id =?";
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, id);
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    StatusSubCategory statusSubCategory = StatusSubCategory.builder()
                            .id(rs.getInt(1))
                            .status(rs.getString(2))
                            .build();
                    return statusSubCategory;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }
    
}
