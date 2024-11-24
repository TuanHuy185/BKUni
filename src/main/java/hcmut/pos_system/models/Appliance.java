package hcmut.pos_system.models;

import java.time.LocalDate;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
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

@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
// @DiscriminatorValue("APPLIANCE")
@Table(name = "Equipments")
public class Appliance {
    @Id
    @OneToOne
    @JoinColumns({
        @JoinColumn(name = "ProductLotID", referencedColumnName = "productLotId", nullable = false),
        @JoinColumn(name = "ProductTypeID", referencedColumnName = "productTypeId", nullable = false)
    })
    private ProductLot productLot;

    @Column(name = "WarrantyPeriod", nullable = false)
    private Integer expiredWarrantyDate;
    
}
