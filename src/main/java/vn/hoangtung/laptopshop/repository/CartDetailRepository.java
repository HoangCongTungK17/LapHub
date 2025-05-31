package vn.hoangtung.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.hoangtung.laptopshop.domain.Cart;
import vn.hoangtung.laptopshop.domain.CartDetail;
import vn.hoangtung.laptopshop.domain.Product;
import java.util.List;

public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
    boolean existsByCartAndProduct(Cart cart, Product product);

    CartDetail findByCartAndProduct(Cart cart, Product product);
}
