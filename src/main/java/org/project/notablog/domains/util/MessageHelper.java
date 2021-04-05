package org.project.notablog.domains.util;

import org.project.notablog.domains.User;

public abstract class MessageHelper {
    public static String getAuthorName(User author) {
        return author != null ? author.getUsername() : "<no author>";
    }
}
