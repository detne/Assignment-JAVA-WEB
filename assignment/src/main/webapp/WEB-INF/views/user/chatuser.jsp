<%@page import="dao.ChatDAO"%>
<%@page import="models.Chat"%>
<%@page import="models.Account"%>
<%@page import="models.Systemapartment"%>
<%@page import="dao.BranchDAO"%>
<%@page import="dao.SystemApartmentDAO"%>
<%@ page import="dao.ChatDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%
 	HttpSession httpSession = request.getSession();
 	String msg = (String) httpSession.getAttribute("msg");
 	String msg1 = msg;
 	httpSession.removeAttribute("msg");
 	Account account = null;
 	if(httpSession.getAttribute("account") != null){
 		account = (Account) httpSession.getAttribute("account");
 	}
 	ChatDAO chatDAO = new ChatDAO();
 	int n = 0;
 %>
 <c:if test="<%= msg1 == null %>">
 	<script>
		alert('<%= msg1 %>');
 	</script>
 </c:if>
 <style>
 tr{
    	height: 50px;
    }
    td{
    	width:270px;
    }
     .chat-box {
    border-radius: 10px;
    padding: 10px;
    background-color: #f8f9fa; /* Màu nền */
    overflow: auto;
  }

  .table {
    margin-bottom: 0; /* Loại bỏ khoảng cách dưới cùng của table */
    
  }

  .receiver {
    background-color: #f0f0f0; /* Màu nền của tin nhắn nhận */
  }

  .sender {
    background-color: #007bff; /* Màu nền của tin nhắn gửi */
    color: #fff; /* Màu chữ của tin nhắn gửi */
  }
  .message-container {
    display: flex;
    align-items: center;
    border-radius: 5px;
    padding: 5px;
    width: 74%;
    position: relative;
    left: 21em;
  }

   .message-input {
    width: calc(100% - 40%);
    border-radius: 5px 0 0 5px;
  }

  .send-button {
    border-radius: 0 5px 5px 0;
  }
  .load-more-btn,
  .reload-btn {
    border-radius: 20px;
    padding: 10px 20px;
    margin-right: 10px;
  }



.card-holder-name label {
    text-transform: uppercase;
    font-weight: 600;
    color: rgba(255, 255, 255, 0.42);
}

.card-holder-name {
    flex: 1;
}

.card-valid label {
    text-transform: uppercase;
    font-weight: 600;
    color: rgba(255, 255, 255, 0.42);
}

.card-no-text {
    font-weight: 600;
    text-transform: uppercase;
    color: rgba(255, 255, 255, 0.42);
}

.card-text {
    color: #fff;
    font-size: 15px;
}

.invoice-date.inv-mar-10 {
    margin-left: 0px;
}

.invoice-all-download a {
    display: flex;
    background: #f2f4f8;
    padding: 5px 10px;
    border-radius: 3px;
    transition: all .3s;
    color: #333;
    text-decoration: none;
}

.invoice-all-download a:hover {
    background: #2f69d4;
    color: #fff;
}

table.invoices-table {
    width: 100%;
    font-size: 15px;
    color: #707070;
    border-spacing: 0;
}

table.invoices-table tr th {
    text-align: left;
    padding: 8px 10px;
    border-bottom: 1px solid #ddd;
}

table.invoices-table tr td {
    padding: 8px 10px;
    border-bottom: 1px solid #ddd;
}

table.invoices-table tr td:nth-child(5), table.invoices-table tr th:nth-child(5) {justify-content: flex-end;display: flex;}

table.invoices-table tr td:nth-child(1), table.invoices-table tr th:nth-child(1) {
    width: 30%;
}
.pricing-content-items-tabs{
    display: flex;
    flex-direction: column;
        padding: 50px 0px;
}
.pricing-yearly {
    display: flex;
    margin-bottom: 50px;
}
.pricing-monthly{
    display: none;
    margin-bottom: 50px;
}

.pricing-monthly.active-tab-content{
    display: flex;
}
 </style>
  <script>
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
  

  
  function scrollMessage() {
		var chatbox = document.querySelector(".chat-box");
		chatbox.scrollTop = chatbox.scrollHeight;
	};
  
        var socket = new WebSocket("ws://localhost:8080/projectGroup2/chat");
        
        socket.onmessage = function(event) {
        	var i = 1;
     		var j = 1;
            var message = event.data;
            if(message.includes("-ADMIN21042003" + "-" + <%= account != null ? account.getId() : 0 %>)){
            	var message1 = message.replace("-ADMIN21042003" + "-" + <%= account != null ? account.getId() : 0 %>, "");
            	  $('#tableMSG').append(
           				'<tr>' + 
           					'<td  id="td' + (i++) + '1">' + 
           					(!message1.includes("img-") ? message1 : '<img style=\"width: 30%; height: auto;\" src="/projectGroup6/assets/user/images/' + message1.substring(message1.indexOf("-") + 1) + '" alt="Chat Image"/>')
           					+'</td>' +
           					'<td id="td' + (j++) + '2">' + 
           						''
       						+'</td>'
           					
           				+'</tr>' 
           			);
                  
                  scrollMessage();
            }
          
        };

        function sendMessage() {
        	var message = '';
        	if(selectedFile != null){
        		var formData = new FormData();
                formData.append('file', selectedFile);
                console.log(formData);
                $(document).ready(function() {
                	 $.ajax({
                         url: "${pageContext.request.contextPath}/chatuser", 
                         type: 'POST',
                         data: formData,
                         processData: false, 
                         contentType: false,
                         success: function(chatFileUpload) {
                        	message = 'img-' + chatFileUpload;
							console.log(chatFileUpload);
							socket.send(message + "-USER21042003" + "-" + <%= account != null ? account.getId() : 0%>);
							 $("#message").val("");
					            $('#tableMSG').append(
					     				'<tr>' + 
					     					'<td id="td' + (i++) + '1">' + 
					     						''
					     					+'</td>' +
					     					'<td style="text-align: left;"  id="td' + (j++) + '2">' + 
					     					(!message.includes("img-") ? message : '<img style=\"width: 30%; height: auto;\" src="'+ URL.createObjectURL(selectedFile) + '" alt="Chat Image"/>')
					 						+'</td>'
					     					
					     				+'</tr>' 
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
        			socket.send(message + "-USER21042003" + "-" + <%= account != null ? account.getId() : 0%>);
           		 $("#message").val("");
                    $('#tableMSG').append(
             				'<tr>' + 
             					'<td id="td' + (i++) + '1">' + 
             						''
             					+'</td>' +
             					'<td style="text-align: right;"  id="td' + (j++) + '2">' + 
             					(!message.includes("img-") ? message : '<img style=\"width: 30%; height: auto;\" src="'+ URL.createObjectURL(selectedFile) + '" alt="Chat Image"/>')
         						+'</td>'
             					
             				+'</tr>' 
             			);
        		}
        		
        	}
        	
        	var i = 1;
     		var j = 1;
          
            
          	
           
            scrollMessage();
            
        }
        
     	$(document).ready(function(){
     	
     		var i = 1;
     		var j = 1;
     		$('#button').click(function(){
     			
     			$('#tableMSG').append(
     				'<tr>' + 
     					'<td id="td' + (i++) + '1">' + 
     						'Aaaa'
     					+'</td>' +
     					'<td id="td' + (j++) + '2">' + 
 							'Aaaa'
 						+'</td>'
     					
     				+'</tr>' 
     			);
     		});
			var n = 0;
			var count = 0;
         	$('#buttonLoadMore').click(function() {
         		count++;
         		n = 7 * count;
         		$.ajax({
             		type: "GET",
             		url: "${pageContext.request.contextPath}/loadMoreMSG",
             		data: {
             			n : n
             		},
             		success: function(chats) {
						var s = '';
						for(var i = 0; i < chats.length; i++){
							s+= '<tr>';
								if(chats[i].role == 0){
									s+= '<td class="receiver" style="text-align: left;">' + (!chats[i].message.includes("img-") ? chats[i].message : '<img style="width: 30%; height: auto;" src="/projectGroup2/assets/user/images/' + chats[i].message.substring(chats[i].message.indexOf("-") + 1) + '" alt="Chat Image"/>') + '</td>';
									s+= '<td></td>';
								}
								if(chats[i].role == 1){
									s+= '<td></td>';
									s+= '<td class="sneder" style="text-align: right;">' + (!chats[i].message.includes("img-") ? chats[i].message : '<img style="width: 30%; height: auto;" src="/projectGroup2/assets/user/images/' + chats[i].message.substring(chats[i].message.indexOf("-") + 1) + '" alt="Chat Image"/>') + '</td>';
								}
							s+= '</tr>';
						}
						$('#tableMSG tbody').html(s); // Thêm vào cuối tbody
					}
             	});
			});
     	});


     // Sự kiện khi bấm nút enter sẽ gửi tin nhắn
     document.addEventListener("DOMContentLoaded", function() {
         // Bắt sự kiện khi người dùng bấm phím trong ô nhập liệu
         document.getElementById("message").addEventListener("keypress", function(event) {
           // Kiểm tra xem phím đã bấm có phải là nút "Enter" không (mã ASCII là 13)
           if (event.code === "Enter") {
             // Gọi hàm sendMessage() khi người dùng bấm nút "Enter"
             sendMessage();
           }
         });
     });
     	
     	
    </script>
   <div class="content-wrapper">
<br><br>
<div class="container">
  <div class="row">
    <div class="col-md-6" style="margin: auto">
      <div class="card border">
        <div class="card-body chat-box" style="height: 700px;">
          <button id="buttonLoadMore" class="btn btn-primary load-more-btn">Xem tin nhắn phía trên</button>
      <button onclick="location.reload();" class="btn btn-secondary reload-btn"><i class="fa-solid fa-rotate-right"></i></button>
          <table id="tableMSG" class="table">
            <% for(Chat chat : chatDAO.findChatByUserID(account.getId(), n)) { %>
              <tr>
                <% if(chat.getRole() == 0) { %>
                  <td class="receiver" style="text-align: left;"><%= !chat.getMessage().contains("img-") ?  chat.getMessage() : "<img style=\"width: 30%; height: auto;\" src=\"/projectGroup6/assets/user/images/" + chat.getMessage().substring(chat.getMessage().indexOf("-") + 1) + "\" alt=\"Chat Image\"/>" %></td>
                  <td></td>
                <% } %>
                <% if(chat.getRole() == 1) { %>
                  <td></td>
                   <td class="sender" style="text-align: right;"><%= !chat.getMessage().contains("img-") ?  chat.getMessage() : "<img style=\"width: 30%; height: auto;\" src=\"/projectGroup6/assets/user/images/" + chat.getMessage().substring(chat.getMessage().indexOf("-") + 1) + "\" alt=\"Chat Image\"/>" %></td>
                 
                <% } %>
              </tr>
             
            <% } %>

          </table>
        </div>
      </div>
    </div>
  </div>
</div>

<br><br>

<div class="container">
  <div class="row">
  	 <div class="col-md-12 message-container">
    	   <label for="fileInput" style="color: blue; cursor: pointer;"><i class="fa-regular fa-image"></i></label> 
        <input type="file" id="fileInput" accept="image/*">
        <p style="margin-left: 50px;" id="fileName"></p>
        <img id="previewImage" src="#" alt="Image preview" style="display: none; max-width: 10%; height: auto;">
    </div>
    <div class="col-md-12 message-container">
    
      <input type="text" id="message" class="form-control message-input" placeholder="Nhập tin nhắn tại đây">
      <button onclick="sendMessage()" class="btn btn-primary send-button"><i class="fa-solid fa-paper-plane"></i></button>
    </div>
  </div>
</div>