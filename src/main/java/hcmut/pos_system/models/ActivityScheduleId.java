package hcmut.pos_system.models;

import java.io.Serializable;
import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ActivityScheduleId implements Serializable {
    private Branch branch;

    private LocalDate saleDateInWeek;

    private LocalDate startTime;
    private LocalDate endTime;
}
