/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Image;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import jdbc.SQLConnection;

/**
 *
 * @author ThinkPro
 */
public class ProductDao implements MethodDao<Product> {

    /**
     * {@inheritDoc}
     */
    @Override
    public List<Product> getAll() {
        String query = "SELECT * FROM product";
        List<Product> list = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            while (rs != null && rs.next()) {
                List<Image> listImage = new ImageDao().getAllImageByProductId(rs.getInt(1));
                Product product = Product.builder()
                        .id(rs.getInt(1))
                        .categoryId(rs.getInt(2))
                        .code(rs.getString(3))
                        .name(rs.getString(4))
                        .quantity(rs.getInt(5))
                        .price(rs.getDouble(6))
                        .description(rs.getString(7))
                        .image(rs.getString(8))
                        .createDate(rs.getString(9))
                        .status(rs.getInt(10))
                        .subCategoryId(rs.getInt(11))
                        .sale(rs.getDouble(12))
                        .listImage(listImage)
                        .build();

                Image image = Image.builder()
                        .productId(product.getId())
                        .imageName(product.getImage())
                        .status(1)
                        .build();
                product.getListImage().add(0, image);
                list.add(product);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public int countProduct() {
        String query = "SELECT COUNT(*) FROM dbo.product";
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            if (rs != null && rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    public List<Product> getAllPaging(int pageindex, int pagesize) {
        String query = "SELECT * FROM \n"
                + "(SELECT *,ROW_NUMBER() OVER (ORDER BY ID ASC) as row_num FROM  dbo.product) AS product\n"
                + "WHERE row_num >= (? - 1)*? +1 AND row_num<= ? * ?";
        List<Product> list = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, pageindex);
                ps.setObject(2, pagesize);
                ps.setObject(3, pageindex);
                ps.setObject(4, pagesize);
                ResultSet rs = (ps != null) ? ps.executeQuery() : null;
                while (rs != null && rs.next()) {
                    List<Image> listImage = new ImageDao().getAllImageByProductId(rs.getInt(1));
                    Product product = Product.builder()
                            .id(rs.getInt(1))
                            .categoryId(rs.getInt(2))
                            .code(rs.getString(3))
                            .name(rs.getString(4))
                            .quantity(rs.getInt(5))
                            .price(rs.getDouble(6))
                            .description(rs.getString(7))
                            .image(rs.getString(8))
                            .createDate(rs.getString(9))
                            .status(rs.getInt(10))
                            .subCategoryId(rs.getInt(11))
                            .sale(rs.getDouble(12))
                            .listImage(listImage)
                            .build();

                    Image image = Image.builder()
                            .productId(product.getId())
                            .imageName(product.getImage())
                            .status(1)
                            .build();
                    product.getListImage().add(0, image);
                    list.add(product);
                }
                return list;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public int countPage() {
        String query = "SELECT COUNT(*) as rownum FROM Product";
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ResultSet rs = (ps != null) ? ps.executeQuery() : null;
                if (rs != null && rs.next()) {
                    return rs.getInt(1);
                }

            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }

        return -1;
    }

    public List<Product> getAllByCategoryId(int categoryId) {
        String query = "SELECT * FROM product where category_id=?";
        List<Product> list = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, categoryId);
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    Product product = Product.builder()
                            .id(rs.getInt(1))
                            .categoryId(rs.getInt(2))
                            .code(rs.getString(3))
                            .name(rs.getString(4))
                            .quantity(rs.getInt(5))
                            .price(rs.getDouble(6))
                            .description(rs.getString(7))
                            .image(rs.getString(8))
                            .createDate(rs.getString(9))
                            .status(rs.getInt(10))
                            .subCategoryId(rs.getInt(11))
                            .sale(rs.getDouble(12))
                            .build();
                    list.add(product);
                }
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public List<Product> getAllByCategoryIdPaging(int categoryId, int pageindex, int pagesize) {
        String query = "SELECT * FROM\n"
                + "(SELECT *,ROW_NUMBER() OVER (ORDER BY ID ASC) as row_num FROM  product where category_id=?)AS product\n"
                + "WHERE row_num >= (? - 1)*? +1 AND row_num<= ? * ?";
        List<Product> list = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, categoryId);
                ps.setObject(2, pageindex);
                ps.setObject(3, pagesize);
                ps.setObject(4, pageindex);
                ps.setObject(5, pagesize);
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    Product product = Product.builder()
                            .id(rs.getInt(1))
                            .categoryId(rs.getInt(2))
                            .code(rs.getString(3))
                            .name(rs.getString(4))
                            .quantity(rs.getInt(5))
                            .price(rs.getDouble(6))
                            .description(rs.getString(7))
                            .image(rs.getString(8))
                            .createDate(rs.getString(9))
                            .status(rs.getInt(10))
                            .subCategoryId(rs.getInt(11))
                            .sale(rs.getDouble(12))
                            .build();
                    list.add(product);
                }
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public int countPageByCategory(int id) {
        String query = "SELECT COUNT(*) as rownum FROM Product where category_id=?";
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, id);
                ResultSet rs = (ps != null) ? ps.executeQuery() : null;
                if (rs != null && rs.next()) {
                    return rs.getInt(1);
                }

            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }

        return -1;
    }

    public List<Product> getAllBySubCategoryId(int subCategoryId) {
        String query = "SELECT * FROM product where sub_category_id=?";
        List<Product> list = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, subCategoryId);
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    Product product = Product.builder()
                            .id(rs.getInt(1))
                            .categoryId(rs.getInt(2))
                            .code(rs.getString(3))
                            .name(rs.getString(4))
                            .quantity(rs.getInt(5))
                            .price(rs.getDouble(6))
                            .description(rs.getString(7))
                            .image(rs.getString(8))
                            .createDate(rs.getString(9))
                            .status(rs.getInt(10))
                            .subCategoryId(rs.getInt(11))
                            .sale(rs.getDouble(12))
                            .build();
                    list.add(product);
                }
            }
            return list;
        } catch (SQLException e) {
//            e.printStackTrace(System.out);
        }
        return null;
    }

    public List<Product> getAllBySubCategoryIdPaging(int subCategoryId, int pageindex, int pagesize) {
        String query = "SELECT * FROM\n"
                + "(SELECT *,ROW_NUMBER() OVER (ORDER BY ID ASC) as row_num FROM  product where sub_category_id=?)AS product\n"
                + "WHERE row_num >= (? - 1)*? +1 AND row_num<= ? * ?";
        List<Product> list = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, subCategoryId);
                ps.setObject(2, pageindex);
                ps.setObject(3, pagesize);
                ps.setObject(4, pageindex);
                ps.setObject(5, pagesize);
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    Product product = Product.builder()
                            .id(rs.getInt(1))
                            .categoryId(rs.getInt(2))
                            .code(rs.getString(3))
                            .name(rs.getString(4))
                            .quantity(rs.getInt(5))
                            .price(rs.getDouble(6))
                            .description(rs.getString(7))
                            .image(rs.getString(8))
                            .createDate(rs.getString(9))
                            .status(rs.getInt(10))
                            .subCategoryId(rs.getInt(11))
                            .sale(rs.getDouble(12))
                            .build();
                    list.add(product);
                }
            }
            return list;
        } catch (SQLException e) {
//            e.printStackTrace(System.out);
        }
        return null;
    }

    public int countPageBySubCategory(int id) {
        String query = "SELECT COUNT(*) as rownum FROM Product where sub_category_id=?";
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, id);
                ResultSet rs = (ps != null) ? ps.executeQuery() : null;
                if (rs != null && rs.next()) {
                    return rs.getInt(1);
                }

            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }

        return -1;
    }

    public List<Product> search(String text, int pageindex, int pagesize) {
        String query = "SELECT * FROM\n"
                + "(SELECT *,ROW_NUMBER() OVER (ORDER BY ID ASC) as row_num \n"
                + "FROM dbo.product WHERE name LIKE ?) AS product \n"
                + "WHERE row_num >= (? - 1)*? +1 AND row_num<= ? * ?";
        List<Product> list = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, "%" + text + "%");
                ps.setObject(2, pageindex);
                ps.setObject(3, pagesize);
                ps.setObject(4, pageindex);
                ps.setObject(5, pagesize);
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    Product product = Product.builder()
                            .id(rs.getInt(1))
                            .categoryId(rs.getInt(2))
                            .code(rs.getString(3))
                            .name(rs.getString(4))
                            .quantity(rs.getInt(5))
                            .price(rs.getDouble(6))
                            .description(rs.getString(7))
                            .image(rs.getString(8))
                            .createDate(rs.getString(9))
                            .status(rs.getInt(10))
                            .subCategoryId(rs.getInt(11))
                            .sale(rs.getDouble(12))
                            .build();
                    list.add(product);
                }
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public int countProductWhenSearch(String text) {
        String query = "SELECT COUNT(*) FROM dbo.product WHERE name LIKE ?";
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setString(1, "%" + text + "%");
                ResultSet rs = (ps != null) ? ps.executeQuery() : null;
                if (rs != null && rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    public List<Product> sortByNameAsc() {
        String query = "SELECT * FROM dbo.product ORDER BY name ASC";
        List<Product> list = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            while (rs != null && rs.next()) {
                Product product = Product.builder()
                        .id(rs.getInt(1))
                        .categoryId(rs.getInt(2))
                        .code(rs.getString(3))
                        .name(rs.getString(4))
                        .quantity(rs.getInt(5))
                        .price(rs.getDouble(6))
                        .description(rs.getString(7))
                        .image(rs.getString(8))
                        .createDate(rs.getString(9))
                        .status(rs.getInt(10))
                        .subCategoryId(rs.getInt(11))
                        .sale(rs.getDouble(12))
                        .build();
                list.add(product);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public List<Product> sortByDateDsC() {
        String query = "SELECT * FROM dbo.product ORDER BY create_date DESC";
        List<Product> list = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            while (rs != null && rs.next()) {
                Product product = Product.builder()
                        .id(rs.getInt(1))
                        .categoryId(rs.getInt(2))
                        .code(rs.getString(3))
                        .name(rs.getString(4))
                        .quantity(rs.getInt(5))
                        .price(rs.getDouble(6))
                        .description(rs.getString(7))
                        .image(rs.getString(8))
                        .createDate(rs.getString(9))
                        .status(rs.getInt(10))
                        .subCategoryId(rs.getInt(11))
                        .sale(rs.getDouble(12))
                        .build();
                list.add(product);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public List<Product> getAllFreeShip() {
        String query = "SELECT * FROM dbo.product WHERE status=3";
        List<Product> list = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            while (rs != null && rs.next()) {
                Product product = Product.builder()
                        .id(rs.getInt(1))
                        .categoryId(rs.getInt(2))
                        .code(rs.getString(3))
                        .name(rs.getString(4))
                        .quantity(rs.getInt(5))
                        .price(rs.getDouble(6))
                        .description(rs.getString(7))
                        .image(rs.getString(8))
                        .createDate(rs.getString(9))
                        .status(rs.getInt(10))
                        .subCategoryId(rs.getInt(11))
                        .sale(rs.getDouble(12))
                        .build();
                list.add(product);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public List<Product> getAllByRangeMoney(double min, double max) {
        String query = "SELECT * FROM dbo.product WHERE price >? and price < ?";
        List<Product> list = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, min);
                ps.setObject(2, max);
                ResultSet rs = ps.executeQuery();

                while (rs != null && rs.next()) {
                    Product product = Product.builder()
                            .id(rs.getInt(1))
                            .categoryId(rs.getInt(2))
                            .code(rs.getString(3))
                            .name(rs.getString(4))
                            .quantity(rs.getInt(5))
                            .price(rs.getDouble(6))
                            .description(rs.getString(7))
                            .image(rs.getString(8))
                            .createDate(rs.getString(9))
                            .status(rs.getInt(10))
                            .subCategoryId(rs.getInt(11))
                            .sale(rs.getDouble(12))
                            .build();
                    list.add(product);
                }
                return list;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public List<Product> sortAllAttribute(int price, double min, double max, boolean news, boolean free, int pageindex, int pagesize) {
        String query = "SELECT * FROM (SELECT *,ROW_NUMBER() OVER (ORDER BY ID ASC) as row_num FROM  product";
        int check = 0;
        if (free) {
            query += " where status=3";
            check = 1;
        }
        if (price != -1) {
            if (check == 0) {
                query += " where";
                check = 1;
            } else {
                query += " and";
            }
            query += " price >? and price <=?";
        }
        query += ")as product WHERE row_num >= (? - 1)*? +1 AND row_num<= ? * ?";
        if (news) {
            query += " ORDER BY create_date DESC";
        }
        System.out.println("query = " + query);
        List<Product> list = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                if (price != -1) {
                    ps.setObject(1, min);
                    ps.setObject(2, max);
                    ps.setObject(3, pageindex);
                    ps.setObject(4, pagesize);
                    ps.setObject(5, pageindex);
                    ps.setObject(6, pagesize);
                } else {
                    ps.setObject(1, pageindex);
                    ps.setObject(2, pagesize);
                    ps.setObject(3, pageindex);
                    ps.setObject(4, pagesize);
                }
                ResultSet rs = ps.executeQuery();

                while (rs != null && rs.next()) {
                    Product product = Product.builder()
                            .id(rs.getInt(1))
                            .categoryId(rs.getInt(2))
                            .code(rs.getString(3))
                            .name(rs.getString(4))
                            .quantity(rs.getInt(5))
                            .price(rs.getDouble(6))
                            .description(rs.getString(7))
                            .image(rs.getString(8))
                            .createDate(rs.getString(9))
                            .status(rs.getInt(10))
                            .subCategoryId(rs.getInt(11))
                            .sale(rs.getDouble(12))
                            .build();
                    list.add(product);
                }
                return list;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;

    }

    public int countPageByAllAttribute(int price, double min, double max, boolean news, boolean free) {
        String query = "SELECT COUNT(*) as rownum FROM Product";
        int check = 0;
        if (free) {
            query += " where status=3";
            check = 1;
        }
        if (price != -1) {
            if (check == 0) {
                query += " where";
                check = 1;
            } else {
                query += " and";
            }
            query += " price >? and price <=?";
        }
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                if (price != -1) {
                    ps.setObject(1, min);
                    ps.setObject(2, max);
                }
                ResultSet rs = (ps != null) ? ps.executeQuery() : null;
                if (rs != null && rs.next()) {
                    return rs.getInt(1);
                }

            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }

        return -1;
    }

    public List<Product> getAllProductAreSaling() {
        String query = "SELECT * FROM dbo.product WHERE status= ? ";
        List<Product> list = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setInt(1, Product.STATUS_SALLING);
            }
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            while (rs != null && rs.next()) {
                Product product = Product.builder()
                        .id(rs.getInt(1))
                        .categoryId(rs.getInt(2))
                        .code(rs.getString(3))
                        .name(rs.getString(4))
                        .quantity(rs.getInt(5))
                        .price(rs.getDouble(6))
                        .description(rs.getString(7))
                        .image(rs.getString(8))
                        .createDate(rs.getString(9))
                        .status(rs.getInt(10))
                        .subCategoryId(rs.getInt(11))
                        .sale(rs.getDouble(12))
                        .build();
                list.add(product);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public Product getOne(int id) {
        String query = "SELECT * FROM product WHERE id = ?";
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, id);
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    List<Image> listImage = new ImageDao().getAllImageByProductId(rs.getInt(1));
                    Product product = Product.builder()
                            .id(rs.getInt(1))
                            .categoryId(rs.getInt(2))
                            .code(rs.getString(3))
                            .name(rs.getString(4))
                            .quantity(rs.getInt(5))
                            .price(rs.getDouble(6))
                            .description(rs.getString(7))
                            .image(rs.getString(8))
                            .createDate(rs.getString(9))
                            .status(rs.getInt(10))
                            .subCategoryId(rs.getInt(11))
                            .sale(rs.getDouble(12))
                            .listImage(listImage)
                            .build();
                    Image image = Image.builder()
                            .productId(product.getId())
                            .imageName(product.getImage())
                            .status(1)
                            .build();
                    product.getListImage().add(0, image);

                    return product;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public boolean add(Product obj) {
        String query = "INSERT INTO product(category_id, code, name, quantity, price,"
                + " description, image, status, sub_category_id, sale)"
                + " VALUES(?, ?, ?, ?, ?, ?, ?, ?,?,?)";
        int check = 0;
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, obj.getCategoryId());
                ps.setObject(2, obj.getCode());
                ps.setObject(3, obj.getName());
                ps.setObject(4, obj.getQuantity());
                ps.setObject(5, obj.getPrice());
                ps.setObject(6, obj.getDescription());
                ps.setObject(7, obj.getImage());
                ps.setObject(8, obj.getStatus());
                ps.setObject(9, obj.getSubCategoryId());
                ps.setObject(10, obj.getSale());
                check = ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    /**
     * {@inheritDoc}
     */
    public int addProductReturnProductId(Product obj) {
        String query = "INSERT INTO product(category_id, code, name, quantity, price,"
                + " description, image, status, sub_category_id, sale)"
                + " VALUES(?, ?, ?, ?, ?, ?, ?, ?,?,?)";
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS) : null;) {
            if (ps != null) {
                ps.setObject(1, obj.getCategoryId());
                ps.setObject(2, obj.getCode());
                ps.setObject(3, obj.getName());
                ps.setObject(4, obj.getQuantity());
                ps.setObject(5, obj.getPrice());
                ps.setObject(6, obj.getDescription());
                ps.setObject(7, obj.getImage());
                ps.setObject(8, obj.getStatus());
                ps.setObject(9, obj.getSubCategoryId());
                ps.setObject(10, obj.getSale());
                int isCheck = ps.executeUpdate();
                if (isCheck > 0) {
                    ResultSet rs = ps.getGeneratedKeys();
                    rs.next();
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    @Override
    public boolean update(Product obj, int id) {
        String query = "UPDATE product SET category_id = ?, code = ?, name = ?,"
                + "quantity = ?, price = ?, description = ?, image = ?,"
                + "status = ?, sub_category_id = ?, sale = ? WHERE id = ?";
        int check = 0;
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, obj.getCategoryId());
                ps.setObject(2, obj.getCode());
                ps.setObject(3, obj.getName());
                ps.setObject(4, obj.getQuantity());
                ps.setObject(5, obj.getPrice());
                ps.setObject(6, obj.getDescription());
                ps.setObject(7, obj.getImage());
                ps.setObject(8, obj.getStatus());
                ps.setObject(9, obj.getSubCategoryId());
                ps.setObject(10, obj.getSale());
                ps.setObject(11, id);
                check = ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public boolean updateNameAndDescription(String name, double price, String description, int id) {
        String query = " UPDATE product SET name = ?, price = ?, description = ? WHERE id = ? ";
        int check = 0;
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setString(1, name);
                ps.setDouble(2, price);
                ps.setString(3, description);
                ps.setInt(4, id);
                check = ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public static void main(String[] args) {
        List<String> listName = Arrays.asList("Bộ dao đa năng", "Máy hút bụi", "Máy lọc nước",
                "Dụng cụ đựng rau", "Thảm trải nhà", "Dung cụ lau nhà",
                "Dụng cụ đào bới", "Máy vắt cam", "Máy say sinh tố", "Máy đánh trứng");
        String description = "- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>"
                + "- Thiết kế nhiều mẫu mã<br/>"
                + "- Sản phẩm bền đẹp<br/>"
                + "- Tiện lợi cho việc di chuyển";

        List<String> listUpdateName = new ArrayList<>();
        int count = 0;
        for (int i = 0; i < 160; i++) {
            if (count == 10) {
                count = 0;
            }
            listUpdateName.add(listName.get(count));
            count++;
        }
        ProductDao productDao = new ProductDao();
        Random rand = new Random();
        int id = 31;
        for (String name : listUpdateName) {
            int price = 150 + rand.nextInt(351);
            productDao.updateNameAndDescription(name, price * 1000, description, id++);
        }

    }

    /**
     * {@inheritDoc}
     */
    @Override
    public boolean remove(int id) {
        String query = "DELETE FROM product WHERE id = ?";
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setInt(1, id);
                return ps.executeUpdate() > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return false;
    }

    public List<Integer> countProductGroupByCategoryId() {
        String query = "SELECT COUNT(*) FROM dbo.product GROUP BY category_id ORDER BY category_id asc";
        List<Integer> list = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ResultSet rs = (ps != null) ? ps.executeQuery() : null;
                while (rs != null && rs.next()) {

                    list.add(rs.getInt(1));
                }
                return list;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

}
