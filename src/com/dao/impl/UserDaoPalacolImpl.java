package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.UserDaoPalacol;
import com.entity.UserPalacol;
import com.jdbc.connect.DBConnect;

public class UserDaoPalacolImpl implements UserDaoPalacol{

	@Override
	public List<UserPalacol> getAllUsers() {
		List<UserPalacol> result = new ArrayList<UserPalacol>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String query = "SELECT user_id, password, email, active_tag, access_level FROM SMS_USERS_1";
		
		try{
			DBConnect db = new DBConnect("192.10.10.253", "trng", "1521", "hr", "hr");
			conn = db.getConnection();
			conn.setAutoCommit(false);
			stmt = conn.prepareStatement(query);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				String user_id = rs.getString("user_id");
				String password = rs.getString("password");
				String email = rs.getString("email");
				String active_tag = rs.getString("active_tag");
				String access_level = rs.getString("access_level");
				UserPalacol user = new UserPalacol(user_id, password, email, active_tag, access_level);
				result.add(user);
			}//while
			
			//CLOSING JDBC RESOURCES
			if(conn!=null) {
				try {
					conn.close();
				} catch (SQLException e) {}
			}//closing conn
			
			if(stmt!=null) {
				try {
					stmt.close();
				} catch (SQLException e) {}
			}//closing stmt
			
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {}
			}//closing rs
			
			return result;
		}catch(Exception e){
			System.out.println(e.getMessage());
			System.out.println("Failed to connect to database");
			return null;
		}
	}//getAllUsers()

	@Override
	public void lockUser(String user_id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		@SuppressWarnings("unused")
		ResultSet rs = null;
		String query = "UPDATE SMS_USERS_1 SET active_tag = 'N' WHERE user_id = ?";
		
		try{
			DBConnect db = new DBConnect("192.10.10.253", "trng", "1521", "hr", "hr");
			conn = db.getConnection();
			conn.setAutoCommit(false);
			stmt = conn.prepareStatement(query);
			stmt.setString(1, user_id);
			rs = stmt.executeQuery();
			conn.commit();	
		}catch(Exception e){
			System.out.println(e.getMessage());
			System.out.println("Failed to connect to database");
		}finally {
			//CLOSING JDBC RESOURCES
			if(conn!=null) {
				try {
					conn.close();
				} catch (SQLException e) {}
			}//closing conn
			
			if(stmt!=null) {
				try {
					stmt.close();
				} catch (SQLException e) {}
			}//closing stmt
			
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {}
			}//closing rs
		}//finally
	}//lockUser()

	@Override
	public void updateLastLogin(String user_id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		@SuppressWarnings("unused")
		ResultSet rs = null;
		String query = "UPDATE SMS_USERS_1 SET last_login = SYSDATE WHERE user_id = ?";
		
		try{
			DBConnect db = new DBConnect("192.10.10.253", "trng", "1521", "hr", "hr");
			conn = db.getConnection();
			conn.setAutoCommit(false);
			stmt = conn.prepareStatement(query);
			stmt.setString(1, user_id);
			rs = stmt.executeQuery();
			conn.commit();	
		}catch(Exception e){
			System.out.println(e.getMessage());
			System.out.println("Failed to connect to database");
		}finally {
			//CLOSING JDBC RESOURCES
			if(conn!=null) {
				try {
					conn.close();
				} catch (SQLException e) {}
			}//closing conn
			
			if(stmt!=null) {
				try {
					stmt.close();
				} catch (SQLException e) {}
			}//closing stmt
			
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {}
			}//closing rs
		}//finally
	}//updateLastLogin()
	
}//UserDaoPalacol
