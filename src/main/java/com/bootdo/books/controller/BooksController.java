package com.bootdo.books.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bootdo.books.domain.BooksDO;
import com.bootdo.books.service.BooksService;
import com.bootdo.common.utils.PageUtils;
import com.bootdo.common.utils.Query;
import com.bootdo.common.utils.R;

/**
 * 图书表
 * 
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2021-09-12 17:17:27
 */
 
@Controller
@RequestMapping("/system/books")
public class BooksController {
	@Autowired
	private BooksService booksService;
	
	@GetMapping()
	@RequiresPermissions("system:books:books")
	String Books(){
	    return "books/books";
	}
	
	@ResponseBody
	@GetMapping("/list")
	@RequiresPermissions("system:books:books")
	public PageUtils list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);
		List<BooksDO> booksList = booksService.list(query);
		int total = booksService.count(query);
		PageUtils pageUtils = new PageUtils(booksList, total);
		return pageUtils;
	}
	
	@GetMapping("/add")
	@RequiresPermissions("system:books:add")
	String add(){
	    return "books/add";
	}

	@GetMapping("/edit/{id}")
	@RequiresPermissions("system:books:edit")
	String edit(@PathVariable("id") Integer id,Model model){
		BooksDO books = booksService.get(id);
		model.addAttribute("books", books);
	    return "books/edit";
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("system:books:add")
	public R save( BooksDO books){
		books.setUpdateTime(new Date());
		if(booksService.save(books)>0){
			return R.ok();
		}
		return R.error();
	}
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("system:books:edit")
	public R update( BooksDO books){
		books.setUpdateTime(new Date());
		booksService.update(books);
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/remove")
	@ResponseBody
	@RequiresPermissions("system:books:remove")
	public R remove( Integer id){
		if(booksService.remove(id)>0){
		return R.ok();
		}
		return R.error();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/batchRemove")
	@ResponseBody
	@RequiresPermissions("system:books:batchRemove")
	public R remove(@RequestParam("ids[]") Integer[] ids){
		booksService.batchRemove(ids);
		return R.ok();
	}
	
}
