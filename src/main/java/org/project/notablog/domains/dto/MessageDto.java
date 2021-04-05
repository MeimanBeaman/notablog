package org.project.notablog.domains.dto;

import org.project.notablog.domains.Message;
import org.project.notablog.domains.User;
import org.project.notablog.domains.util.MessageHelper;

import java.util.Date;

public class MessageDto {
    private Long id;
    private String postTitle;
    private String text;
    private String tag;
    private Date date;
    private User author;
    private String filename;
    private Long likes;
    private Boolean meLiked;

    public MessageDto(Message message, Long likes, Boolean meLiked) {
        this.id = message.getId();
        this.postTitle = message.getPostTitle();
        this.text = message.getText();
        this.tag = message.getTag();
        this.date = message.getDate();
        this.author = message.getAuthor();
        this.filename = message.getFilename();
        this.likes = likes;
        this.meLiked = meLiked;
    }

    public String getAuthorName() {
        return MessageHelper.getAuthorName(author);
    }

    public Long getId() {
        return id;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public String getText() {
        return text;
    }

    public String getTag() {
        return tag;
    }

    public Date getDate() {
        return date;
    }

    public User getAuthor() {
        return author;
    }

    public String getFilename() {
        return filename;
    }

    public Long getLikes() {
        return likes;
    }

    public Boolean getMeLiked() {
        return meLiked;
    }

    @Override
    public String toString() {
        return "MessageDto{" +
                "id=" + id +
                ", postTitle='" + postTitle +
                ", date=" + date +
                ", author=" + author +
                ", likes=" + likes +
                ", meLiked=" + meLiked +
                '}';
    }
}
