package hcmut.pos_system.models;

import java.math.BigDecimal;
import java.util.Set;

import org.hibernate.annotations.Collate;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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
@Table(name = "ProductType")
public class ProductType {
    @Id
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ProductTypeID", nullable = false)
    private String productTypeId;

    @Column(name = "ProductTypeName", nullable = false)
    private String name;

    @Column(name = "StockQuantity", nullable = false)
    private int stockQuantity;

    @ManyToOne(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "SupplierID", referencedColumnName = "supplierId", nullable = false)
    private Supplier supplier;

    @Column(name = "SalePrice", nullable = false, precision = 10, scale = 3)
    private BigDecimal price;

    // support for Many To Many 
    @OneToMany(mappedBy = "productType", cascade = CascadeType.REMOVE)
    private Set<ImportProduct> importProducts;
}
