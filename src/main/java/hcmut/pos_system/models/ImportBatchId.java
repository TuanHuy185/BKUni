package hcmut.pos_system.models;

import java.io.Serializable;
import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ImportBatchId implements Serializable {
    private ImportProduct importProduct;

    private Long productQuantity;

    private LocalDate date;
}
