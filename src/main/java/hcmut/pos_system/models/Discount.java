package hcmut.pos_system.models;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
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
@IdClass(DiscountId.class)
@Table(name = "Discount")
public class Discount {
    @Id
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "DiscountID", nullable = false)
    private Integer discountId;

    @Id
    @ManyToOne(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "ProductTypeID", referencedColumnName = "productTypeId", nullable = false)
    private ProductType productType;

    @Column(name = "DiscountDate", nullable = false)
    private LocalDateTime date;

    @Column(name = "Discount", precision = 5, scale = 2, nullable = false)
    private BigDecimal discountPrice;
}
