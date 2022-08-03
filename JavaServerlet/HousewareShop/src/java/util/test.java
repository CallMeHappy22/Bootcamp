/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.text.DecimalFormat;

/**
 *
 * @author win
 */
public class test {
    public static void main(String[] args) {
        double money =150000000.0;
        DecimalFormat df = new DecimalFormat("###,###,###,### đ");
        System.out.println(df.format(money));
        
    }
}
