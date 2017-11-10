package com.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.dao.UserDao;
import com.entity.User;
/*import com.ibatis.sqlmap.client.SqlMapClient;*/

public class UserDaoImpl implements UserDao{

	/* SAMPLE CONTENT OF DAOIMPL
	 * 
	 * private SqlMapClient sqlMapClient;
	
	@Override
	public String validateLogin(Map<String, Object> params) throws SQLException {
		// TODO Auto-generated method stub
		return (String) this.getSqlMapClient().queryForObject("validateLogin", params);
	}

	public SqlMapClient getSqlMapClient() {
		return sqlMapClient;
	}

	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}

	@Override
	public void addUser(Map<String, Object> params) throws SQLException {
		try{
			this.sqlMapClient.startTransaction();
			this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.sqlMapClient.startBatch();
			
			this.sqlMapClient.update("addRec",params);
			
			this.sqlMapClient.executeBatch();
			this.sqlMapClient.getCurrentConnection().commit();;
		}catch(SQLException e){
			this.sqlMapClient.getCurrentConnection().rollback();
			throw e;
		}finally{
			this.getSqlMapClient().endTransaction();
		}
	}

	@Override
	public void updateUser(Map<String, Object> params) throws SQLException {
		try{
			this.sqlMapClient.startTransaction();
			this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.sqlMapClient.startBatch();
			
			this.sqlMapClient.update("updateRec",params);
			
			this.sqlMapClient.executeBatch();
			this.sqlMapClient.getCurrentConnection().commit();;
		}catch(SQLException e){
			this.sqlMapClient.getCurrentConnection().rollback();
			throw e;
		}finally{
			this.getSqlMapClient().endTransaction();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getAllUsers() throws SQLException {
		// TODO Auto-generated method stub
		return (List<User>) this.getSqlMapClient().queryForList("getAllUsers");
	}*/
}
