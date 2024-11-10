package hcmut.BKUni.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import hcmut.BKUni.DTO.Bill_ProductLotDTO;
import hcmut.BKUni.DTO.Bill_ProductLotRowMapper;
import hcmut.BKUni.DTO.CalcBillPriceDTO;
import hcmut.BKUni.DTO.CalcBillPriceRowMapper;
import hcmut.BKUni.DTO.EmployeeDTO;
import hcmut.BKUni.DTO.EmployeeRowMapper;
import hcmut.BKUni.models.ResponseObject;

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
