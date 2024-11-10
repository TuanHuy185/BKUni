package hcmut.BKUni.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import hcmut.BKUni.DTO.EmployeeDTO;
import hcmut.BKUni.DTO.EmployeeRowMapper;
import hcmut.BKUni.DTO.SupplierDTO;
import hcmut.BKUni.DTO.SupplierRowMapper;
import hcmut.BKUni.models.ResponseObject;

@Service
public class SupplierService {
     @Autowired
    private JdbcTemplate jdbcTemplate;

    public ResponseEntity<ResponseObject> PROC_getAllSupplier(){
        try {
            List<SupplierDTO> suppliers = jdbcTemplate.query("EXEC dbo.callsupplier", new SupplierRowMapper());
            return ResponseEntity.status(HttpStatus.OK)
                    .body(new ResponseObject("OK", "Query to find All Employee successfully", suppliers));

        } catch (DataAccessException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new ResponseObject("ERROR" + ", " + e.getMessage().toString(), "Error get All Supplier failed", null));
        }
    }
}
