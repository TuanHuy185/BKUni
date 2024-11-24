package hcmut.pos_system.controllers;

import org.springframework.http.ResponseEntity;
import hcmut.pos_system.models.ResponseObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import hcmut.pos_system.services.Bill_ProductLotService;

@RestController
@RequestMapping("/api/v1/Bill-ProductLot")
public class Bill_ProductLotController {
    @Autowired
    private Bill_ProductLotService bill_ProductLotService;

    @GetMapping("/CalcBillPrice")
    public ResponseEntity<ResponseObject> calcBillPrice(){
        return bill_ProductLotService.CalcBillPrice();
    }

    @GetMapping("/callAllBill")
    public ResponseEntity<ResponseObject> callAllBill(){
        return bill_ProductLotService.PROC_callAllBill();
    }
}
