package org.project.notablog.service;

import org.project.notablog.domains.Message;
import org.project.notablog.domains.User;
import org.project.notablog.domains.dto.MessageDto;
import org.project.notablog.repos.MessageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EntityManager;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Service
public class MessageService {
    @Value("${upload.path}" + "/post_images")
    private String uploadPath;

    @Autowired
    private MessageRepo messageRepo;

    public Page<MessageDto> messageList(String filter, Pageable pageable, User user) {
        if (filter != null && !filter.isEmpty()) {
            return messageRepo.findByTag(filter, pageable, user);
        } else {
            return messageRepo.findAll(pageable, user);
        }
    }

    public Page<MessageDto> userFeed(String filter, Pageable pageable, User user) {
        if (filter != null && !filter.isEmpty()) {
            return messageRepo.findBySubscriptionByTag(filter, pageable, user);
        } else {
            return messageRepo.findBySubscription(pageable, user);
        }
    }

    public Page<MessageDto> messageListForUser(Pageable pageable, User currentUser, User author) {
        return messageRepo.findByUser(pageable, author, currentUser);
    }

    public void saveFile(@Valid Message message, @RequestParam("file") MultipartFile file) throws IOException {
        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists())
                uploadDir.mkdir();

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFilename));

            message.setFilename(resultFilename);
        }
    }

    public void deleteFile(String post) {
        File file = new File(uploadPath, post);
        file.delete();
    }

}
