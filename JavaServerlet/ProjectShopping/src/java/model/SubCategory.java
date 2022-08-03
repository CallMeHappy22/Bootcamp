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
@Builder
@ToString
public class SubCategory {
    private int id;
    private Category category;
    private String subCategoryName;
    private StatusSubCategory status;
    
 
}
