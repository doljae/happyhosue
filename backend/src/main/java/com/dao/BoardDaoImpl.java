package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mapper.BoardMapper;
import com.vo.Board;

@Repository
public class BoardDaoImpl implements BoardDao {
	@Autowired
	BoardMapper mapper;

	@Override
	public List<Board> getBoards() throws Exception {
		return mapper.getBoards();
	}

	@Override
	public void increaseViewCount(int id) throws Exception {
		mapper.increaseViewCount(id);

	}

	@Override
	public Board getBoard(int id) throws Exception {
		return mapper.getBoard(id);
	}

	@Override
	public void postBoard(Board board) throws Exception {
		mapper.postBoard(board);

	}

	@Override
	public void updateBoard(Board board) throws Exception {
		mapper.updateBoard(board);
	}

	@Override
	public void deleteBoard(int no) throws Exception {
		mapper.deleteBoard(no);
	}

//
//	@Override
//	public List<Board> getQnaByName(String name) throws Exception {
//		return mapper.getQnaByName(name);
//	}
//

}
