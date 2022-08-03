/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.List;
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
@Builder //Dùng để tạo đối tượng thay cho constructor(Design pattern):
            //  +Khắc phục 1 số nhược điểm của constructor
            //  +Giúp tạo đối tượng cực kì linh hoạt
@ToString
public class Product {
    private int id;
    private int categoryId;
    private String code;
    private String name;
    private int quantity;
    private double price;
    private String description;
    private String image;
    private String createDate;
    private int status;
    private int subCategoryId;
    private List<Image> listImage;
    private double sale;
    
    
    public static final int STATUS_SELLING = 1;
    public static final int STATUS_SALLING= 2;
    public static final int STATUS_FREE_SHIP = 3;
    public static final int STATUS_OUT_OF_STOCK = 4;
    public static final int STATUS_STOP_BUSINESS = 5;

    public String getDisplayPrice(){
        return String.format("%,.0f", price).replace(",", ".");
    }
    
    
}
