package vn.hoangtung.laptopshop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import vn.hoangtung.laptopshop.domain.Cart;
import vn.hoangtung.laptopshop.domain.CartDetail;
import vn.hoangtung.laptopshop.domain.Order;
import vn.hoangtung.laptopshop.domain.OrderDetail;
import vn.hoangtung.laptopshop.domain.Role;
import vn.hoangtung.laptopshop.domain.User;
import vn.hoangtung.laptopshop.domain.dto.RegisterDTO;
import vn.hoangtung.laptopshop.repository.CartDetailRepository;
import vn.hoangtung.laptopshop.repository.CartRepository;
import vn.hoangtung.laptopshop.repository.OrderRepository;
import vn.hoangtung.laptopshop.repository.ProductRepository;
import vn.hoangtung.laptopshop.repository.RoleRepository;
import vn.hoangtung.laptopshop.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final OrderRepository orderRepository;
    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository, OrderRepository orderRepository,
            ProductRepository productRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.orderRepository = orderRepository;
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
    }

    public Page<User> getAllUsers(Pageable page) {
        return this.userRepository.findAll(page);
    }

    public List<User> getAllUserByEmail(String email) {
        return this.userRepository.findOneByEmail(email);
    }

    public User getUserById(long id) {
        return this.userRepository.findById(id);
    }

    public User handleSaveUser(User user) {
        User eric = this.userRepository.save(user);
        System.out.println(eric);
        return eric;
    }

    public void deleteAUser(long id) {
        this.userRepository.deleteById(id);
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    public User registerDTOtoUser(RegisterDTO registerDTO) {
        User user = new User();
        user.setFullName(registerDTO.getFirstName() + " " + registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());
        return user;
    }

    public boolean checkEmailExist(String email) {
        return this.userRepository.existsByEmail(email);
    }

    public User getUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public long countUsers() {
        return this.userRepository.count();
    }

    public long countProducts() {
        return this.productRepository.count();
    }

    public long countOrders() {
        return this.orderRepository.count();
    }

    public void deleteCart(Cart cart) {
        if (cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetails();
            if (cartDetails != null) {
                for (CartDetail cd : cartDetails) {
                    this.cartDetailRepository.delete(cd);
                }
            }
            this.cartRepository.delete(cart);
        }
    }

}