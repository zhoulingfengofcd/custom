package com.qingting.customer.model;

import java.io.Serializable;
import java.util.Calendar;

public class Area implements Serializable{
	
	private static final long serialVersionUID = -1227679743517632345L;
	
	private Integer id;
	/**
	 * 编码
	 */
	private String code;
	/**
	 * 名称
	 */
	private String name;
	/**
	 * 市编码
	 */
	private String cityCode;
	/**
	 * 创建时间
	 */
	private Calendar createTime;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCityCode() {
		return cityCode;
	}
	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}
	public Calendar getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Calendar createTime) {
		this.createTime = createTime;
	}
	@Override
	public String toString() {
		return "Area [id=" + id + ", code=" + code + ", name=" + name + ", cityCode=" + cityCode + ", createTime="
				+ createTime + "]";
	}
}
