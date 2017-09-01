package com.qingting.customer.server;


import com.qingting.customer.model.hbasedo.Formula;
import com.qingting.customer.model.page.Pagination;

public interface FormulaService {
	void insert(Formula formula);
	void deleteById(Integer id);
	void updateById(Formula formula);
	Formula getById(Integer id);
	Pagination<Formula> list(Pagination<Formula> page);
	Formula getByFilterIdAndOrder(Integer filterId,Byte order);
}