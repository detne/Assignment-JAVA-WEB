<%@page import="java.util.List"%>
<%@page import="models.Chat"%>
<%@page import="dao.AccountDetailsDAO"%>
<%@page import="dao.ChatDAO"%>
<%@page import="models.Systemapartment"%>
<%@page import="dao.BranchDAO"%>
<%@page import="dao.SystemApartmentDAO"%>
<%@ page import="dao.AccountDetailsDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%
 	ChatDAO chatDAO = new ChatDAO();
 	AccountDetailsDAO accountDetailsDAO = new AccountDetailsDAO();
 	int n = 7;
 	List<Chat> chats = (List<Chat>) request.getAttribute("chats");
 	if(request.getAttribute("n") != null){
 		String n1 = (String) request.getAttribute("n") ;
 		n = Integer.parseInt(n1)  + 7;
 	 	
 	}

 	
 %>
 <style>
 	.userTR{
 		cursor: pointer;
 	}
 	.backgroundTR {
 		background-color: navy;
 	}
 	.chat-online {
    color: #34ce57
}

.chat-offline {
    color: #e4606d
}

.chat-messages {
    display: flex;
    flex-direction: column;
    max-height: 800px;
    overflow-y: scroll
}

.chat-message-left,
.chat-message-right {
    display: flex;
    flex-shrink: 0
}

.chat-message-left {
    margin-right: auto
}

.chat-message-right {
    flex-direction: row-reverse;
    margin-left: auto
}
.py-3 {
    padding-top: 1rem!important;
    padding-bottom: 1rem!important;
}
.px-4 {
    padding-right: 1.5rem!important;
    padding-left: 1.5rem!important;
}
.flex-grow-0 {
    flex-grow: 0!important;
}
.border-top {
    border-top: 1px solid #dee2e6!important;
}
 	
 </style>
  <script>
  function scrollMessage() {
		var chatbox = document.getElementById('chatAdmin');
		chatbox.scrollTop = chatbox.scrollHeight;
	};
  var userID = 0;
  var selectedFile = null;
  // xu ly file trong chat ni`
  $(document).ready(function() {
            $('#fileInput').on('change', function(event) {
            	selectedFile = event.target.files[0];
                var file = event.target.files[0];
                if (file) {
                    var reader = new FileReader();
                    reader.onload = function(e) {
                        $('#previewImage').attr('src', e.target.result).show();
                        $('#fileName').text('Selected file: ' + file.name);
                    }
                    reader.readAsDataURL(file);
                }
            });
        });
  $(document).ready(function(){
		var i = 1;
		var j = 1;
		
		
		
	});
        var socket = new WebSocket("ws://localhost:8080/projectGroup2/chat");
        
        socket.onmessage = function(event) {
        	var nameUser = $('#nameUser').val();
        	var avatarUser = $('#avatarUser').val();
        	console.log(avatarUser);
        	var now = new Date();
        	var hours = now.getHours();
        	var minutes = now.getMinutes();
        	var i = 1;
     		var j = 1;
            var message = event.data;
           	if(message.includes("-USER21042003" + "-${userID}")){
           		var message1 = message.replace("-USER21042003" + "-${userID}", "");
           	 $('#chatAdmin').append(
      				'<div class="chat-message-left pb-4"><div><img src="${pageContext.request.contextPath}/assets/user/images/' + avatarUser + '" class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40"><div class="text-muted small text-nowrap mt-2">' + hours + ':' + minutes + '</div></div><div class="flex-shrink-1 bg-light rounded py-2 px-3 ml-3" style="width: 300px;"><div class="font-weight-bold mb-1">' + nameUser + '</div>' + (!message1.includes("img-") ? message1 : '<img style=\"width: 30%; height: auto;\" src="/projectGroup2/assets/user/images/' + message1.substring(message1.indexOf("-") + 1) + '" alt="Chat Image"/>') + '</div></div>'
      			);
           	}
           
       
           	scrollMessage();
          
        };

        function sendMessage() {
        	var now = new Date();
        	var hours = now.getHours();
        	var minutes = now.getMinutes();
        	var message = '';
        	if(selectedFile != null){
        		var formData = new FormData();
                formData.append('file', selectedFile);
                $(document).ready(function() {
               	 $.ajax({
                        url: "${pageContext.request.contextPath}/admin/chatadmin", 
                        type: 'POST',
                        data: formData,
                        processData: false, 
                        contentType: false,
                        success: function(chatFileUpload) {
                        	message = 'img-' + chatFileUpload;
							console.log(chatFileUpload);
							socket.send(message + "-ADMIN21042003" + "-${userID}");
							$("#message").val("");
							$('#chatAdmin').append(
				            		'<div class="chat-message-right pb-4"><div><img src="https://bootdey.com/img/Content/avatar/avatar1.png" class="rounded-circle mr-1" alt="Chris Wood" width="40" height="40"><div class="text-muted small text-nowrap mt-2">' + hours + ':' + minutes + '</div></div><div class="flex-shrink-1 bg-light rounded py-2 px-3 mr-3" style="width: 300px;"><div class="font-weight-bold mb-1">Tôi</div>' + (!message.includes("img-") ? message : '<img style=\"width: 30%; height: auto;\" src="'+ URL.createObjectURL(selectedFile) + '" alt="Chat Image"/>') + '</div></div>'
				     			);
							$('#fileName').hide();
							$('#previewImage').hide();
							$('#fileInput').val('');
							selectedFile = null;
						}
                    });
               });
        	} else {
        		message = $("#message").val();
        		if(!message == ''){
        			socket.send(message + "-ADMIN21042003" + "-${userID}");
           		 $("#message").val("");
           		 $('#chatAdmin').append(
   		            		'<div class="chat-message-right pb-4"><div><img src="https://bootdey.com/img/Content/avatar/avatar1.png" class="rounded-circle mr-1" alt="Chris Wood" width="40" height="40"><div class="text-muted small text-nowrap mt-2">' + hours + ':' + minutes + '</div></div><div class="flex-shrink-1 bg-light rounded py-2 px-3 mr-3" style="width: 300px;"><div class="font-weight-bold mb-1">Tôi</div>' + (!message.includes("img-") ? message : '<img style=\"width: 30%; height: auto;\" src="'+ URL.createObjectURL(selectedFile) + '" alt="Chat Image"/>') + '</div></div>'
   		     			);
        		}
        		
        	}
        	
        	var i = 1;
     		var j = 1;
            var message = $("#message").val();
            /* socket.send(message + "-ADMIN21042003" + "-${userID}"); */
           
          
           
            
        }

     	
    </script>
  <style>
    /* Custom CSS */
   
    tr{
    	height: 70px;
    }
    td{
    	width:270px;
    }
  </style>
<div class="content-wrapper">

<input type="hidden" id="nameUser" value="<%= accountDetailsDAO.findAccountByAccountID(chats.get(0).getUserID()).getName() %>">
<input type="hidden" id="avatarUser" value="<%= accountDetailsDAO.findAccountByAccountID(chats.get(0).getUserID()).getAvatar() %>">
<main class="content">
    <div class="container p-0">

		<h1 class="h3 mb-3">Messages</h1>

		<div class="card">
			<div class="row g-0">
				<div class="col-12 col-lg-5 col-xl-3 border-right">

					<div class="px-4 d-none d-md-block">
						<div class="d-flex align-items-center">
							<div class="flex-grow-1">
								<input type="text" class="form-control my-3" placeholder="Search...">
							</div>
						</div>
					</div>
					   <% for(Chat chat : chatDAO.listUser()) { %>
					   		<a href="${pageContext.request.contextPath}/admin/chatadmin?id=<%= chat.getUserID() %>" class="list-group-item list-group-item-action border-0 userTR" data-id="<%= chat.getUserID() %>">
								<div class="badge bg-success float-right">5</div>
								<div class="d-flex align-items-start">
									<img src="${pageContext.request.contextPath }/assets/user/images/<%= accountDetailsDAO.findAccountByAccountID(chat.getUserID()).getAvatar() %>" class="rounded-circle mr-1" alt="Vanessa Tucker" width="40" height="40">
									<div class="flex-grow-1 ml-3">
										 <%= accountDetailsDAO.findAccountByAccountID(chat.getUserID()).getName() %>
										<div class="small"><span class="fas fa-circle chat-online"></span> Online</div>
									</div>
								</div>
						</a>
					   
                          
                            <% } %>
					
				
				
					<hr class="d-block d-lg-none mt-1 mb-0">
				</div>
				<div class="col-12 col-lg-7 col-xl-9">
					<div class="py-2 px-4 border-bottom d-none d-lg-block">
						<div class="d-flex align-items-center py-1">
							<div class="position-relative">
								<img src="${pageContext.request.contextPath }/assets/user/images/<%= accountDetailsDAO.findAccountByAccountID(chats.get(0).getUserID()).getAvatar() %>" class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40">
							</div>
							<div class="flex-grow-1 pl-3">
								<strong><%= accountDetailsDAO.findAccountByAccountID(chats.get(0).getUserID()).getName() %></strong>
								<div class="text-muted small"><em>Typing...</em></div>
							</div>
							<div>
								<button class="btn btn-primary mr-1"><a href="${pageContext.request.contextPath}/admin/chatadmin?id=${userID}&n=<%= n %>"><span class="text-white">Xem tin nhắn trước</span></a></button>
								<button class="btn btn-secondary reload-btn mr-1"><a href="${pageContext.request.contextPath}/admin/chatadmin?id=${userID}"><i class="fa-solid fa-rotate-right"></i></a></button>
								<button class="btn btn-light border"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-horizontal feather-lg"><circle cx="12" cy="12" r="1"></circle><circle cx="19" cy="12" r="1"></circle><circle cx="5" cy="12" r="1"></circle></svg></button>							</div>
						</div>
					</div>

					<div class="position-relative">
						<div class="chat-messages p-4" id="chatAdmin">
							<% for(Chat chat : chats){ %>
								<% if(chat.getRole() == 0){ %>
										<div class="chat-message-right pb-4">
									<div>
										<img src="https://bootdey.com/img/Content/avatar/avatar1.png" class="rounded-circle mr-1" alt="Chris Wood" width="40" height="40">
										<div class="text-muted small text-nowrap mt-2"><%= chat.getTime().getHours() %> : <%= chat.getTime().getMinutes() %></div>
									</div>
									<div class="flex-shrink-1 bg-light rounded py-2 px-3 mr-3" style="width: 300px;">
										<div class="font-weight-bold mb-1">Tôi</div>
										<%= !chat.getMessage().contains("img-") ?  chat.getMessage() : "<img style=\"width: 30%; height: auto;\" src=\"/projectGroup2/assets/user/images/" + chat.getMessage().substring(chat.getMessage().indexOf("-") + 1) + "\" alt=\"Chat Image\"/>" %>
									</div>
								</div>
								<% } %>
								<% if(chat.getRole() == 1){ %>
									<div class="chat-message-left pb-4">
								<div>
									<img src="${pageContext.request.contextPath }/assets/user/images/<%= accountDetailsDAO.findAccountByAccountID(chats.get(0).getUserID()).getAvatar() %>" class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40">
									<div class="text-muted small text-nowrap mt-2"><%= chat.getTime().getHours() %> : <%= chat.getTime().getMinutes() %></div>
								</div>
								<div class="flex-shrink-1 bg-light rounded py-2 px-3 ml-3"  style="width: 300px;">
									<div class="font-weight-bold mb-1"><%= accountDetailsDAO.findAccountByAccountID(chats.get(0).getUserID()).getName() %></div>
									<%= !chat.getMessage().contains("img-") ?  chat.getMessage() : "<img style=\"width: 30%; height: auto;\" src=\"/projectGroup2/assets/user/images/" + chat.getMessage().substring(chat.getMessage().indexOf("-") + 1) + "\" alt=\"Chat Image\"/>" %>
								</div>
							</div>
								<% } %>
							<% } %>

							

						
						</div>
					</div>

					<div class="flex-grow-0 py-3 px-4 border-top">
					<div class="col-md-12">
				    	<label for="fileInput" style="color: blue; cursor: pointer;"><i class="fa-regular fa-image"></i></label> 
				        <input type="file" id="fileInput" accept="image/*">
				        <p style="margin-left: 50px;" id="fileName"></p>
				        <img id="previewImage" src="#" alt="Image preview" style="display: none; max-width: 10%; height: auto;">
				        
				        
				    </div>
						<div class="input-group">
							<input type="text" id="message" class="form-control" placeholder="Type your message">
							<button onclick="sendMessage()" class="btn btn-primary">Send</button>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</main>
   
</div>
