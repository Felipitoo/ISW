package hello.entity;

import javax.persistence.*;
import java.io.Serializable;

@Table(name="nota")
@Entity
public class Nota implements Serializable {
    private static final long serialVersionUID = 1L;

    public Nota() {
    }
    public Nota(long id2, String status){
        this.id2 = id2;
        this.status = status;
    }

    @GeneratedValue
    @Id
    @Column(name="id2")
    private long id2;

    // cuando se tenga que hacer un insert, no se le pasa el id, se le pasa el obejeto como foranea
    // cuando cree la nota, debo pasarle el objeto blog, no la id.
    @ManyToOne
    @JoinColumn(name = "id")
    private Blog id;

    @Column(name="status")
    private String status;


    public long getId() {
        return id2;
    }

    public void setId(long id2) {
        this.id2 = id2;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
