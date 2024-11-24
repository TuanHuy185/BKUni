package hcmut.pos_system.models;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Set;

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
@Table(name = "Bill")
public class Bill {
    @Id
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "BillID", nullable = false)
    private Long billId;

    @Column(name = "OrderDate", nullable = false)
    private LocalDateTime date;

    @ManyToOne(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "CashierID", referencedColumnName = "EmployeeID", nullable = false)
    private Cashier cashier;

    //support for Many To Many 
    @OneToMany(mappedBy = "bill", cascade = CascadeType.REMOVE)
    Set<Bill_ProductLot> bill_ProductLots;
}
