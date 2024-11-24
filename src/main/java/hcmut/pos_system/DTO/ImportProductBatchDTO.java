package hcmut.pos_system.DTO;

import java.math.BigDecimal;
import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ImportProductBatchDTO {
    private Integer BranchID;

    private LocalDate BatchDate;

    private String ProductTypeName;

    private Integer TotalQuantity;

    private BigDecimal Total;
}
