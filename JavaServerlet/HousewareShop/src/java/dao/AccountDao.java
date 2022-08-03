/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import jdbc.SQLConnection;
import util.StringHelper;

/**
 *
 * @author ThinkPro
 */
public class AccountDao implements MethodDao<Account> {

    @Override
    public List<Account> getAll() {
        String sql = "SELECT * FROM Account";
        List<Account> list = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(sql) : null;) {
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            while (rs != null && rs.next()) {
                Account account = Account.builder()
                        .userName(rs.getString(1))
                        .password(rs.getString(2))
                        .displayName(rs.getString(3))
                        .address(rs.getString(4))
                        .email(rs.getString(5))
                        .phone(rs.getString(6))
                        .roleId(rs.getInt(7))
                        .status(rs.getInt(8))
                        .createDate(rs.getString(9))
                        .activeCode(rs.getString(10))
                        .build();
                list.add(account);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public int countAccount() {
        String query = "SELECT COUNT(*) FROM Account";
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

    @Override
    public Account getOne(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public Account getOne(String username) {
        String query = "SELECT * FROM Account WHERE userName =?";
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, username);
                ResultSet rs = ps.executeQuery();
                if (rs != null && rs.next()) {
                    Account account = Account.builder()
                            .userName(rs.getString(1))
                            .password(rs.getString(2))
                            .displayName(rs.getString(3))
                            .address(rs.getString(4))
                            .email(rs.getString(5))
                            .phone(rs.getString(6))
                            .roleId(rs.getInt(7))
                            .status(rs.getInt(8))
                            .createDate(rs.getString(9))
                            .activeCode(rs.getString(10))
                            .build();
                    return account;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public Account login(String username, String password) {
        String query = "SELECT * FROM Account WHERE userName = ? and password = ?";
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, username);
                ps.setObject(2, password);
                ResultSet rs = ps.executeQuery();
                if (rs != null && rs.next()) {
                    Account account = Account.builder()
                            .userName(rs.getString(1))
                            .password(rs.getString(2))
                            .displayName(rs.getString(3))
                            .address(rs.getString(4))
                            .email(rs.getString(5))
                            .phone(rs.getString(6))
                            .roleId(rs.getInt(7))
                            .status(rs.getInt(8))
                            .createDate(rs.getString(9))
                            .activeCode(rs.getString(10))
                            .build();
                    return account;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public Account getOneByEmail(String email) {
        String query = "SELECT * FROM Account WHERE email =?";
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, email);
                ResultSet rs = ps.executeQuery();
                if (rs != null && rs.next()) {
                    Account account = Account.builder()
                            .userName(rs.getString(1))
                            .password(rs.getString(2))
                            .displayName(rs.getString(3))
                            .address(rs.getString(4))
                            .email(rs.getString(5))
                            .phone(rs.getString(6))
                            .roleId(rs.getInt(7))
                            .status(rs.getInt(8))
                            .createDate(rs.getString(9))
                            .activeCode(rs.getString(10))
                            .build();
                    return account;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public boolean add(Account obj) {
        String query = "INSERT INTO [dbo].[Account]\n"
                + "           ([userName]\n"
                + "           ,[password]\n"
                + "           ,[displayName]\n"
                + "           ,[address]\n"
                + "           ,[email]\n"
                + "           ,[phone]\n"
                + "           ,[role_id]\n"
                + "           ,[status]\n"
                + "           ,[active_code])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?)";
        int check = 0;

        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, obj.getUserName());
                ps.setObject(2, obj.getPassword());
                ps.setObject(3, obj.getDisplayName());
                ps.setObject(4, obj.getAddress());
                ps.setObject(5, obj.getEmail());
                ps.setObject(6, obj.getPhone());
                ps.setObject(7, obj.getRoleId());
                ps.setObject(8, obj.getStatus());
                ps.setObject(9, obj.getActiveCode());
                check = ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public boolean update(Account object, String username) {
        String query = "UPDATE [dbo].[Account]\n"
                + "   SET[displayName] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[role_id] = ?\n"
                + "      ,[status] = ?\n"
                + "      ,[password] = ?\n"
                + " WHERE userName =?";
        int check = 0;
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, object.getDisplayName());
                ps.setObject(2, object.getAddress());
                ps.setObject(3, object.getEmail());
                ps.setObject(4, object.getPhone());
                ps.setObject(5, object.getRoleId());
                ps.setObject(6, object.getStatus());
                ps.setObject(7, object.getPassword());
                ps.setObject(8, username);
                check = ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public String generateActiveCode(String username) {
        String query = "UPDATE [dbo].[Account]\n"
                + "   SET[active_code] = ?\n"
                + " WHERE userName =? ";
        String activeCode = StringHelper.generateActiveCode();
        int check = 0;
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, activeCode);
                ps.setObject(2, username);
                check = ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0 ? activeCode : null;
    }

    public boolean updateStatus(String username, int status) {
        String query = "UPDATE dbo.Account\n"
                + "SET status = ? \n"
                + "WHERE userName=?";
        int check = 0;
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, status);
                ps.setObject(2, username);
                check = ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    @Override
    public boolean remove(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public boolean removebyUser(String user) {
        String query = "DELETE FROM dbo.Account WHERE userName = ?";
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, user);
                return ps.execute();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return false;
    }

    public static void main(String[] args) {

        Account A = Account.builder()
                .userName("A")
                .password("12345")
                .displayName("A")
                .email("quan@gmail.com")
                .phone("333444555")
                .build();
        AccountDao dao = new AccountDao();
        boolean check = dao.add(A);
        if (check) {
            System.out.println(A.toString());
        }

    }

    @Override
    public boolean update(Account object, int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
