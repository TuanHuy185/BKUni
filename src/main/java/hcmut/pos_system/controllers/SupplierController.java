package hcmut.pos_system.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import hcmut.pos_system.models.ResponseObject;
import hcmut.pos_system.services.EmployeeService;
import hcmut.pos_system.services.SupplierService;

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
