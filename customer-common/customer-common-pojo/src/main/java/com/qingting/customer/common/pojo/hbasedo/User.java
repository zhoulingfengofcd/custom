package com.qingting.customer.common.pojo.hbasedo;

import java.util.Calendar;

import org.apache.hadoop.hbase.util.Bytes;

public class User {
	private String rowKey;
	/**
	 * id
	 */
	private Integer id;
	/**
	 *  登录名 
	 */
	private String account;
	/** 
	 * 性别 
	 */
	private Boolean sex;
	/** 
	 * 性别 
	 */
	private Integer age;
	/** 
	 * 地址 
	 */
	private String address;
	/**
	 * 用户分类id
	 */
	private Integer userSortId;
	/**
	 * 创建时间
	 */
	private Calendar calendar;
	/**
	 * 数据的版本
	 */
	private final Byte version = 0;
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
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public Boolean getSex() {
		return sex;
	}
	public void setSex(Boolean sex) {
		this.sex = sex;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getUserSortId() {
		return userSortId;
	}
	public void setUserSortId(Integer userSortId) {
		this.userSortId = userSortId;
	}
	public Calendar getCalendar() {
		return calendar;
	}
	public void setCalendar(Calendar calendar) {
		this.calendar = calendar;
	}
	public Byte getVersion() {
		return version;
	}
	/**
	 * 
	 * @Title: setContentOfRowKey
	 * @Description: 根据查询的rowkey设置对应rowkey中包含的字段
	 * @param rowkey
	 * @return void
	 * @throws
	 */
	public void setContentOfRowKey(byte[] rowkey){
		this.rowKey=new String(rowkey);
		if(rowkey.length<8){
			throw new RuntimeException(this.getClass()+"rowkey长度有误，请检查程序.");
		}
		byte[] dest=new byte[4];
		System.arraycopy(rowkey, 0, dest, 0, 4);//前4个字节,所属用户id
		this.id=Bytes.toInt(dest);
		//System.arraycopy(rowkey, rowkey.length-4, dest, 0, 4);//最后4个字节,项目id
		//this.id=Bytes.toInt(dest);
	}
}