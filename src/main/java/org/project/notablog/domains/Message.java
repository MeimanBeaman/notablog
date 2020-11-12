package org.project.notablog.domains;

import org.hibernate.validator.constraints.Length;
import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.Date;

@Entity
public class Message {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @NotBlank(message = "Fill the title")
    @Length(max = 255, message = "Title too long (more than 4096 symbols)")
    private String postTitle;

    @NotBlank(message = "Fill the message")
    @Length(max = 4096, message = "Message too long (more than 4096 symbols)")
    private String text;

    @Length(max = 64, message = "Tag too long")
    private String tag;

    @Temporal(TemporalType.TIMESTAMP)
    private Date date;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    private String filename;

    public Message() {
    }

    public Message(String postTitle, String text, String tag, User user, Date date) {
        this.postTitle = postTitle;
        this.text = text;
        this.tag = tag;
        this.author = user;
        this.date = date;
    }

    public String getAuthorName() {
        return author != null ? author.getUsername() : "<no author>";
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

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }
}
