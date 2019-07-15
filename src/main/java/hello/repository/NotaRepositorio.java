package hello.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Repository;
import java.io.Serializable;
import hello.entity.Nota;

@Repository("repositorio")
public interface NotaRepositorio extends JpaRepository<Nota, Serializable>,
                                            PagingAndSortingRepository<Nota, Serializable>{
    public abstract Nota findByStatus(String status);
    public abstract Nota findByStatusAndId2(String status, long id2);
    public abstract Nota findById2(long id2);
    public abstract Page<Nota> findAll(Pageable pageable);
}