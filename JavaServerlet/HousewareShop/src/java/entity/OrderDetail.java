/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

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
public class OrderDetail {
    private int id;
    private int orderId;
    private int productId;
    private int quantity;
    private double productPrice;
    private String productName;
    private String productImage;

    private Order Order;
}
