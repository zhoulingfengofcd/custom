package com.qingting.customer.enums;

public enum MsgType {
	WARN(1);
	
	private Integer value;
	
	private MsgType(Integer value){
		this.value=value;
	}

	public Integer getValue() {
		return value;
	}

	public void setValue(Integer value) {
		this.value = value;
	}
	
}
