package hello.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
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
