package hello.entity;

import javax.persistence.*;


@Entity
@Table(name = "tbl_tool")
public class Tool {
    @Id
    @Column(name = "ID_TOOL")
    public int id_tool;

    @Column(name = "NAME")
    public String name;

    @Column(name = "AVAILABILITY")
    public int availability; //0 no disponible, 1 disponible

    @ManyToOne
    @JoinColumn
    private Storage storage;

    @ManyToOne
    @JoinColumn
    private Loan loan;

    public Tool() {} 

    public Tool(int id, String name, int availability) { 
        this.id_tool = id;
        this.name = name;
        this.availability = availability;
    }


    public int getId_tool() {
        return id_tool;
    }

    public void setId_tool(int id) {
        this.id_tool = id;
    }

    public int getAvailability() {
        return availability;
    }

    public void setAvailability(int availability) {
        this.availability = availability;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

	public Object setGroup(Loan loan) {
		return null;
	}

	public Object setStorage(Storage storage2) {
		return null;
	}

	public Object setLoan(Loan loan2) {
		return null;
	}










}