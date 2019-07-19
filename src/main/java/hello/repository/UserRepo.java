package hello.repository;

import hello.entity.User;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("UserRepo")
public interface UserRepo extends JpaRepository<User, Integer> {

    List<User> findAll();
}