package uz.java.springmvc.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import uz.java.springmvc.entity.Customer;

import java.util.regex.Pattern;

@Component
public class CustomerValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz){
        return Customer.class.equals(clazz);
    }

    @Override
    public void validate(Object obj, Errors err){
        ValidationUtils.rejectIfEmpty(err,"name", "customer.first_name.empty");
        ValidationUtils.rejectIfEmpty(err, "lastName", "customer.last_name.empty");
        ValidationUtils.rejectIfEmpty(err,"email","customer.email.empty");

        Customer customer = (Customer) obj;

        Pattern pattern = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$",
                Pattern.CASE_INSENSITIVE);
        if (!(pattern.matcher(customer.getEmail()).matches())) {
            err.rejectValue("email", "user.email.invalid");
        }
    }
}
