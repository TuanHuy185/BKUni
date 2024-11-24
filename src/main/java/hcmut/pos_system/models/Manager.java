package hcmut.pos_system.models;

import java.time.LocalDate;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "Manager")
// @DiscriminatorValue("MANAGER") // use only for disjoin constraints
public class Manager {
    @Id
    @OneToOne(cascade = CascadeType.REMOVE, fetch = FetchType.LAZY)
    @JoinColumn(name = "EmployeeID", referencedColumnName = "employeeId", nullable = false)
    private Employee emloyee;
    
    @Column(name = "Degree", nullable = false, length = 320)
    private String degree; //bằng cấp

    @ManyToOne(cascade = CascadeType.REMOVE, fetch = FetchType.LAZY)
    @JoinColumn(name = "BranchID", referencedColumnName = "branchId", nullable = false)
    private Branch branch;

    @Column(name = "ManageStartDate", nullable = false)
    private LocalDate managerStartDay;
}
