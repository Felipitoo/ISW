package hello.entity;


import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.persistence.*;

@Entity
@Table(name = "tbl_type_user")
public class Type_User {
    
    @Id
    @Column(name = "ID_TYPE_USER")
    private int id_type_user;

    @Column(name = "TYPE_NAME", length = 100)
    private String type_name;

    @OneToMany(mappedBy = "type_user", cascade = CascadeType.ALL)
    private Set<User> users;


    public Type_User() {}

    public Type_User(int id_type_user, String type_name, User users) {
        this.id_type_user = id_type_user;
        this.type_name = type_name;
        this.users = Stream.of(users).collect(Collectors.toSet());
        this.users.forEach(x -> x.setType_User(this));

    }

    public int getId_type_user() {
        return id_type_user;
    }

    public void setId_type_user(int id_type_user) {
        this.id_type_user = id_type_user;
    }

    public String getType_name() {
        return type_name;
    }

    public void setType_name(String type_name) {
        this.type_name = type_name;
    }

    @Override
    public String toString() {
        return "Type_User [id_type_user=" + id_type_user + ", type_name=" + type_name + "]";
    }

    


 

}