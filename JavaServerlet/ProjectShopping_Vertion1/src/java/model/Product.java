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
    private String code;
    private String name;
    private int quantity;
    private double price;
    private String description;
    private String imageUrl;
    private String createDate;
    private int status;
    private int subCategoryId;
    private double sale;
    
    
}
