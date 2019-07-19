package hello.entity;


import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.persistence.*;

@Entity
@Table(name = "tbl_group")
public class Group {
    
    @Id
    @Column(name = "ID_GROUP")
    private int id_group; //PK

    @Column(name = "NAME_GROUP", length = 100)
    private String name_group;

    @OneToMany(mappedBy = "group", cascade = CascadeType.ALL)
    private Set<User> users;

    @OneToMany(mappedBy = "group", cascade = CascadeType.ALL)
    private Set<Machine> machines;

    @OneToMany(mappedBy = "group", cascade = CascadeType.ALL)
    private Set<Storage> storages;

    public Group() {}
    
    public Group(int id_group, String name_group, User users, Machine machines, Storage storages) {
        this.id_group = id_group;
        this.name_group = name_group;
        this.users = Stream.of(users).collect(Collectors.toSet());
        this.users.forEach(x -> x.setGroup(this));
        this.machines = Stream.of(machines).collect(Collectors.toSet());
        this.machines.forEach(x -> x.setGroup(this));
        this.storages = Stream.of(storages).collect(Collectors.toSet());
        this.storages.forEach(x -> x.setGroup(this));
    }

    public Group(Group group) {
	}

	public int getId_group() {
        return id_group;
    }

    public void setId_group(int id_group) {
        this.id_group = id_group;
    }

    public String getName_group() {
        return name_group;
    }

    public void setName_group(String name_group) {
        this.name_group = name_group;
    }

    @Override
    public String toString() {
        return "Group [id_group=" + id_group + ", name_group=" + name_group + "]";
    }

    

}
