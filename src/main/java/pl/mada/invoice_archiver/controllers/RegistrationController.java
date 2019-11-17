package pl.mada.invoice_archiver.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.mada.invoice_archiver.model.entities.User;
import pl.mada.invoice_archiver.model.repositories.UserRepository;

@Controller
@RequestMapping("/register")
public class RegistrationController {

    private final UserRepository userRepository;

    private final PasswordEncoder passwordEncoder;


    @Autowired
    public RegistrationController(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }



    @GetMapping
    public String prepareRegistrationPage() {
        return "/WEB-INF/views/registration-form.jsp";
    }

    @PostMapping
    public String processRegistrationPage(String login, String password, String name, String surname) {

        String encodedPassword = passwordEncoder.encode(password);

        User user = new User();
        user.setLogin(login);
        user.setPassword(encodedPassword);
        user.setName(name);
        user.setSurname(surname);

        userRepository.save(user);

        return "redirect:/";
    }
}
