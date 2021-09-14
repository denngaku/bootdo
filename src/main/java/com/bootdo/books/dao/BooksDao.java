package com.bootdo.books.dao;

import com.bootdo.books.domain.BooksDO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

/**
 * 图书表
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2021-09-12 17:17:27
 */
@Mapper
public interface BooksDao {

	BooksDO get(Integer id);
	
	List<BooksDO> list(Map<String,Object> map);
	
	int count(Map<String,Object> map);
	
	int save(BooksDO books);
	
	int update(BooksDO books);
	
	int remove(Integer id);
	
	int batchRemove(Integer[] ids);
}
