package DAO;

import java.time.LocalDate;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

public class Session {

    private Integer id;
    
    private String name;
    private Long duration;
    private Long pauseTime;

    @Override
    public String toString() {
        return "Session{" +
                "id=" + id +
                ", name='" + name
                        + '\'' +
                ", duration=" + duration +
                '}';
    }

    public Session(){
    }
    
    public Session(String name
    ) {
        this.name
                = name
                ;
        Random r=new Random(); 
        this.id = r.nextInt();
    }
    
    public Session(Integer id, String name
            , Long duration){
        this.id = id;
        this.name
                = name
                ;
        this.duration = duration;
    }

    public Long getDuration() {
        return duration;
    }

    public void setDuration(long duration) {
        this.duration = duration;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName
        () {
        return name;
    }

    public void setName
        (String name
        ) {
        this.name
                = name
                ;
    }

    public Long getPauseTime(){
        return pauseTime;
    }
    
    public void StartPause() {
        pauseTime = new Date(LocalDate.now().toEpochDay()).getTime();
    }
    
    public void EndPause() {
        duration -= pauseTime;
    }
}
