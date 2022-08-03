/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
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
public class Cart implements Serializable{
    
    private int productId;
    private String productName;
    private String productImg;
    private double productPrice;
    private int productQuantity;
    private int quantity;
    private double totalPrice;
}
