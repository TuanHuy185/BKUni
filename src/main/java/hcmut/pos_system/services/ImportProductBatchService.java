package hcmut.pos_system.services;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import hcmut.pos_system.DTO.ImportProductBatchDTO;
import hcmut.pos_system.DTO.ImportProductBatchRowMapper;
import hcmut.pos_system.models.ResponseObject;

@Service
public class ImportProductBatchService {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public ResponseEntity<ResponseObject> PROC_ImportProductBatchAll(){
        try {
            List<ImportProductBatchDTO> importProductBatchDTOs = jdbcTemplate.query(
            "EXEC dbo.ImportProductBatchAll", 
            new ImportProductBatchRowMapper());
    
            return ResponseEntity.status(HttpStatus.OK)
                    .body(new ResponseObject("OK", "Query to execute PROCEDURE Import Product Batch ALL successfully", importProductBatchDTOs));

        } catch (DataAccessException e) {
            // Catch the exception raised by the RAISERROR statement
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new ResponseObject("ERROR" + ", " + e.getMessage().toString(), "Error execute PROCEDURE Import Product Batch ALL", null));
        }
    }

    public ResponseEntity<ResponseObject> PROC_importProductBatch(String SupplierName, BigDecimal MaxMoney){
        try {
            List<ImportProductBatchDTO> importProductBatchDTOs = jdbcTemplate.query(
            "EXEC dbo.ImportProductBatch @SupplierName =?, @MaxMoney =?", 
            new ImportProductBatchRowMapper(), SupplierName, MaxMoney);
    
            return ResponseEntity.status(HttpStatus.OK)
                    .body(new ResponseObject("OK", "Query to execute PROCEDURE Import Product Batch successfully", importProductBatchDTOs));

        } catch (DataAccessException e) {
            // Catch the exception raised by the RAISERROR statement
            if (e.getMessage().contains("Không tìm thấy nhà cung cấp")) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new ResponseObject("ERROR", e.getMessage(), null));
            } else {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new ResponseObject("ERROR" + ", " + e.getMessage().toString(), "Error execute PROCEDURE Import Product Batch", null));
            }
        }
    }
}
