package uz.java.springmvc.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import uz.java.springmvc.dao.EmployeeDAO;
import uz.java.springmvc.entity.Employee;

import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    EmployeeDAO employeeDAO;

    @Override
    @Transactional
    public List<Employee> getEmployees(){
        return employeeDAO.getEmployees();
    }

    @Override
    @Transactional
    public void saveEmployee(Employee employee){
        employeeDAO.saveEmployee(employee);
    }

    @Override
    @Transactional
    public void deleteEmployee(int id){
        employeeDAO.deleteEmployee(id);
    }

    @Override
    @Transactional
    public Employee getEmployee(int id){
        return employeeDAO.getEmployee(id);
    }


}
