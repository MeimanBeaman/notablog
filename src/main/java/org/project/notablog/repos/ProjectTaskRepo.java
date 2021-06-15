package org.project.notablog.repos;

import org.project.notablog.domains.Project;
import org.project.notablog.domains.ProjectTask;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ProjectTaskRepo extends CrudRepository<ProjectTask, Long>{
    List<ProjectTask> findByProject(Project project);

    void deleteByProject(Project project);

}
