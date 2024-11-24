package hcmut.pos_system.models;

import java.time.LocalDate;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinColumns;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@IdClass(ImportBatchId.class)
@Table(name = "ImportBatch")
public class ImportBatch {
    @Id
    @ManyToOne(cascade = CascadeType.REMOVE, fetch = FetchType.LAZY)
    @JoinColumns({
        @JoinColumn(name = "BranchID", referencedColumnName = "branchId", nullable = false),
        @JoinColumn(name = "ProductTypeID", referencedColumnName = "productTypeId", nullable = false)
    })
    private ImportProduct importProduct;

    @Id
    @Column(name = "ProductQuantity", nullable = false)
    private Integer productQuantity;

    @Id
    @Column(name = "BatchDate", nullable = false)
    private LocalDate date;

}
