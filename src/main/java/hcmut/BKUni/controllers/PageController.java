package hcmut.BKUni.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import hcmut.BKUni.DTO.LoginDTO;
import hcmut.BKUni.DTO.ResponseObject;
import hcmut.BKUni.services.UserService;

@Controller
public class PageController {
    
    @Autowired
    private UserService userService;

    @RequestMapping("/")
    public String login(Model model) {
        String error = (String) model.asMap().getOrDefault("error", null);
        model.addAttribute("error", error);
        return "login";
    }

    @RequestMapping("/login")
    public String login(@ModelAttribute LoginDTO loginDTO, Model model) {
        ResponseObject response = userService.login(loginDTO);
        if ("OK".equals(response.getStatus())) {
            return "redirect:/homePage";
        } else {
            model.addAttribute("error", response.getMessage());
            return "login";
        }
    }

    @RequestMapping("/home")
    public String home() {
        return "homePage";
    }

    @RequestMapping("/about")
    public String about() {
        return "about";
    }

    @RequestMapping("/userProfile")
    public String userProfile(){
        return "userProfile";
    }

    @Controller
    @RequestMapping("/employeeList")
    public class employeeList{
        @GetMapping("")
        public String getDisplay(){
            return "employeeList";
        }   

        @GetMapping("/insert")
        public String getInsert(){
            return "insertEmployee";
        }   


        @GetMapping("/updateInfor/{employeeID}")
        public String getUpdate(@PathVariable Integer employeeID, Model model){
            model.addAttribute("employeeID", employeeID);
            return "updateInfor";
        }   
    }

    @Controller
    @RequestMapping("/supplier")
    public class supplier{
        @GetMapping("")
        public String getSuppliers(){
            return "supplier";
        }   

        @PostMapping("")
        public void postSuppliers(){

        }
    }

    @Controller
    @RequestMapping("/importBatch")
    public class importBatch{
        @GetMapping("")
        public String getImportBatch(){
            return "importBatch";
        }   

        @PostMapping("")
        public void postImportBatch(){

        }
    }

    @Controller
    @RequestMapping("/productBill")
    public class productBill{
        @GetMapping("")
        public String getProductBill(){
            return "productBill";
        }   

        @RequestMapping(value = "/totalPrice", method = RequestMethod.GET)
        public String getMethodName() {
            return "totalPrice";
        }
    }

    @Controller
    @RequestMapping("/productLot")
    public class productLot{
        @GetMapping("")
        public String getProducts(){
            return "productLot";
        }   
    }

    @Controller
    @RequestMapping("/callfunc")
    public class callfunc{
        @GetMapping("")
        public String getCallFunc(){
            return "callFunc";
        }   

        @PostMapping("")
        public void postCallFunc(){

        }
    }

}
