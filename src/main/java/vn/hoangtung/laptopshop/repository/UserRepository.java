package vn.hoangtung.laptopshop.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.hoangtung.laptopshop.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User hoang);

    List<User> findOneByEmail(String email);

    List<User> findAll();

    User findById(long id);

    void deleteById(long id);

    boolean existsByEmail(String email);

    User findByEmail(String email);

}
