package hcmut.pos_system.controllers;

import org.hibernate.mapping.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import hcmut.pos_system.DTO.EmployeeDTO;
import hcmut.pos_system.models.Employee;
import hcmut.pos_system.models.ResponseObject;
import hcmut.pos_system.services.EmployeeService;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@RestController
@RequestMapping("/api/v1/Employee")
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

     // Tìm tất cả employee
     // chưa dùng
    @GetMapping("/getAllEmployee")
    public ResponseEntity<ResponseObject> getAllEmployee() {
        return employeeService.PROC_getAllEmployee();
    }

    @GetMapping("/branch/{branchID}")
    public ResponseEntity<ResponseObject> getEmployeesBybranchID(@PathVariable Integer branchID) {
        return  employeeService.PROC_findEmployeesByBranchID(branchID);
    }

    @GetMapping("/search/{employeeKey}") // look to not used
    public ResponseEntity<ResponseObject> getEmployeesBybranchID(@PathVariable String employeeKey) {
        return  employeeService.FNC_getMatchedEmployees(employeeKey);
    }

    @PostMapping("/searchBody")
    public ResponseEntity<ResponseObject> searchEmployees(@RequestBody SearchRequest request) {
        return  employeeService.FNC_getMatchedEmployees(request.getValue());
    }

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class SearchRequest {
        private String value;
    }

    @GetMapping("/{employeeID}")
    public ResponseEntity<ResponseObject> getEmployeesByEmployeeID(@PathVariable Integer employeeID) {
        return  employeeService.PROC_findEmployeeByEmployeeID(employeeID);
    }

    @PostMapping("/insertEmployee")
    public ResponseEntity<ResponseObject> insertEmployee(@RequestBody EmployeeDTO newEmployee) {
        return employeeService.PROC_insertEmp(newEmployee);
    }

    @PostMapping("/updateEmployee")
    public ResponseEntity<ResponseObject> updateEmployee(@RequestBody EmployeeDTO employee) {
        return employeeService.PROC_updateEmp(employee);
    }

    @GetMapping("/deleteById/{employeeId}")
    public ResponseEntity<ResponseObject> deleteEmployeeById(@PathVariable Integer employeeId) {
        return employeeService.PROC_deleteEmployeeById(employeeId);
    }

    /* SORT METHOD */
    @GetMapping("/sort/employeeID/ASC")
    public ResponseEntity<ResponseObject> employeeID_ASC() {
        return employeeService.PROC_employeeID_ASC();
    }

    @GetMapping("/sort/employeeID/DESC")
    public ResponseEntity<ResponseObject> employeeID_DESC() {
        return employeeService.PROC_employeeID_DESC();
    }

    @GetMapping("/sort/supervisorID/ASC")
    public ResponseEntity<ResponseObject> supervisorID_ASC() {
        return employeeService.PROC_supervisorID_ASC();
    }

    @GetMapping("/sort/supervisorID/DESC")
    public ResponseEntity<ResponseObject> supervisorID_DESC() {
        return employeeService.PROC_supervisorID_DESC();
    }

    @GetMapping("/sort/branchID/ASC")
    public ResponseEntity<ResponseObject> branchID_ASC() {
        return employeeService.PROC_branchID_ASC();
    }

    @GetMapping("/sort/branchID/DESC")
    public ResponseEntity<ResponseObject> branchID_DESC() {
        return employeeService.PROC_branchID_DESC();
    }

    /* EMPLOYEE TYPE */
    @GetMapping("/employeeType/cashier")
    public ResponseEntity<ResponseObject> cashier() {
        return employeeService.PROC_callCashier();
    }

    @GetMapping("/employeeType/manager")
    public ResponseEntity<ResponseObject> manager() {
        return employeeService.PROC_callManager();
    }

    @GetMapping("/employeeType/supervisor")
    public ResponseEntity<ResponseObject> supervisor() {
        return employeeService.PROC_callSupervisor();
    }

    @GetMapping("/employeeType/normalEmployee")
    public ResponseEntity<ResponseObject> normalEmployee() {
        return employeeService.PROC_callNormalEmployee();
    }
}
