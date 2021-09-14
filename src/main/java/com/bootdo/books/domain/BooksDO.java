package com.bootdo.books.domain;

import java.io.Serializable;
import java.util.Date;



/**
 * 图书表
 * 
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2021-09-12 17:17:27
 */
public class BooksDO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Integer id;
	//书名
	private String bookname;
	//作者
	private String author;
	//图书类别 0：科技 1：人文 2：悬疑  3：经济  4：农业  5：其它
	private Integer category;
	//简介
	private String introduction;
	//修改时间
	private Date updateTime;

	/**
	 * 设置：
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * 获取：
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * 设置：书名
	 */
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	/**
	 * 获取：书名
	 */
	public String getBookname() {
		return bookname;
	}
	/**
	 * 设置：作者
	 */
	public void setAuthor(String author) {
		this.author = author;
	}
	/**
	 * 获取：作者
	 */
	public String getAuthor() {
		return author;
	}
	/**
	 * 设置：图书类别 0：科技 1：人文 2：悬疑  3：经济  4：农业  5：其它
	 */
	public void setCategory(Integer category) {
		this.category = category;
	}
	/**
	 * 获取：图书类别 0：科技 1：人文 2：悬疑  3：经济  4：农业  5：其它
	 */
	public Integer getCategory() {
		return category;
	}
	/**
	 * 设置：简介
	 */
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	/**
	 * 获取：简介
	 */
	public String getIntroduction() {
		return introduction;
	}
	/**
	 * 设置：修改时间
	 */
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	/**
	 * 获取：修改时间
	 */
	public Date getUpdateTime() {
		return updateTime;
	}
}
