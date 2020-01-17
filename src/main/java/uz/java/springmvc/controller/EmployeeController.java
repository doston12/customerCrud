package uz.java.springmvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import uz.java.springmvc.entity.Employee;
import uz.java.springmvc.service.EmployeeService;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @GetMapping("/index")
    public String getIndex(Model model){
        return "index";
    }

    @GetMapping("/list")
    public String listEmployee(Model model){
        List<Employee> employees = employeeService.getEmployees();
        model.addAttribute("employees",employees);
        return "list-employee";
    }

    @GetMapping("/showEmpForm")
    public String showEmpFormAdd(Model model){
        Employee employee = new Employee();
        model.addAttribute("employee",employee);
        return "employee-form";
    }
    @PostMapping("/saveEmployee")
    public String saveEmployee(@ModelAttribute("employee") @Valid Employee employee, BindingResult bindingResult){
        if (bindingResult.hasErrors()){
            return "employee-form";
        } else {
            employeeService.saveEmployee(employee);
            return "redirect:/employee/list";
        }

    }

    @GetMapping("/updateEmpForm")
    public String showFormUpdate(@RequestParam("employeeId") int id, Model model){
        Employee employee = employeeService.getEmployee(id);
        model.addAttribute("employee",employee);
        return "employee-form";
    }

    @GetMapping("/deleteEmployee")
    public String deleteEmployee(@RequestParam("employeeId") int id){
        employeeService.deleteEmployee(id);
        return "/employee/list";
    }

}
