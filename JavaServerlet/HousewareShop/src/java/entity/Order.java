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
import java.util.ArrayList;
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
public class Order {

    private int id;
    private String Customer;
    private int shippingId;
    private String createDate;
    private double totalPrice;
    private String note;
    private int status;

    private Shipping Shipping;

    private StatusOrder statusOrder;

    public static final int STATUS_WAITING = 1;
    public static final int STATUS_ACCEPTED = 2;
    public static final int STATUS_SHIPPING = 3;
    public static final int STATUS_ONLINE = 4;
    public static final int STATUS_SUCCESS = 5;
}
