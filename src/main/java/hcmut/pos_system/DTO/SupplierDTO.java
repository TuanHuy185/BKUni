package hcmut.pos_system.DTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SupplierDTO {
    private Integer SupplierID;
    private String SupplierName;
    private String Email;
    private String Zipcode;
    private String PhoneNo;
}
