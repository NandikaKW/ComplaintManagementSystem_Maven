package dao;

import org.apache.commons.dbcp2.BasicDataSource;

import javax.sql.DataSource;

public class DBConnection {
    private static final BasicDataSource ds = new BasicDataSource();

    static {
        ds.setUrl("jdbc:mysql://localhost:3306/complaint_db");
        ds.setUsername("root");
        ds.setPassword("Ijse@1234");
        ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
        ds.setMinIdle(5);
        ds.setMaxIdle(10);
        ds.setMaxOpenPreparedStatements(100);
    }

    public static DataSource getDataSource() {
        return ds;
    }

    private DBConnection() {

    }
}
