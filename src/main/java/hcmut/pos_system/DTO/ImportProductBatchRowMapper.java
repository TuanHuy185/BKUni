package hcmut.pos_system.DTO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import org.springframework.jdbc.core.RowMapper;

public class ImportProductBatchRowMapper implements RowMapper<ImportProductBatchDTO>  {
    @Override
    public ImportProductBatchDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
        ImportProductBatchDTO importProductBatchDTO = new ImportProductBatchDTO();
        importProductBatchDTO.setBranchID(rs.getInt("BranchID"));
        importProductBatchDTO.setBatchDate(rs.getObject("BatchDate", LocalDate.class));
        importProductBatchDTO.setProductTypeName(rs.getString("ProductTypeName"));
        importProductBatchDTO.setTotalQuantity(rs.getInt("TotalQuantity"));
        importProductBatchDTO.setTotal(rs.getBigDecimal("Total"));
        return importProductBatchDTO;
    }
}
