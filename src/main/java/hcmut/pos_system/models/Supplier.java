package hcmut.pos_system.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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
@Table(name = "Supplier")
public class Supplier {
    @Id
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "SupplierID", nullable = false)
    private Long supplierId;
    
    @Column(name = "SupplierName", nullable = false, length = 100)
    private String name;

    @Column(name = "Email", nullable = false, length = 320)
    private String email;

    @Column(name = "ZipCode", nullable = false, length = 5)
    private String postalCode; //ma buu chinh

    @Column(name = "PhoneNo", nullable = false, length = 20)
    private String phoneNumber;
}
