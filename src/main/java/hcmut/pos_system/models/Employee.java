package hcmut.pos_system.models;

import java.math.BigDecimal;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Inheritance;
import jakarta.persistence.InheritanceType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
/* Use only for disjoin constraints */
// @Inheritance(strategy = InheritanceType.SINGLE_TABLE)
// @DiscriminatorValue("EMPLOYEE")
@Table(name = "Employee")
public class Employee {
    @Id
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "EmployeeID", nullable = false)
    private Integer employeeId;

    @Column(name = "LastName", nullable = false, length = 10)
    private String lastName;

    @Column(name = "MiddleName", length = 20)
    private String middleName;

    @Column(name = "FirstName", nullable = false, length = 10)
    private String firstName;

    @Column(name = "CCCD", unique = true, nullable = false, length = 12)
    private String CCCD;
    
    @Column(name = "PhoneNo", nullable = false, length = 10)
    private String phoneNumber;

    @Column(name = "Email", nullable = false, length = 320)
    private String email;

    @Column(name = "Salary", nullable = false, precision = 6, scale = 3)
    private BigDecimal salary;

    // referencedColumnName is the name of entity Employee or the name of attribute in table 
    @ManyToOne(cascade = CascadeType.REMOVE, fetch = FetchType.LAZY)
    @JoinColumn(name = "SupervisorID", referencedColumnName = "employeeId")
    private Employee supervisor; 

    @ManyToOne(cascade = CascadeType.REMOVE, fetch = FetchType.LAZY)
    @JoinColumn(name = "BranchID", referencedColumnName = "branchId", nullable = false)
    private Branch branch;
}
