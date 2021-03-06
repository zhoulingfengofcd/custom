package com.qingting.customer.model;

import java.util.Calendar;

import com.smart.mvc.model.PersistentObject;

public class UserSort extends PersistentObject{

	private static final long serialVersionUID = 328324318283659418L;
	
	private String rowKey;
	/**
	 * ID
	 */
	private Integer id;
	/**
	 * 分类名称
	 */
	private String sortName;
	/**
	 * 创建者ID
	 */
	private Integer userId;
	/**
	 * 创建时间
	 */
	private Calendar createTime;
	
	
	public String getRowKey() {
		return rowKey;
	}
	public void setRowKey(String rowKey) {
		this.rowKey = rowKey;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSortName() {
		return sortName;
	}
	public void setSortName(String sortName) {
		this.sortName = sortName;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Calendar getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Calendar createTime) {
		this.createTime = createTime;
	}
	@Override
	public String toString() {
		return "UserSort [rowKey=" + rowKey + ", id=" + id + ", sortName=" + sortName + ", userId=" + userId
				+ ", createTime=" + createTime + "]";
	}
	
	
}
