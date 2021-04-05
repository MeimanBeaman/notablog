package org.project.notablog.repos;


import org.project.notablog.domains.Message;
import org.project.notablog.domains.MessageComment;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface CommentsRepo extends CrudRepository<MessageComment, Integer> {
    List<MessageComment> findByMessage(Message message);

    void deleteByMessage(Message message);
}
