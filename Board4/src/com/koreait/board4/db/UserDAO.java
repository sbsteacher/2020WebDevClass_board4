package com.koreait.board4.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.koreait.board4.model.UserModel;

public class UserDAO extends CommonDAO {
	public static UserModel selUser(UserModel p) {		
		String sql = " SELECT i_user, user_pw, salt, nm"
				+ " FROM t_user WHERE user_id = ?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;		
		try {			
			con = DbUtils.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, p.getUser_id());
			rs = ps.executeQuery();
			if(rs.next()) {
				UserModel vo = new UserModel();
				vo.setI_user(rs.getInt("i_user"));
				vo.setUser_pw(rs.getString("user_pw"));
				vo.setSalt(rs.getString("salt"));
				vo.setNm(rs.getNString("nm"));
				return vo;
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtils.close(con, ps, rs);
		}		
		return null;
	}
}
