package uz.java.springmvc.entity;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Entity
@Table(name = "employees")
public class Employee implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "emp_id", updatable = false, nullable = false)
    private int empId;

    @Column(name = "first_name")
    @Size(max = 20, min = 3, message = "Enter first name  between 3 or 20")
    @NotEmpty(message = "Please enter first name!")
    private String fname;

    @Column(name = "last_name")
    @Size(max = 20, min = 3, message = "Enter last name  between 3 or 20")
    @NotEmpty(message = "Pelease enter last name!")
    private String lname;

    @Column(name = "address")
    @Size(max = 20, min = 3, message = "Enter address length between 3 or 30")
    @NotEmpty(message = "Please enter address!")
    private String address;

    @Column(name = "gender")
    @NotNull(message = "Please select gender!")
    private Gender gender;

    @Column(name = "salary",columnDefinition="Decimal(10,2) default ''")
    @NotNull(message = "Please enter salary!")
    private float salary;

    public Employee() {
    }

    public enum Gender{
        MALE, FEMALE
    }
    public int getEmpId() {
        return empId;
    }

    public void setEmpId(int empId) {
        this.empId = empId;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public float getSalary() {
        return salary;
    }

    public void setSalary(float salary) {
        this.salary = salary;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "empId=" + empId +
                ", fname='" + fname + '\'' +
                ", lname='" + lname + '\'' +
                ", address='" + address + '\'' +
                ", gender=" + gender +
                ", salary=" + salary +
                '}';
    }
}
