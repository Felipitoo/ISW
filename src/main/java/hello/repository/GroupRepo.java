package hello.repository;

import hello.entity.Group;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("GroupRepo")
public interface GroupRepo extends JpaRepository <Group, Integer> {

}