package hello.entity;

import javax.persistence.*;
import java.util.Set;

@Entity
public class Blog {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    private String title;
    private String content;
    // para definir foraneas
    // id2 primaria de la que me quiero conectar :C
    @OneToMany(mappedBy="id2", cascade = CascadeType.ALL)
    private Set<Nota> notas;

    public Blog() { }

    public Blog(String title, String content) {
        this.setId(id);
        this.setTitle(title);
        this.setContent(content);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) { 
        this.title = title;
    }

    public String getContent() { 
        return content;
    }

    public void setContent(String content) { 
        this.content = content;
    }

    @Override
    public String toString() {
        return "Blog{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}