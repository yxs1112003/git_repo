package com.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.dao.CustomerDao;
import com.mvc.entity.Customer;

@Service("customerService")
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerDao customerDao;

	@Override
	public List<Customer> getAll() {
		return customerDao.getAll();
	}

	@Override
	public Customer getCustomerByName(String name) {
		return customerDao.getCustomerByName(name);
	}

	@Override
	public boolean insert(Customer c) {
		int count = customerDao.insert(c);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean update(Customer customer) {
		int count = customerDao.update(customer);
		if (count > 0) {
			return true;
		}
		return false;
	}

}
