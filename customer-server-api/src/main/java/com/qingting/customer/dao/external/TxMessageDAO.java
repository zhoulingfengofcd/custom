package com.qingting.customer.dao.external;

public interface TxMessageDAO {
	/**
	 * 
	 * @Title: txValidateCode
	 * @Description: 发送验证码
	 * @param phone
	 * @return String
	 * @throws
	 */
	String txValidateCode(String phone);
	
}
