package com.bootdo.books.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.bootdo.books.dao.BooksDao;
import com.bootdo.books.domain.BooksDO;
import com.bootdo.books.service.BooksService;



@Service
public class BooksServiceImpl implements BooksService {
	@Autowired
	private BooksDao booksDao;
	
	@Override
	public BooksDO get(Integer id){
		return booksDao.get(id);
	}
	
	@Override
	public List<BooksDO> list(Map<String, Object> map){
		return booksDao.list(map);
	}
	
	@Override
	public int count(Map<String, Object> map){
		return booksDao.count(map);
	}
	
	@Override
	public int save(BooksDO books){
		return booksDao.save(books);
	}
	
	@Override
	public int update(BooksDO books){
		return booksDao.update(books);
	}
	
	@Override
	public int remove(Integer id){
		return booksDao.remove(id);
	}
	
	@Override
	public int batchRemove(Integer[] ids){
		return booksDao.batchRemove(ids);
	}
	
}
