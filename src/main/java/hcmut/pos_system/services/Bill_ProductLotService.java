package hcmut.pos_system.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import hcmut.pos_system.DTO.Bill_ProductLotDTO;
import hcmut.pos_system.DTO.Bill_ProductLotRowMapper;
import hcmut.pos_system.DTO.CalcBillPriceDTO;
import hcmut.pos_system.DTO.CalcBillPriceRowMapper;
import hcmut.pos_system.DTO.EmployeeDTO;
import hcmut.pos_system.DTO.EmployeeRowMapper;
import hcmut.pos_system.models.ResponseObject;

@Service
public class Bill_ProductLotService {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public ResponseEntity<ResponseObject> CalcBillPrice() {
        try {
            List<CalcBillPriceDTO> calcBillPriceDTOs = jdbcTemplate.query(
                "SELECT BillID, dbo.CalcBillPrice(BillID) AS TotalPrice FROM Bill_ProductLot GROUP BY BillID", new CalcBillPriceRowMapper());
                
            return ResponseEntity.status(HttpStatus.OK)
                    .body(new ResponseObject("OK", "Query to call Func CalcBillPrice successfully", calcBillPriceDTOs));
        } catch (DataAccessException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
            .body(new ResponseObject("ERROR", "Query to call Func CalcBillPrice error", null));
        }
    }

    public ResponseEntity<ResponseObject> PROC_callAllBill() {
        try {
            List<Bill_ProductLotDTO> bill_ProductLotDTOs = jdbcTemplate.query(
            "EXEC dbo.CallAllBill", new Bill_ProductLotRowMapper());

            return ResponseEntity.status(HttpStatus.OK)
                    .body(new ResponseObject("OK", "Query to call All Bill successfully", bill_ProductLotDTOs));
        } catch(DataAccessException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new ResponseObject("ERROR" + ", " + e.getMessage().toString(), "Error calling All Bill", null));
        }
    }
}
