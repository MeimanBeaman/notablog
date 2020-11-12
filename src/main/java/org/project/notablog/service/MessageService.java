package org.project.notablog.service;

import org.project.notablog.domains.Message;
import org.springframework.stereotype.Service;

@Service
public class MessageService {

    public void tagFormatting(Message message) {
        message.setTag(message.getTag().toLowerCase());
        message.setTag(message.getTag().replace(" ", "_"));
    }

    public void textFormatting(Message message) {
        message.setText(message.getText().replace("\n", "<br>"));
    }
}
