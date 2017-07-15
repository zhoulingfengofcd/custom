package com.qingting.customer.baseserver.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qingting.customer.baseserver.MessageService;
import com.qingting.customer.common.pojo.hbasedo.Message;
import com.qingting.customer.common.pojo.model.Pagination;
import com.qingting.customer.dao.MessageDAO;

@Service("messageService")
public class MessageServiceImpl implements MessageService {
	@Resource
	MessageDAO messageDAO;

	@Override
	public void insertMessage(Message message) {
		messageDAO.insertMessage(message);
	}

	@Override
	public void deleteMessageByRowKey(String rowKey) {
		messageDAO.deleteMessageByRowKey(rowKey);
	}

	@Override
	public void updateMessageByRowKey(Message message) {
		messageDAO.updateMessageByRowKey(message);
	}

	@Override
	public Message getMessageByRowKey(String rowKey) {
		return messageDAO.getMessageByRowKey(rowKey);
	}

	@Override
	public Pagination<Message> listMessage(String sortCode, String mobile, Integer pageNo, Integer pageSize) {
		return messageDAO.listMessage(sortCode, mobile, pageNo, pageSize);
	}
	
}
