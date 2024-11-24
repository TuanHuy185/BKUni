package hcmut.pos_system.DTO;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class EmployeeDTO {
    private Integer EmployeeID;
    private String LastName;
    private String MiddleName;
    private String FirstName;
    private String CCCD;
    private String PhoneNo;
    private String Email;
    private BigDecimal Salary;
    private Integer SupervisorID;
    private Integer BranchID;

    // {
    //     "employeeID": 120,
    //     "lastName": "Trương",
    //     "middleName": "Gia",
    //     "firstName": "Hân",
    //     "cccd": "079305102880",
    //     "phoneNo": "03392427223",
    //     "email": "dhan@gmail.com",
    //     "salary": 5,
    //     "supervisorID": null,
    //     "branchID": 5
    // }
    // when insert, you must use this value label in FE
}
