package hcmut.pos_system.DTO;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Bill_ProductLotDTO {
    private Integer BillID;
    private String ProductTypeID;
    private Integer ProductLotID;
    private Integer QuantityInBill;
    private BigDecimal SalePrice;
}
