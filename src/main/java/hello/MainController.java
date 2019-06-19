package hello;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import hello.Blog;
import hello.BlogRepository;

@Controller    // This means that this class is a Controller
@RequestMapping(path="/demo") // This means URL's start with /demo (after Application path)
public class MainController {
	@Autowired // This means to get the bean called userRepository
	           // Which is auto-generated by Spring, we will use it to handle the data
	private BlogRepository blogRepository;

	@GetMapping(path="/add") // Map ONLY GET Requests
	public @ResponseBody String addNewBlog (@RequestParam String title
			, @RequestParam String content) {
		// @ResponseBody means the returned String is the response, not a view name
		// @RequestParam means it is a parameter from the GET or POST request

		Blog n = new Blog();
		n.setTitle(title);
		n.setContent(content);
		blogRepository.save(n);
		return "Saved";
	}

	@GetMapping(path="/all")
	public @ResponseBody Iterable<Blog> getAllBlogs() {
		// This returns a JSON or XML with the users
		return blogRepository.findAll();
    }
}