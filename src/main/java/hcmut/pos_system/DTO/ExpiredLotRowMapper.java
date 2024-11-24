package hcmut.pos_system.DTO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import org.springframework.jdbc.core.RowMapper;

public class ExpiredLotRowMapper implements RowMapper<ExpiredLotDTO> {
    @Override
    public ExpiredLotDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
        ExpiredLotDTO expiredLotDTO = new ExpiredLotDTO();
        expiredLotDTO.setProductLotID(rs.getInt("productLotID"));
        expiredLotDTO.setProductTypeID(rs.getString("productTypeID"));
        expiredLotDTO.setQuantityInLot(rs.getInt("quantityInLot"));
        expiredLotDTO.setExpireDate(rs.getObject("expireDate", LocalDate.class));
        return expiredLotDTO;
    }
}
