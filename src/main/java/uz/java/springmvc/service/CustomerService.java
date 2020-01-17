package uz.java.springmvc.service;

import java.util.List;

import uz.java.springmvc.entity.Customer;

public interface CustomerService {

    List<Customer> getCustomers();

    void saveCustomer(Customer theCustomer);

    Customer getCustomer(int theId);

    void deleteCustomer(int theId);

}
