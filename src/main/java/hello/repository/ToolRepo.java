package hello.repository;

import hello.entity.Tool;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ToolRepo extends JpaRepository <Tool, Integer> {
    
}