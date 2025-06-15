package dao;

import model.Complaint;

import java.sql.*;
import java.util.*;

public class ComplaintDAO {
    public static void saveComplaint(Complaint c) {
        try (Connection conn = DBConnection.getDataSource().getConnection();
             PreparedStatement ps = conn.prepareStatement(
                     "INSERT INTO complaints (title, description, user_id, status) VALUES (?, ?, ?, 'Pending')"
             )) {
            ps.setString(1, c.getTitle());
            ps.setString(2, c.getDescription());
            ps.setInt(3, c.getUserId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
