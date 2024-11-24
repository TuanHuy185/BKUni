package hcmut.pos_system.DTO;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ExpiredLotDTO {
    private int productLotID;
    private String productTypeID;
    private int quantityInLot;
    private LocalDate expireDate;
}
