package vn.hoangtung.laptopshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;

import vn.hoangtung.laptopshop.domain.Product;
import vn.hoangtung.laptopshop.domain.Role;

public interface ProductRepository extends JpaRepository<Product, Long> {
    Page<Product> findAll(Pageable page);

    Page<Product> findAll(Specification<Product> spec, Pageable page);
}
