package vn.hoangtung.laptopshop.repository;

import org.apache.catalina.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.hoangtung.laptopshop.domain.Cart;
import java.util.List;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {
    Cart findByUser(vn.hoangtung.laptopshop.domain.User user);
}
