package uz.java.springmvc.service;

import uz.java.springmvc.entity.Employee;

import java.util.List;

public interface EmployeeService {

    List<Employee> getEmployees();

    void saveEmployee(Employee employee);

    Employee getEmployee(int id);

    void deleteEmployee(int id);
}
