package org.project.notablog.repos;

import org.project.notablog.domains.Message;
import org.project.notablog.domains.User;
import org.project.notablog.domains.dto.MessageDto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface MessageRepo extends CrudRepository<Message, Long> {

    @Query("select new org.project.notablog.domains.dto.MessageDto(" +
            "   m, " +
            "   count(ml), " +
            "   sum(case when ml = :user then 1 else 0 end) > 0" +
            ") " +
            "from Message m left join m.likes ml " +
            "group by m")
    Page<MessageDto> findAll(Pageable pageable, @Param("user") User user);

    @Query("select new org.project.notablog.domains.dto.MessageDto(" +
            "   m, " +
            "   count(ml), " +
            "   sum(case when ml = :user then 1 else 0 end) > 0" +
            ") " +
            "from Message m left join m.likes ml " +
            "where m.tag = :tag " +
            "group by m")
    Page<MessageDto> findByTag(@Param("tag") String tag, Pageable pageable, @Param("user") User user);

    @Query("select new org.project.notablog.domains.dto.MessageDto(" +
            "   m, " +
            "   count(ml), " +
            "   sum(case when ml = :user then 1 else 0 end) > 0" +
            ") " +
            "from Message m left join m.likes ml " +
            "where m.author = :author " +
            "group by m")
    Page<MessageDto> findByUser(Pageable pageable, @Param("author") User author, @Param("user") User user);

    @Query("select new org.project.notablog.domains.dto.MessageDto(" +
            "   m, " +
            "   count(ml), " +
            "   sum(case when ml = :user then 1 else 0 end) > 0" +
            ") " +
            "from Message m left join m.likes ml " +
            "left join m.author usr " +
            "left join usr.subscribers subs " +
            "where subs = :user " +
            "group by m")
    Page<MessageDto> findBySubscription(Pageable pageable, @Param("user") User user);

    @Query("select new org.project.notablog.domains.dto.MessageDto(" +
            "   m, " +
            "   count(ml), " +
            "   sum(case when ml = :user then 1 else 0 end) > 0" +
            ") " +
            "from Message m left join m.likes ml " +
            "left join m.author usr " +
            "left join usr.subscribers subs " +
            "where subs = :user and m.tag = :tag " +
            "group by m")
    Page<MessageDto> findBySubscriptionByTag(@Param("tag") String tag, Pageable pageable, @Param("user") User user);

    void deleteMessageById(Long id);
}
