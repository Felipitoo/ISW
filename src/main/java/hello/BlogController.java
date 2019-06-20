package hello;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
public class BlogController {

    @Autowired
    BlogRepository blogRepository;

    /*@GetMapping("/blog")
    public List<Blog> index(){
        return blogRepository.findAll();
    }*/

    /*@GetMapping("/blog/{id}")
    public Blog show(@PathVariable String id){
        int blogId = Integer.parseInt(id);
        return blogRepository.findOne(blogId);
    }*/

    @PostMapping(value="/blog/search")
    public List<Blog> search(@RequestBody Map <String, String> body){
        String searchTerm = body.get("text");
        return blogRepository.findByTitleContainingOrContentContaining(searchTerm, searchTerm);
    }

    @RequestMapping(value = "/blog", method = RequestMethod.GET)
    public List<Blog> welcome() {
     return blogRepository.findAll();
    }

    /*
    @PutMapping("/blog/{id}")
    public Blog update(@PathVariable String id, @RequestBody Map<String, String> body){
        int blogId = Integer.parseInt(id);
        Blog blog = blogRepository.findOne(blogId);
        blog.setTitle(body.get("title"));
        blog.setContent(body.get("content"));
        return blogRepository.save(blog);
    }*/
    /*
    @DeleteMapping("blog/{id}")
    public boolean delete(@PathVariable String id){
        int blogId = Integer.parseInt(id);
        blogRepository.delete(blogId);
        return true;
    }*/

}