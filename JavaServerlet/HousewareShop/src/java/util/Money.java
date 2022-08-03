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
public class Money {
    public static String format(double money){
        return new DecimalFormat("###,###,###,### đ").format(money);
    }
}
