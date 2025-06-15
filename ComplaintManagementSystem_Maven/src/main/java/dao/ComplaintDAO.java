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

    public static List<Complaint> getComplaintsByUserId(int userId) {
        List<Complaint> list = new ArrayList<>();
        try (Connection conn = DBConnection.getDataSource().getConnection();
             PreparedStatement ps = conn.prepareStatement(
                     "SELECT * FROM complaints WHERE user_id = ?"
             )) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Complaint c = new Complaint(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getInt("user_id"),
                        rs.getString("status")
                );
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public static List<Complaint> getAllComplaints() {
        List<Complaint> list = new ArrayList<>();
        try (Connection conn = DBConnection.getDataSource().getConnection();
             PreparedStatement ps = conn.prepareStatement(
                     "SELECT * FROM complaints"
             )) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Complaint c = new Complaint(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getInt("user_id"),
                        rs.getString("status")
                );
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static boolean updateComplaintStatus(int id, String status) {  // Remove remarks parameter
        try (Connection conn = DBConnection.getDataSource().getConnection();
             PreparedStatement ps = conn.prepareStatement(
                     "UPDATE complaints SET status = ? WHERE id = ?"  // Remove remarks from query
             )) {
            ps.setString(1, status);
            ps.setInt(2, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean deleteComplaint(int id) {
        try (Connection conn = DBConnection.getDataSource().getConnection();
             PreparedStatement ps = conn.prepareStatement(
                     "DELETE FROM complaints WHERE id = ?"
             )) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


}
