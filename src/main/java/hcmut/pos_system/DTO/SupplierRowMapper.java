package hcmut.pos_system.DTO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import org.springframework.jdbc.core.RowMapper;

public class SupplierRowMapper implements RowMapper<SupplierDTO> {
    @Override
    public SupplierDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
        SupplierDTO supplierDTO = new SupplierDTO();
        supplierDTO.setSupplierID(rs.getInt("SupplierID"));
        supplierDTO.setSupplierName(rs.getString("SupplierName"));
        supplierDTO.setEmail(rs.getString("Email"));
        supplierDTO.setZipcode(rs.getString("Zipcode"));
        supplierDTO.setPhoneNo(rs.getString("PhoneNo"));
        return supplierDTO;
    }
}
