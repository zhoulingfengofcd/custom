package com.qingting.customer.baseserver;

import java.util.List;

import com.qingting.customer.Service;
import com.qingting.customer.common.pojo.hbasedo.Province;
import com.qingting.customer.common.pojo.model.Pagination;

public interface ProvinceService extends Service<Province, Integer> {
	/**
	 * 
	 * @Title: insertProvinceList
	 * @Description: 批量插入
	 * @param proList 
	 * @return void
	 * @throws
	 */
	void insertProvinceList(List<Province> proList);
	/**
	 * 
	 * @Title: listProvince
	 * @Description: 查询省信息
	 * @param code
	 * @param pageNo
	 * @param pageSize
	 * @return 
	 * @return Pagination<Province>
	 * @throws
	 */
	Pagination<Province> listProvince(String code,Integer pageNo,Integer pageSize);
}
