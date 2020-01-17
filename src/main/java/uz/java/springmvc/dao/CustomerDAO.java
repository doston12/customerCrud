package uz.java.springmvc.dao;

import java.util.List;

import uz.java.springmvc.entity.Customer;

public interface CustomerDAO {

    List<Customer> getCustomers();

    void saveCustomer(Customer theCustomer);

    Customer getCustomer(int theId);

    void deleteCustomer(int theId);

}
