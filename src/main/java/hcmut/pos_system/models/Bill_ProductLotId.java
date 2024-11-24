package hcmut.pos_system.models;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Bill_ProductLotId implements Serializable {
    private Bill bill;

    private ProductLot productLot;
}
