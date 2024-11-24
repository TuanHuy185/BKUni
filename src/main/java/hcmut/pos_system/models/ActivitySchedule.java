package hcmut.pos_system.models;

import java.time.LocalDate;
import java.time.LocalTime;

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

@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@IdClass(ActivityScheduleId.class)
@Table(name = "BranchSchedules")
public class ActivitySchedule {
    @Id
    @ManyToOne(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "BranchID", referencedColumnName = "branchId", nullable = false)
    private Branch branch;

    @Id
    @Column(name = "OpenDays", nullable = false, length = 100)
    private String saleDateInWeek;

    @Id
    @Column(name = "OpenTime", nullable = false)
    private LocalTime startTime;

    @Id
    @Column(name = "CloseTime", nullable = false)
    private LocalTime endTime;
}
