package hello;

import org.springframework.stereotype.Repository;
import org.springframework.data.repository.CrudRepository;


import java.util.List;

@Repository

public interface BlogRepository extends CrudRepository<Blog, Integer> {

    List<Blog> findByTitleContainingOrContentContaining(String text, String textAgain);

	//Blog findOne(int blogId);

	//void delete(int blogId);

	List<Blog> findAll();

}
