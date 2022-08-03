/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

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
public class Order {

    private int id;
    private String customer;
    private int shippingId;
    private String createdDate;
    private double totalPrice;
    private String note;
    private int status;
}
