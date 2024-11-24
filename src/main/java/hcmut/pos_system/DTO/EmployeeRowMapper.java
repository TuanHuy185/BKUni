package hcmut.pos_system.DTO;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class EmployeeRowMapper implements RowMapper<EmployeeDTO> {
    @Override
    public EmployeeDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
        EmployeeDTO employee = new EmployeeDTO();
        employee.setEmployeeID(rs.getInt("EmployeeID"));
        employee.setLastName(rs.getString("LastName"));
        employee.setMiddleName(rs.getString("MiddleName"));
        employee.setFirstName(rs.getString("FirstName"));
        employee.setCCCD(rs.getString("CCCD"));
        employee.setPhoneNo(rs.getString("PhoneNo"));
        employee.setEmail(rs.getString("Email"));
        employee.setSalary(rs.getBigDecimal("Salary"));
        employee.setSupervisorID(rs.getInt("SupervisorID"));
        employee.setBranchID(rs.getInt("BranchID"));
        return employee;
    }
}
