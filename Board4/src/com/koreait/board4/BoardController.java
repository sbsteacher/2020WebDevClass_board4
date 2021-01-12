package com.koreait.board4;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.board4.common.SecurityUtils;
import com.koreait.board4.common.Utils;
import com.koreait.board4.db.BoardDAO;
import com.koreait.board4.db.SQLInterUpdate;
import com.koreait.board4.model.BoardPARAM;
import com.koreait.board4.model.BoardSEL;

public class BoardController {

	public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int typ = Utils.getIntParam(request, "typ", 1);
		BoardPARAM param = new BoardPARAM();
		param.setTyp(typ);
		
		request.setAttribute("jsList", new String[] {"board"});
		request.setAttribute("list", BoardDAO.selBoardList(param));
		Utils.forwardTemp("리스트", "temp/basic_temp", "board/bList", request, response);
	}
	
	public void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int i_board = Utils.getIntParam(request, "i_board");
		BoardPARAM param = new BoardPARAM();
		param.setI_board(i_board);
		param.setI_user(SecurityUtils.getLoingUserPk(request));
		BoardSEL data = BoardDAO.selBoard(param);
		request.setAttribute("data", data);	
		
		Utils.forwardTemp(data.getTitle(), "temp/basic_temp", "board/bDetail", request, response);
	}
	
	public void reg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Utils.forwardTemp("글등록", "temp/basic_temp", "board/bRegmod", request, response);
	}
	
	public void mod(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Utils.forwardTemp("글수정", "temp/basic_temp", "board/bRegmod", request, response);
	}
	
	public void regProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int typ = Utils.getIntParam(request, "typ");
		String title = request.getParameter("title");
		String ctnt = request.getParameter("ctnt");
		int writerI_user = SecurityUtils.getLoingUserPk(request);		
		String sql = " INSERT INTO t_board" + 
				" (typ, seq, title, ctnt, i_user)" + 
				" SELECT typ, IFNULL(MAX(seq), 0) + 1, ?, ?, ? FROM t_board" + 
				" WHERE typ = ? ";		
		int result = BoardDAO.executeUpdate(sql, new SQLInterUpdate() {
			@Override
			public void proc(PreparedStatement ps) throws SQLException {
				ps.setNString(1, title);
				ps.setNString(2, ctnt);
				ps.setInt(3, writerI_user);
				ps.setInt(4, typ);
			}
		});		
		response.sendRedirect("/board/list.korea?typ=" + typ);
		
	}
	
	public void modProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}









