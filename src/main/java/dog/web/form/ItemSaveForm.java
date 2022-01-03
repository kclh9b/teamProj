package dog.web.form;

import lombok.Data;
import org.hibernate.validator.constraints.Range;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Data
public class ItemSaveForm {

    @NotNull(message = "카테고리를 설정해주세요.")
    Integer cateid;

    @NotNull(message = "가격을 입력해주세요.")
    @Range(min = 100, max = 1000000, message = "가격을 100 이상, 1000000 이하로 입력해주세요")
    Integer price;

    @NotNull(message = "할인율을 입력해주세요.")
    @Range(min = 0, max = 95, message = "할인율을 0이상, 95이하로 입력해주세요.")
    Integer discount;

    @NotNull(message = "수량을 입력해주세요.")
    @Range(min = 10, max = 3000, message = "수량을 10 이상, 3000이하로 입력해주세요.")
    Integer quantity;

    @NotBlank(message = "상품명을 입력해주세요")
    String name;

    @NotBlank(message = "원산지를 입력해주세요.")
    String origin;

    @NotBlank(message = "제조사를 입력해주세요.")
    String manufac;

    @NotBlank(message = "강아지 정보를 입력해주세요.")
    String size, fur, age;

    MultipartFile mfile, dfile;
}
