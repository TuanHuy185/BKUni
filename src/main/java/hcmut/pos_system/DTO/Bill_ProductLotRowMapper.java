package hcmut.pos_system.DTO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import org.springframework.jdbc.core.RowMapper;

public class Bill_ProductLotRowMapper implements RowMapper<Bill_ProductLotDTO> {
    @Override
    public Bill_ProductLotDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
        Bill_ProductLotDTO bill_ProductLotDTO = new Bill_ProductLotDTO();
        bill_ProductLotDTO.setBillID(rs.getInt("BillID"));
        bill_ProductLotDTO.setProductTypeID(rs.getString("ProductTypeID"));
        bill_ProductLotDTO.setProductLotID(rs.getInt("ProductLotID"));
        bill_ProductLotDTO.setQuantityInBill(rs.getInt("QuantityInBill"));
        bill_ProductLotDTO.setSalePrice(rs.getBigDecimal("SalePrice"));
        return bill_ProductLotDTO;
    }
}