package pl.mada.invoice_archiver.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class MyController {

    @RequestMapping(method = RequestMethod.GET)
    public String index(){
        return "index";
    }

}
