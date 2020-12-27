package com.mapper;

import java.util.List;

import com.vo.Board;

public interface BoardMapper {
//	public Board getQna(int id) throws Exception;
	public List<Board> getBoards() throws Exception;

//	public List<Board> getQnaByName(String name) throws Exception;
	public void postBoard(Board board) throws Exception;

	public void updateBoard(Board board) throws Exception;

	public void deleteBoard(int id) throws Exception;

	public void increaseViewCount(int id) throws Exception;

	public Board getBoard(int id) throws Exception;
}
