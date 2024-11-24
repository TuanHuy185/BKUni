package hcmut.pos_system.models;

import java.util.Set;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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
@Table(name = "Branch")
public class Branch {
    @Id
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "BranchID", nullable = false)
    private Integer branchId;

    @Column(name = "BranchAddress", nullable = false, length = 320)
    private String address;
    
    // support for Many To Many 
    @OneToMany(mappedBy = "branch", cascade = CascadeType.REMOVE)
    Set<ImportProduct> importProducts;
}
