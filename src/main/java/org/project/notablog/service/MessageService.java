package org.project.notablog.service;

import org.project.notablog.domains.Message;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Service
public class MessageService {
    @Value("${upload.path}")
    private String uploadPath;

    //TODO вынести форматирование в javascript
    @Deprecated
    public void messageFormatting(Iterable<Message> messages) {
        messages.forEach(message -> message.setText(message.getText().replace("\n", "<br>")));
        messages.forEach(message -> message.setTag(message.getTag().toLowerCase()));
        messages.forEach(message -> message.setTag(message.getTag().replace(" ", "_")));
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
}
