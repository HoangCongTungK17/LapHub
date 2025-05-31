package vn.hoangtung.laptopshop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.hoangtung.laptopshop.domain.Cart;
import vn.hoangtung.laptopshop.domain.CartDetail;
import vn.hoangtung.laptopshop.domain.Order;
import vn.hoangtung.laptopshop.domain.Role;
import vn.hoangtung.laptopshop.domain.User;
import vn.hoangtung.laptopshop.service.OrderService;
import vn.hoangtung.laptopshop.service.ProductService;
import vn.hoangtung.laptopshop.service.UploadService;
import vn.hoangtung.laptopshop.service.UserService;

@Controller
public class UserController {

    private final OrderService orderService;

    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService, PasswordEncoder passwordEncoder,
            OrderService orderService) {
        // PasswordEncoder passwordEncoder
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
        this.orderService = orderService;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        Page<User> arrUsers = this.userService.getAllUsers(null);
        System.out.println(arrUsers);
        model.addAttribute("eric", "test");
        return "hello";

    }

    @RequestMapping("/admin/user")
    public String getUserPage(Model model,
            @RequestParam("page") Optional<String> pageOptional) {
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                // convert from String to int
                page = Integer.parseInt(pageOptional.get());
            } else {
                // page = 1
            }
        } catch (Exception e) {
            // page = 1
            // TODO: handle exception
        }

        PageRequest pageable = PageRequest.of(page - 1, 5);
        Page<User> usersPage = this.userService.getAllUsers(pageable);
        List<User> users = usersPage.getContent();
        model.addAttribute("users1", users);

        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", usersPage.getTotalPages());
        return "admin/user/show";
    }

    @RequestMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        System.out.println("check path id = " + id);
        model.addAttribute("user", user);
        model.addAttribute("id", id);
        return "admin/user/detail";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newUser", new User());
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUser(Model model, @ModelAttribute("newUser") User hoang) {

        hoang = this.userService.getUserById(hoang.getId());

        Cart cart = hoang.getCart();
        this.userService.deleteCart(cart);
        // xóa Cart (1-1)

        List<Order> orders = hoang.getOrders();
        for (Order order : orders) {
            this.orderService.deleteOrderById(order.getId());
        }
        // xóa Order (N-1)

        this.userService.deleteAUser(hoang.getId());
        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("newUser", currentUser);
        return "admin/user/update";
    }

    @PostMapping("admin/user/update")
    public String postUpdateUserPage(Model model, @ModelAttribute("newUser") User hoang,
            @RequestParam("hoangtungFile") MultipartFile file) {
        User currentUser = this.userService.getUserById(hoang.getId());
        String avatar = currentUser.getAvatar(); // Giữ avatar cũ nếu không upload mới

        if (currentUser != null) {
            // currentUser.setEmail(hoangtungFile.getEmail());
            if (file != null && !file.isEmpty()) {
                avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
            }
            currentUser.setEmail(hoang.getEmail());
            currentUser.setAddress(hoang.getAddress());
            currentUser.setFullName(hoang.getFullName());
            currentUser.setPhone(hoang.getPhone());
            currentUser.setAvatar(avatar);

            currentUser.setRole(this.userService.getRoleByName(hoang.getRole().getName()));
            this.userService.handleSaveUser(currentUser);
        }
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping(value = "/admin/user/create")
    public String createUserPage(Model model, @ModelAttribute("newUser") @Valid User hoang,
            BindingResult newUserBindingResult,
            @RequestParam("hoangtungFile") MultipartFile file) {

        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>>" + error.getField() + " - " + error.getDefaultMessage());
        }

        // validate
        if (newUserBindingResult.hasErrors()) {
            return "/admin/user/create";
        }

        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");

        String hashPassword = this.passwordEncoder.encode(hoang.getPassword());

        hoang.setAvatar(avatar);
        hoang.setPassword(hashPassword);
        hoang.setRole(this.userService.getRoleByName(hoang.getRole().getName()));

        this.userService.handleSaveUser(hoang);

        return "redirect:/admin/user";
    }

}
