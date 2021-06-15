package org.project.notablog.domains;

import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.Date;

@Entity
public class Project {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    private User lead;

    @NotBlank(message = "Fill the name")
    @Length(max = 255, message = "Name too long (more than 255 symbols)")
    private String name;

    @NotBlank(message = "Fill the name")
    @Length(max = 4096, message = "Name too long (more than 4096 symbols)")
    private String description;

    @Temporal(TemporalType.TIMESTAMP)
    private Date dateOfBeginning;

    private boolean status;

    public Project(User lead, String name, String description, Date dateOfBeginning, boolean status) {
        this.lead = lead;
        this.name = name;
        this.description = description;
        this.dateOfBeginning = dateOfBeginning;
        this.status = status;
    }

    public Project() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getLead() {
        return lead;
    }

    public void setLead(User lead) {
        this.lead = lead;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDateOfBeginning() {
        return dateOfBeginning;
    }

    public void setDateOfBeginning(Date dateOfBeginning) {
        this.dateOfBeginning = dateOfBeginning;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
