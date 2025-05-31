package vn.hoangtung.laptopshop.controller.client;

import java.net.http.HttpRequest;
import java.util.List;

import vn.hoangtung.laptopshop.domain.User;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.ui.Model;

import vn.hoangtung.laptopshop.domain.Order;
import vn.hoangtung.laptopshop.domain.Product;
import vn.hoangtung.laptopshop.domain.dto.RegisterDTO;
import vn.hoangtung.laptopshop.service.ProductService;
import vn.hoangtung.laptopshop.service.UploadService;
import vn.hoangtung.laptopshop.service.UserService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class HomePageController {

    private final ProductService productService;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;
    private final UploadService uploadService;

    public HomePageController(ProductService productService, UserService userService, PasswordEncoder passwordEncoder,
            UploadService uploadService) {
        this.productService = productService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.uploadService = uploadService;
    }

    @GetMapping("/")
    public String getHomePage(Model model, HttpServletRequest request) {
        // List<Product> products = this.productService.fetchProducts();
        Pageable pageable = PageRequest.of(0, 12);
        Page<Product> prs = this.productService.fetchProducts(pageable);
        List<Product> products = prs.getContent();

        model.addAttribute("products", products);
        return "client/homepage/show";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String handleRegister(@ModelAttribute("registerUser") RegisterDTO registerDTO) {

        User user = this.userService.registerDTOtoUser(registerDTO);
        String hashPassword = this.passwordEncoder.encode(user.getPassword());

        user.setPassword(hashPassword);
        user.setRole(this.userService.getRoleByName("USER"));

        // save
        this.userService.handleSaveUser(user);

        return "redirect:/login";

    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {
        return "client/auth/login";
    }

    @GetMapping("/acess-deny")
    public String getDenyPage(Model model) {
        return "client/auth/deny";
    }

    @GetMapping("/order-history")
    public String getOrderHistoryPage(Model model, HttpServletRequest request) {
        User currentUser = new User();// null
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser = this.userService.getUserById(id);

        List<Order> orders = currentUser.getOrders();
        model.addAttribute("orders", orders);

        return "client/homepage/order-history";
    }

    @GetMapping("/account-management")
    public String getAccountManagementPage(Model model, HttpServletRequest request) {
        User currentUser = new User();// null
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser = this.userService.getUserById(id);

        model.addAttribute("newUser", currentUser);

        return "client/homepage/account-management";
    }

    @PostMapping("/account-management")
    public String postUpdateUser(Model model, @ModelAttribute("newUser") User hoangtung,
            @RequestParam("hoangtungFile") MultipartFile file, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        User currentUser = this.userService.getUserById(hoangtung.getId());
        String avatar = currentUser.getAvatar(); // Giữ avatar cũ nếu không upload mới
        if (currentUser != null) {
            // currentUser.setEmail(hoangtung.getEmail());
            if (file != null && !file.isEmpty()) {
                avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
            }
            currentUser.setEmail(hoangtung.getEmail());
            currentUser.setFullName(hoangtung.getFullName());
            currentUser.setAddress(hoangtung.getAddress());
            currentUser.setPhone(hoangtung.getPhone());
            currentUser.setAvatar(avatar);
            session.setAttribute("avatar", avatar);
            currentUser.setRole(this.userService.getRoleByName(hoangtung.getRole().getName()));
            this.userService.handleSaveUser(currentUser);
        }
        return "redirect:/updated";
    }

    @GetMapping("/updated")
    public String getUpdatedPage() {
        return "client/homepage/updated";
    }

}
