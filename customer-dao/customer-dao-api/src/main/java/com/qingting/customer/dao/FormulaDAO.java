package com.qingting.customer.dao;


import com.qingting.customer.common.pojo.hbasedo.Formula;
import com.qingting.customer.common.pojo.model.Pagination;

public interface FormulaDAO {
	void insert(Formula formula);
	void deleteById(Integer id);
	void updateById(Formula formula);
	Formula getById(Integer id);
	Pagination<Formula> list(Pagination<Formula> page);
	Formula getByFilterIdAndOrder(Integer filterId,Byte order);
}
