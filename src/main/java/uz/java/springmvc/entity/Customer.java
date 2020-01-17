package uz.java.springmvc.entity;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name="customer")
public class Customer implements Serializable{

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="id", updatable = false, nullable = false)
    private int id;

    @Column(name="first_name")
    @Size(max = 20, min = 3, message = "Enter first name  between 3 or 20")
    @NotEmpty(message = "Enter a valid first name.")
    private String firstName;

    @Column(name="last_name")
    @Size(max = 20, min = 3, message = "Enter last name  between 3 or 20")
    @NotEmpty(message = "Enter a valid last name.")
    private String lastName;

    @Column(name="email")
    @Size(max = 30, min = 5, message = "Enter email length between 5 or 30")
    @Email(message = "Invalid email! Please enter valid email.")
    private String email;

    @Column(name = "birth_date")
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    @NotNull(message = "Invalid date! Please enter valid date.")
    @Past
    private Date birthDate;

    @Column(name = "gender")
    @NotNull(message = "Select Gender!")
    private Gender gender;

    public enum Gender{
        MALE, FEMALE
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public Customer() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", email='" + email + '\'' +
                ", birthDate=" + birthDate +
                ", gender=" + gender +
                '}';
    }
}





