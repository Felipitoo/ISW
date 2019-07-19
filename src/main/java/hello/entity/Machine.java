package hello.entity;


import javax.persistence.*;

@Entity
@Table(name = "tbl_machine")
public class Machine {
    @Id
    @Column(name = "ID_MACHINE")
    private int id_machine; //PK

    @Column(name = "USAGE_TIME")
    private int usage_time; //Horas

    @Column(name = "NAME")
    private String name;

    @Column(name = "AVAILABILITY")
    private int availability; // 0 No disponible, 1 Disponible

    @ManyToOne
    @JoinColumn
    private Group group;

    public Machine() {}

    public Machine (int id, int time, String name, int availability) {
        this.id_machine = id;
        this.usage_time = time;
        this.name = name;
        this.availability = availability;
    }

    public int getUsage_time() {
        return usage_time;
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

    public void setUsage_time(int usage_time) {
        this.usage_time = usage_time;
    }

	public Object setGroup(Group group2) {
		return null;
	}




}