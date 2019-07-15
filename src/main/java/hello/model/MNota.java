package hello.model;

import hello.entity.Nota;

public class MNota {
    public MNota(){
    }
    public MNota(Nota nota){
        this.id2 = nota.getId();
        this.status = nota.getStatus();
    }

    public MNota(long id2, String status){
        this.id2 = id2;
        this.status = status;
    }

    private long id2;
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
