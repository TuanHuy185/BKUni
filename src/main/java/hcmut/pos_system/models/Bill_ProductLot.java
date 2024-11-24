package hcmut.pos_system.models;

import java.math.BigDecimal;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinColumns;
import jakarta.persistence.ManyToOne;
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
@IdClass(Bill_ProductLotId.class)
@Table(name = "Bill_ProductLot")
public class Bill_ProductLot {
    @Id
    @ManyToOne(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "BillID", referencedColumnName = "billId", nullable = false)
    private Bill bill;

    @Id
    @ManyToOne
    @JoinColumns({
        @JoinColumn(name = "ProductLotID", referencedColumnName = "productLotId", nullable = false),
        @JoinColumn(name = "ProductTypeID", referencedColumnName = "productTypeId", nullable = false)
    })
    private ProductLot productLot;

    @Column(name = "QuantityInBill", nullable = false)
    private Integer quantityEachType;

    @Column(name = "SalePrice", precision = 10, scale = 3, nullable = false)
    private BigDecimal currentPrice;
}
