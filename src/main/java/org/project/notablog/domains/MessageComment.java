package org.project.notablog.domains;

import javax.persistence.*;
import java.util.Date;

@Entity
public class MessageComment {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    private String text;

    @Temporal(TemporalType.TIMESTAMP)
    private Date date;

    @ManyToOne
    private Message message;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;

    public MessageComment(Message message, User user, String text, Date date) {
        this.text = text;
        this.date = date;
        this.message = message;
        this.user = user;
    }

    public MessageComment() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Message getMessage() {
        return message;
    }

    public void setMessage(Message message) {
        this.message = message;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
