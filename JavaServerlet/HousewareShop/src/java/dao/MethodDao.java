/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;

/**
 * Interface common method database access object.
 *
 * @param <T> object
 */
public interface MethodDao<T> {

    /**
     * Get list data.
     *
     * @return list object
     */
    List<T> getAll();

    /**
     * Get one data by id.
     *
     * @param id of object
     * @return object
     */
    T getOne(int id);

    /**
     * Add object to database.
     *
     * @param object insert to database
     * @return       true if add object successful 
     *               false if add object fail
     */
    boolean add(T object);

    /**
     * Update object in database.
     *
     * @param object need update
     * @param id     of object need update
     * @return       true if update object successful 
     *               false if update object fail
     */
    boolean update(T object, int id);

    /**
     * Delete object in database.
     *
     * @param id     of object need delete
     * @return       true if delete object successful 
     *               false if delete object fail
     */
    boolean remove(int id);
}