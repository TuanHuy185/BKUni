package hcmut.pos_system.models;

import java.time.LocalDate;
import java.util.Set;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.Inheritance;
import jakarta.persistence.InheritanceType;
import jakarta.persistence.JoinColumn;
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
@Table(name = "ProductLot")
//@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
// @DiscriminatorValue("PRODUCTBATCH")
@IdClass(ProductLotId.class)
public class ProductLot {
    @Id
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ProductLotID", nullable = false)
    private Long productLotId;

    @Id
    @ManyToOne(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "ProductTypeID", referencedColumnName = "productTypeId", nullable = false) //you must write this
    private ProductType productType;

    @Column(name = "QuantityInLot")
    private Long quantityInTheLot;

    @Column(name = "ExpireDate", nullable = false)
    private LocalDate expiryDate;

    //support for Many To Many 
    @OneToMany(mappedBy = "productLot", cascade = CascadeType.REMOVE)
    Set<Bill_ProductLot> bill_ProductLots;
}
