package org.project.notablog.domains;

import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.Date;

@Entity
public class ProjectTask {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne
    private Project project;

    @ManyToOne(fetch = FetchType.EAGER)
    private User responsible;

    @NotBlank(message = "Fill the name")
    @Length(max = 255, message = "Name too long (more than 255 symbols)")
    private String name;

    @NotBlank(message = "Fill the name")
    @Length(max = 1024, message = "Name too long (more than 1024 symbols)")
    private String description;

    @Temporal(TemporalType.TIMESTAMP)
    private Date dateOfBeginning;

    private boolean status;

    public ProjectTask(Project project, User responsible, String name, String description, Date dateOfBeginning, boolean status) {
        this.project = project;
        this.responsible = responsible;
        this.name = name;
        this.description = description;
        this.dateOfBeginning = dateOfBeginning;
        this.status = status;
    }

    public ProjectTask() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public User getResponsible() {
        return responsible;
    }

    public void setResponsible(User responsible) {
        this.responsible = responsible;
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
