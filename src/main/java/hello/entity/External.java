package hello.entity;

import javax.persistence.*;

@Entity
@Table(name = "tbl_external")
public class External {
    @Id
    @Column(name = "ID_EXTERNAL")
    private int id_external;

    @Column(name = "NAME")
    private String name;

    @Column(name = "RUT")
    private String rut;

    @ManyToOne
    @JoinColumn
    private Loan loan;


    public External() {}

    public External(int id_external, String name, String rut) {
        this.id_external = id_external;
        this.name = name;
        this.rut = rut;
    }

    public String getName() {
        return name;
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId_external() {
        return id_external;
    }

    public void setId_external(int id_external) {
        this.id_external = id_external;
    }

	public Object setLoan(Loan loan2) {
		return null;
	}

}