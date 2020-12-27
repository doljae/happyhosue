package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.BoardDao;
import com.vo.Board;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDao dao;

	@Override
	public List<Board> getBoards() throws Exception {
		return dao.getBoards();
	}

	@Override
	public void increaseViewCount(int id) throws Exception {
		dao.increaseViewCount(id);

	}

	@Override
	public Board getBoard(int id) throws Exception {
		return dao.getBoard(id);
	}

	@Override
	public void postBoard(Board board) throws Exception {
		dao.postBoard(board);

	}

	@Override
	public void updateBoard(Board board) throws Exception {
		dao.updateBoard(board);
	}

	@Override
	public void deleteBoard(int no) throws Exception {
		dao.deleteBoard(no);
	}
//
//	@Override
//	public List<Board> getQnaByName(String name) throws Exception {
//		return dao.getQnaByName(null);
//	}
//

}
