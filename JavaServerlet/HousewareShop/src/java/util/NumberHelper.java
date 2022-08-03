/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

/**
 *
 * @author ThinkPro
 */
public class NumberHelper {
    public static int getInt(String strNumber){
        int num = -1;
        try {
            num = Integer.parseInt(strNumber);
        } catch (NumberFormatException e) {
//            e.printStackTrace(System.out);
            num=-1;
        }
        return num;
    }
    public static double getDouble(String strNumber){
        double num = -1;
        try {
            num = Double.parseDouble(strNumber);
        } catch (NumberFormatException e) {
//            e.printStackTrace(System.out);
            num=-1;
        }
        return num;
    }
}
