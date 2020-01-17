package uz.java.springmvc.dao;

import uz.java.springmvc.entity.Employee;

import java.util.List;

public interface EmployeeDAO {

    List<Employee> getEmployees();

    void saveEmployee(Employee employee);

    Employee getEmployee(int id);

    void deleteEmployee(int id);
}
