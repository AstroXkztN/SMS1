package com.jdbc.connect;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	private String server;
	private String database;
	private String port;
	private String user;
	private String password;
	
	//constructor to initialize values
	public DBConnect(String server, String database, String port, String user, String password) {
		setServer(server);
		setDatabase(database);
		setPort(port);
		setUser(user);
		setPassword(password);
	}

	public String getServer() {
		return server;
	}

	public void setServer(String server) {
		this.server = server;
	}

	public String getDatabase() {
		return database;
	}

	public void setDatabase(String database) {
		this.database = database;
	}

	public String getPort() {
		return port;
	}

	public void setPort(String port) {
		this.port = port;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	//method for connection. returns conn
	public Connection getConnection() {
		Connection conn = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@" + this.getServer() + ":" + 
				    this.getPort() + ":" + this.getDatabase(),
					this.getUser(), this.getPassword());

			

			return conn;
		} catch (Exception e) {
			System.out.println("Failed to connect to database!");
			return null;
		}
	}
}
