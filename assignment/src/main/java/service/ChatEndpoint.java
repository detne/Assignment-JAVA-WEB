package service;

import java.io.IOException;
import java.util.*;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import models.Chat;
import dao.ChatDAO;

@ServerEndpoint("/chat")
public class ChatEndpoint {
    
    private static final Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());

    @OnOpen
    public void onOpen(Session session) {
        clients.add(session);
        System.out.println("New session opened: " + session.getId());
    }

    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        ChatDAO chatDAO = new ChatDAO();
        Chat chat = new Chat();
        chat.setAdminID(29);
        chat.setTime(new Date());

//        System.out.println("Received message: " + message);
        
        String accountID = message.substring(message.lastIndexOf('-') + 1);
//        System.out.println("Extracted account ID: " + accountID);
        chat.setUserID(Integer.parseInt(accountID));

        if (message.contains("-ADMIN21042003")) {
            chat.setMessage(message.replace("-ADMIN21042003" + "-" + accountID, ""));
            chat.setRole(0);
        } else if (message.contains("-USER21042003")) {
            chat.setMessage(message.replace("-USER21042003" + "-" + accountID, ""));
            chat.setRole(1);
        }

        synchronized (clients) {
            for (Session client : clients) {
                if (!client.equals(session)) {
                    client.getBasicRemote().sendText(message);
                }
            }
        }

        if (chatDAO.newChat(chat)) {
            System.out.println("Thành công lưu trữ chat.");
        } else {
            System.out.println("Thất bại lưu trữ chat.");
        }
    }

    @OnClose
    public void onClose(Session session) {
        clients.remove(session);
        System.out.println("Session closed: " + session.getId());
    }
}
