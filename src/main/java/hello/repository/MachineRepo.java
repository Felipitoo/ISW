package hello.repository;

import hello.entity.Machine;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MachineRepo extends JpaRepository <Machine, Integer> {
    
}