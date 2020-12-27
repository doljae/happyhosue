package com.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.service.BoardService;
import com.vo.Board;

@RestController
@CrossOrigin
public class BoardController {
	@Autowired
	BoardService service;

	@GetMapping(value = "/board")
	public List getBoards() {
		try {
			List<Board> data = service.getBoards();
			return data;
		} catch (Exception e) {
			System.out.println(11);
			return null;
		}
	}

	@GetMapping(value = "/board/{id}")
	public Board getBoard(@PathVariable int id) {
		try {
			service.increaseViewCount(id);
			Board data = service.getBoard(id);
			return data;
		} catch (Exception e) {
			return null;
		}
	}

	@PostMapping(value = "/board")
	public Map postBoard(@RequestBody Board board) {
		Map<String, String> resultMap = new HashMap<String, String>();
		try {
			service.postBoard(board);
			resultMap.put("result", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("result", "FAIL");
		}
		return resultMap;
	}

	@PutMapping(value = "/board")
	public Map updateBoard(@RequestBody Board board) {
		Map<String, String> resultMap = new HashMap<String, String>();
		try {
			service.updateBoard(board);
			resultMap.put("result", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("result", "FAIL");
		}
		return resultMap;
	}

	@DeleteMapping(value = "/board/{no}")
	public Map deleteBoard(@PathVariable int no) {
		Map<String, String> resultMap = new HashMap<String, String>();
		try {
			service.deleteBoard(no);
			resultMap.put("result", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("result", "FAIL");
		}
		return resultMap;
	}

//	@GetMapping(value="/qna/name/{name}")
//	public List getQnaByName(@PathVariable String name)
//	{
//		try {
//			List<Board> data = service.getQnaByName(name);
//			System.out.println(data.size());
//			return data;
//		}catch (Exception e) {
//			return null;
//		}
//	}
//	
//	@GetMapping(value="/qna/{id}")
//	public Board getQnaById(@PathVariable int id)
//	{
//		try {
//			Board data = service.getQna(id);
//			System.out.println(data);
//			service.increaseViewCount(id);
//			return data;
//		}catch (Exception e) {
//			return null;
//		}
//	}
//	

}
