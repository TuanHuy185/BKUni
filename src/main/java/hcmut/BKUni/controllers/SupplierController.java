package hcmut.BKUni.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import hcmut.BKUni.models.ResponseObject;
import hcmut.BKUni.services.EmployeeService;
import hcmut.BKUni.services.SupplierService;

@RestController
@RequestMapping("/api/v1/Supplier")
public class SupplierController {

    @Autowired
    private SupplierService supplierService;

    @GetMapping("/getAllSupplier")
    public ResponseEntity<ResponseObject> getAllSupplier() {
        return supplierService.PROC_getAllSupplier();
    }
}
