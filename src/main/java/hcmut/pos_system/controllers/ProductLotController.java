package hcmut.pos_system.controllers;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import hcmut.pos_system.models.ResponseObject;
import hcmut.pos_system.services.ProductLotService;

@RestController
@RequestMapping("/api/v1/ProductLot")
public class ProductLotController { 
    @Autowired
    private ProductLotService productLotService;

    @GetMapping("/getAllProductLot")
    public ResponseEntity<ResponseObject> getAllProductLot() {
        return productLotService.FNC_getAllProductLot();
    }

    @GetMapping("/getExpiredLots")
    public ResponseEntity<ResponseObject> getExpiredLots(
        @RequestParam("date") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate givenDate) {
        return productLotService.FNC_getExpiredLots(givenDate);
    }

    @GetMapping("/getExpiredLotsWithProductLotId/{productLotId}")
    public ResponseEntity<ResponseObject> getExpiredLotsWithProductLotId(
        @PathVariable Integer productLotId, 
        @RequestParam("date") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate givenDate) {
        return productLotService.FNC_getExpiredLotsWithProductLotId(productLotId, givenDate);
    }
}
