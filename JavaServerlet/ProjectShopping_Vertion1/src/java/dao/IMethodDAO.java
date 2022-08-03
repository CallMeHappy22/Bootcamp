/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;

/**
 *
 * @author win
 * @param <T>
 */
public interface IMethodDAO<T> {

    List<T> getAll();

    T getOne(int id);

    boolean insert(T t);

    boolean update(T t);

    boolean delete(int id);
}
