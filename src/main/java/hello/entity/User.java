package hello.entity;

import javax.persistence.*;

@Entity
@Table(name = "tbl_user")
public class User { 
    
    @Id
    @Column(name = "ID_USER")
    private int id_user; //PK

    @Column(name = "NAME")
    private String name;

    @Column(name = "EMAIL")
    private String email;

    @Column(name = "USER_NAME")
    private String user_name;

    @Column(name = "PASSWORD")
    private String password;

    @ManyToOne
    @JoinColumn
    private Type_User type_user;

    @ManyToOne
    @JoinColumn
    private Group group;

    public User() {}

    public User(User user) {}

    public User(int id_user, String name, String email, String user_name, String password) {
        this.id_user = id_user;
        this.name = name;
        this.email = email;
        this.user_name = user_name;
        this.password = password;
    }

	public Object setGroup(Group group2) {
		return null;
	}

	public Object setType_User(Type_User type_User2) {
		return null;
	}

}