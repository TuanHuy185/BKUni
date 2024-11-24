package hcmut.pos_system.services;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import hcmut.pos_system.DTO.ExpiredLotDTO;
import hcmut.pos_system.DTO.ExpiredLotRowMapper;
import hcmut.pos_system.models.ResponseObject;

@Service
public class ProductLotService {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public ResponseEntity<ResponseObject> FNC_getAllProductLot(){
        try {
            List<ExpiredLotDTO> expiredLots = jdbcTemplate.query(
                "SELECT * FROM dbo.FindAllProductLots()",
                new ExpiredLotRowMapper());

                return ResponseEntity.status(HttpStatus.OK)
                    .body(new ResponseObject("OK", "Query to call Func getAllProductLot successfully", expiredLots));

        } catch (DataAccessException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
            .body(new ResponseObject("ERROR", "Query to call Func getAllProductLot error", null));

        }
     }

     public ResponseEntity<ResponseObject> FNC_getExpiredLots(LocalDate GivenDate){
        try {
            List<ExpiredLotDTO> expiredLots = jdbcTemplate.query(
                "SELECT * FROM dbo.GetExpiredLots(?)",
                new ExpiredLotRowMapper(), GivenDate);

                return ResponseEntity.status(HttpStatus.OK)
                    .body(new ResponseObject("OK", "Query to call Func getExpiredLots successfully", expiredLots));

        } catch (DataAccessException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
            .body(new ResponseObject("ERROR", "Query to call Func getExpiredLots error", null));

        }
     }

     public ResponseEntity<ResponseObject> FNC_getExpiredLotsWithProductLotId(Integer productLotId, LocalDate GivenDate){
        try {
            List<ExpiredLotDTO> expiredLots = jdbcTemplate.query(
                "SELECT * FROM dbo.GetExpiredLots(?) WHERE ProductLotID =?",
                new ExpiredLotRowMapper(), GivenDate, productLotId);

                return ResponseEntity.status(HttpStatus.OK)
                    .body(new ResponseObject("OK", "Query to call Func getExpiredLots successfully", expiredLots));

        } catch (DataAccessException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
            .body(new ResponseObject("ERROR", "Query to call Func getExpiredLots error", null));

        }
     }
}
