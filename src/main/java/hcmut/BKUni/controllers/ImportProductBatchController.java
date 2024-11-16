package hcmut.BKUni.controllers;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import hcmut.BKUni.models.ResponseObject;
import hcmut.BKUni.services.ImportProductBatchService;

@RestController
@RequestMapping("/api/v1/ImportProductBatch")
public class ImportProductBatchController {
    @Autowired
    ImportProductBatchService importProductBatchService;

    @GetMapping("/getAllProductBatch")
    public ResponseEntity<ResponseObject> getAllProductBatch() {
        return importProductBatchService.PROC_ImportProductBatchAll();
    }

    @GetMapping("/getImportProductBatch")
    public ResponseEntity<ResponseObject> importProductBatch(@RequestParam("supplierName") String supplierName,
                                                              @RequestParam("maxMoney") BigDecimal maxMoney) {
        return importProductBatchService.PROC_importProductBatch(supplierName, maxMoney);
    }
}
