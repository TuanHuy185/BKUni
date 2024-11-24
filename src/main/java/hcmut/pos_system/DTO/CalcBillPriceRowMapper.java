package hcmut.pos_system.DTO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import org.springframework.jdbc.core.RowMapper;

public class CalcBillPriceRowMapper implements RowMapper<CalcBillPriceDTO> {
    @Override
    public CalcBillPriceDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
        CalcBillPriceDTO calcBillPriceDTO = new CalcBillPriceDTO();
        calcBillPriceDTO.setBillID(rs.getInt("BillID"));
        calcBillPriceDTO.setTotalPrice(rs.getBigDecimal("TotalPrice"));
        return calcBillPriceDTO;
    }
}
