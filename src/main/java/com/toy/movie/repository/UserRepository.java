package com.toy.movie.repository;

import com.toy.movie.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

/**
 * packageName    : com.toy.movie.repository
 * fileName       : UserRepository
 * author         : shipowner
 * date           : 2023-09-15
 * description    : User 엔티티를 관리하기 위한 Repository
 */
public interface UserRepository extends JpaRepository<User, Long>, UserRepositoryCustom {

    Optional<User> findByEmail(String email);
    Optional<User> findById(Long id);
}
