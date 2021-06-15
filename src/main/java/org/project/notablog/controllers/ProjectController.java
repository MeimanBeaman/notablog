package org.project.notablog.controllers;

import com.google.common.collect.Iterables;
import com.google.common.collect.Ordering;
import org.project.notablog.domains.Project;
import org.project.notablog.domains.ProjectTask;
import org.project.notablog.domains.User;
import org.project.notablog.repos.ProjectRepo;
import org.project.notablog.repos.ProjectTaskRepo;
import org.project.notablog.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/projects")
public class ProjectController {
    @Autowired
    ProjectRepo projectRepo;

    @Autowired
    ProjectTaskRepo projectTaskRepo;

    @Autowired
    UserRepo userRepo;

    @GetMapping("/")
    public String projects (@AuthenticationPrincipal User user, Model model) {
        List<Project> projects = projectRepo.findAllProjects();

        Collections.reverse(projects);
        model.addAttribute("user", user);
        //TODO revers
        model.addAttribute("projects", projects);
        return "projectsList";
    }

    @PostMapping("/")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String createProject(
            @RequestParam String name,
            @RequestParam String description,
            @RequestParam Long lead
    ) {
        Project project = new Project();
        project.setName(name);
        project.setDescription(description);
        project.setLead(userRepo.findById(lead).get());
        Date date = new Date();
        project.setDateOfBeginning(date);
        project.setStatus(false);

        projectRepo.save(project);

        return "redirect:/projects/" + project.getId();
    }

    @GetMapping("/{project}")
    public String project(
            @PathVariable Project project,
            @AuthenticationPrincipal User user,
            Model model
    ) {
        List<ProjectTask> tasks = projectTaskRepo.findByProject(project);

        Collections.reverse(tasks);
        model.addAttribute("project", project);
        model.addAttribute("tasks", tasks);

        return "project";
    }

    @PostMapping("/{project}")
    public String addTask(
            @PathVariable Project project,
            @AuthenticationPrincipal User user,
            @RequestParam Long worker,
            @RequestParam String name,
            @RequestParam String description
    ) {
        if (project.getLead().getId().equals(user.getId())) {
            ProjectTask projectTask = new ProjectTask();
            Date date = new Date();
            projectTask.setProject(project);
            projectTask.setName(name);
            projectTask.setDescription(description);
            projectTask.setResponsible(userRepo.findById(worker).get());
            projectTask.setDateOfBeginning(date);
            projectTask.setStatus(false);

            projectTaskRepo.save(projectTask);
        }

        return "redirect:/projects/" + project.getId().toString();
    }

    @GetMapping("/changeStatus/{project}")
    public String changeStatus(
            @PathVariable Project project
    ) {
        if (project.isStatus()) {
            project.setStatus(false);
        } else {
            project.setStatus(true);
        }

        return "redirect:/projects/" + project.getId().toString();
    }

    @Transactional
    @GetMapping("/delete/{project}")
    public String deleteTask(
            @AuthenticationPrincipal User user,
            @PathVariable Project project
    ) {
        if (project.getLead().getId().equals(user.getId())) {
            projectTaskRepo.deleteByProject(project);
            projectRepo.delete(project);
        }

        return "redirect:/projects/";
    }

    @GetMapping("/task/changeStatus/{task}")
    public String changeTaskStatus(
            @PathVariable ProjectTask task
    ) {
        if (task.isStatus()) {
            task.setStatus(false);
        } else {
            task.setStatus(true);
        }

        return "redirect:/projects/" + task.getProject().getId().toString();
    }

    @GetMapping("/task/delete/{task}")
    public String deleteTask(
            @AuthenticationPrincipal User user,
            @PathVariable ProjectTask task
    ) {
        if (task.getResponsible().getId().equals(user.getId())) {
            projectTaskRepo.delete(task);
        }

        return "redirect:/projects/" + task.getProject().getId().toString();
    }
}
