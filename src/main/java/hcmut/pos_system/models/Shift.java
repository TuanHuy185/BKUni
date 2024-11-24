package hcmut.pos_system.models;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@Entity
@NoArgsConstructor
@AllArgsConstructor
@IdClass(ShiftId.class)
@Table(name = "Shift")
public class Shift {
    @Id
    @ManyToOne(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "EmployeeID", referencedColumnName = "employeeId", nullable = false)
    private Employee emloyee;

    @Id
    @Column(name = "ShiftTime", nullable = false)
    private Integer shift;
    
    @Column(name = "ShiftDay", nullable = false, length = 2)
    private String weekdays;
}
