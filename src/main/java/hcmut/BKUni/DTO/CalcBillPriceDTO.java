package hcmut.BKUni.DTO;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CalcBillPriceDTO {
    private Integer BillID;
    private BigDecimal TotalPrice;
}
