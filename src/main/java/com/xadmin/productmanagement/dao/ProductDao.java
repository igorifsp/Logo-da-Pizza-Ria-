package com.xadmin.productmanagement.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.xadmin.productmanagement.bean.Product;

public class ProductDao {

    private static final String URL = "jdbc:mysql://localhost:3306/produto";
    private static final String USUARIO = "root";
    private static final String SENHA = "";

    private static final String INSERT_PRODUCTS_SQL = "INSERT INTO products"
            + "  (codProd, nome, descricao, marca, estoque, preco) VALUES " + " (?, ?, ?, ?, ?, ?);";

    private static final String SELECT_PRODUCT_BY_ID = "SELECT id, codProd, nome, descricao, marca, estoque, preco FROM products WHERE id = ?";
    private static final String SELECT_ALL_PRODUCTS = "SELECT * FROM products";
    private static final String DELETE_PRODUCTS_SQL = "DELETE FROM products WHERE id = ?";
    private static final String UPDATE_PRODUCTS_SQL = "UPDATE products SET codProd = ?, nome = ?, descricao = ?, marca = ?, estoque = ?, preco = ? WHERE id = ?";
    private static final String SELECT_PRODUCTS_PAGINATED = "SELECT * FROM products LIMIT ?, ?";
    private static final String SELECT_TOTAL_PRODUCTS = "SELECT COUNT(*) FROM products";

    public ProductDao() {
    }

    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USUARIO, SENHA);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void insertProduct(Product product) throws SQLException {
        try (Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCTS_SQL)) {
            preparedStatement.setInt(1, product.getCodProd());
            preparedStatement.setString(2, product.getNome());
            preparedStatement.setString(3, product.getDescricao());
            preparedStatement.setString(4, product.getMarca());
            preparedStatement.setInt(5, product.getEstoque());
            preparedStatement.setDouble(6, product.getPreco());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            if (isDuplicateKeyError(e)) {
                throw new SQLException("Já existe um produto com este código.");
            } else {
                throw e;
            }
        }
    }

    public Product selectProduct(int id) {
        Product product = null;
        try (Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int codProd = rs.getInt("codProd");
                String nome = rs.getString("nome");
                String descricao = rs.getString("descricao");
                String marca = rs.getString("marca");
                int estoque = rs.getInt("estoque");
                double preco = rs.getDouble("preco");
                product = new Product(id, codProd, nome, descricao, marca, estoque, preco);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return product;
    }

    public List<Product> selectAllProducts() {
        List<Product> products = new ArrayList<>();
        try (Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCTS)) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                int codProd = rs.getInt("codProd");
                String nome = rs.getString("nome");
                String descricao = rs.getString("descricao");
                String marca = rs.getString("marca");
                int estoque = rs.getInt("estoque");
                double preco = rs.getDouble("preco");
                products.add(new Product(id, codProd, nome, descricao, marca, estoque, preco));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return products;
    }

    public List<Product> selectProductsPaginated(int start, int recordsPerPage) {
        List<Product> products = new ArrayList<>();
        try (Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCTS_PAGINATED)) {
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, recordsPerPage);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                int codProd = rs.getInt("codProd");
                String nome = rs.getString("nome");
                String descricao = rs.getString("descricao");
                String marca = rs.getString("marca");
                int estoque = rs.getInt("estoque");
                double preco = rs.getDouble("preco");
                products.add(new Product(id, codProd, nome, descricao, marca, estoque, preco));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return products;
    }

    public int getTotalProducts() {
        int total = 0;
        try (Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TOTAL_PRODUCTS)) {
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return total;
    }

    public boolean deleteProduct(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(DELETE_PRODUCTS_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateProduct(Product product) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(UPDATE_PRODUCTS_SQL)) {
            statement.setInt(1, product.getCodProd());
            statement.setString(2, product.getNome());
            statement.setString(3, product.getDescricao());
            statement.setString(4, product.getMarca());
            statement.setInt(5, product.getEstoque());
            statement.setDouble(6, product.getPreco());
            statement.setInt(7, product.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

    private boolean isDuplicateKeyError(SQLException e) {
        String sqlState = e.getSQLState();
        return sqlState != null && sqlState.equals("23000") && e.getErrorCode() == 1062;
    }
}
