package org.project.notablog.repos;

import org.project.notablog.domains.Project;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import java.util.List;

public interface ProjectRepo extends CrudRepository<Project, Long>{
    @Query("from Project ")
    List<Project> findAllProjects();


}
