package hcmut.pos_system.models;

import java.time.LocalDate;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinColumns;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
// @DiscriminatorValue("DRYFOOD")
@Table(name = "DryFoods")
public class DryFood {
    @Id
    @OneToOne
    @JoinColumns({
        @JoinColumn(name = "ProductLotID", referencedColumnName = "productLotId", nullable = false),
        @JoinColumn(name = "ProductTypeID", referencedColumnName = "productTypeId", nullable = false)
    })
    private ProductLot productLot;

    @Column(name = "ProductDescription", length = 500)
    private String describe;
    
    @Column(name = "ExpirationDate", nullable = false)
    private LocalDate expiredDate;
    
}
