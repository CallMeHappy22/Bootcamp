/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.ThongkeOrder;
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
public class ThongKeOrderDao {

    public List<ThongkeOrder> getAll() {
        String sql = "select distinct DATENAME(dw,T.create_date) AS [weekday],T.subday , T.totalMoney,\n"
                + "	T.create_date, count(T.create_date) as numOfOrder\n"
                + "	from \n"
                + "	(SELECT create_date, DATEDIFF(day, GETDATE(), create_date) as subday , T2.totalMoney\n"
                + "	FROM [order],\n"
                + "		( SELECT create_date as cdate,SUM(total_price) AS totalMoney FROM  [order]\n"
                + "		Group by create_date)T2 \n"
                + "	WHERE DATEDIFF(day, GETDATE(), create_date)>= -7 and DATEDIFF(day, GETDATE(), create_date) <= 0\n"
                + "	and create_date= T2.cdate)T\n"
                + "	group by T.create_date,T.subday , T.totalMoney";
        List<ThongkeOrder> list = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(sql) : null;) {
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            while (rs != null && rs.next()) {
                ThongkeOrder thongkeOrder = ThongkeOrder.builder()
                        .day(rs.getInt("subDay"))
                        .thu(rs.getString("weekday"))
                        .numOfOrder(rs.getInt("numOfOrder"))
                        .totalMoney(rs.getDouble("totalMoney"))
                        .build();
                list.add(thongkeOrder);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }
}
