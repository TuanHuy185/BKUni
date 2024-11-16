package hcmut.BKUni.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hcmut.BKUni.DTO.LoginDTO;
import hcmut.BKUni.DTO.ResponseObject;
import hcmut.BKUni.models.User;
import hcmut.BKUni.repositories.UserRepository;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public ResponseObject login(LoginDTO loginDTO) {
        User user = userRepository.findByUsername(loginDTO.getUsername());
        if (user != null && user.getPassword().equals(loginDTO.getPassword())) {
            return new ResponseObject("OK", "Accepted Login", null);
        } else {
            return new ResponseObject("ERROR", "Invalid username or password", null);
        }
    }
}