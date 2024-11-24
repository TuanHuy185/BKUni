package hcmut.pos_system.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import hcmut.pos_system.DTO.LoginDTO;
import hcmut.pos_system.DTO.ResponseObject;
import hcmut.pos_system.services.UserService;

@RestController
@RequestMapping("/api/v1/User")
public class UserController {
    @Autowired
    private UserService userService;

    @PostMapping("/login")
    public ResponseEntity<ResponseObject> login(@RequestBody LoginDTO request) {
        ResponseObject response = userService.login(request);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }
}