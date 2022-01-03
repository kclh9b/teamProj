package dog.web.validation;

import dog.web.form.ItemSaveForm;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Slf4j
@Component
public class ItemSaveValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return ItemSaveForm.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        ItemSaveForm itemSaveForm = (ItemSaveForm) target;
        if (itemSaveForm.getMfile().isEmpty()) {
            errors.rejectValue("mfile", "upload");
        }else if(itemSaveForm.getDfile().isEmpty()) {
            errors.rejectValue("dfile", "upload");
        }
    }
}
