package productProject.web;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class IncludeValidator implements Validator {
    
    @Override
	public boolean supports(Class<?> clazz) {
		return Accessory.class.isAssignableFrom(clazz);
    }
    
    @Override
	public void validate(Object target, Errors errors) {
		Accessory acc = (Accessory)target;
        if(acc.getGuarantee().contains("YEAR")==false && acc.getGuarantee().toLowerCase().contains("yıl")==false)
		errors.rejectValue("guarantee", "my.custom.err");		
	}


}