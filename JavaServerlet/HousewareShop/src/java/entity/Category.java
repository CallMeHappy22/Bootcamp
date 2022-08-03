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
import java.util.List;
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
public class Category {

    private int id;
    private String category;
    private int status;
    private List<SubCategory> listSubCategory;

    public static final int TOOL = 1;
    public static final int MEASUREMENT = 2;
    public static final int HOME_AND_GARDERN = 5;

    public static final int STATUS_SELLING = 1;
    public static final int STATUS_SALLING = 2;
    public static final int STATUS_FREE_SHIP = 3;
    public static final int STATUS_OUT_OF_STOCK = 4;
    public static final int STATUS_STOP_BUSINESS = 5;

    public StatusCategory getStatus(int id) {
        String query = "SELECT * FROM dbo.status_category WHERE id =? ";
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, this.status);
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    StatusCategory statusCategory = StatusCategory.builder()
                            .id(rs.getInt(1))
                            .status(rs.getString(2))
                            .build();
                    return statusCategory;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }
}
