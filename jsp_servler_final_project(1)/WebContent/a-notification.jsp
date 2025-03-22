<%@ include file="../includes/header.jsp"%>jsp"%>
<div class="sidebar" id="sidebar">
            <div class="sidebar-inner slimscroll">
                <div id="sidebar-menu" class="sidebar-menu">
                    <ul>
                        <li>
                            <a href="a-index.jsp"><i class="feather-grid active"></i> <span>Dashboard</span></a>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-book"></i> <span> Document</span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a href="admin-published">Published Document</a></li>
                                <li><a href="admin-pending">Pending Document</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="showaccounts"><i class="fas fa-users"></i> <span>Account</span></a>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-graduation-cap"></i> <span>Add new category</span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a href="addnewmajor">Add new major</a></li>
                                <li><a href="#">Add new course</a></li>
                                <li><a href="#">Add new category</a></li>
                            </ul>
                        </li>
                        <li class="active">
                            <a href="admin-notification"><i class="fas fa-bell"></i> <span>Notification</span></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

<div class="page-wrapper">
	<div class="content container-fluid">

		<div class="page-header">
			<div class="row">
				<div class="col">
					<h3 class="page-title">Send Notifications</h3>
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
						<li class="breadcrumb-item active">Send Notifications</li>
					</ul>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-header">
						<h5 class="card-title">Notification Details</h5>
					</div>
					<div class="card-body">
						<form action="admin-notification" method="POST">
							<div class="form-group row">
								<label class="col-form-label col-md-2">Subject <span class="login-danger">*</span></label>
								<div class="col-md-12">
									<input placeholder="Enter the subject" name="subject"
										type="text" class="form-control" required>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-md-2">Message <span class="login-danger">*</span></label>
								<div class="col-md-12">
									<textarea rows="5" class="form-control" name="message"
										placeholder="Compose your message here" required></textarea>
								</div>
							</div>
							<div class="col-5">
								<button type="button" class="btn btn-primary ml-2 m-r-10"
									data-toggle="modal" data-target="#userModal">Select
									Recipients</button>
								<label class="checkbox-label"> <input type="checkbox"
									name="sendAll" id="selectAllUsers"> Send to All Users
								</label>
								<div class="modal fade" id="userModal" tabindex="-1"
									role="dialog" aria-labelledby="userModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="userModalLabel">Select User</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<input type="text" id="usernameInput"
													placeholder="Type a username" class="form-control mb-3">

												<ul id="userList">
													<c:forEach items="${accounts}" var="account">
														<li><input type="checkbox" name="selectedUsers"
															value="${account.username}"> <label
															for="${account.username}">${account.username}</label></li>
													</c:forEach>
												</ul>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">Cancel</button>
												<button type="button" class="btn btn-primary"
													data-dismiss="modal">Done</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group mb-1">
								<button type="submit" class="btn btn-primary mt-3" id="submitBtn">
									<i class="fas fa-paper-plane m-r-5"></i> <span>Send</span>
								</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	// Type username when select recipients
	document.getElementById("usernameInput").addEventListener(
			"input",
			function() {
				var inputText = this.value.toLowerCase();
				var userList = document.getElementById("userList")
						.getElementsByTagName("li");

				for (var i = 0; i < userList.length; i++) {
					var label = userList[i].getElementsByTagName("label")[0];
					var username = label.textContent.toLowerCase();

					if (username.includes(inputText)) {
						userList[i].style.display = "block";
					} else {
						userList[i].style.display = "none";
					}
				}
			});

	// Click send all and every user will checked
	document.getElementById("selectAllUsers").addEventListener(
			"change",
			function() {
				var userCheckboxes = document
						.querySelectorAll('input[name="selectedUsers"]');
				for (var i = 0; i < userCheckboxes.length; i++) {
					userCheckboxes[i].checked = this.checked;
				}
			});

	// Click unchecked will unchecked the select all
	function updateSendToAllCheckbox() {
		var userCheckboxes = document
				.querySelectorAll('input[name="selectedUsers"]');
		var sendToAllCheckbox = document.getElementById("selectAllUsers");
		var allChecked = true;

		for (var i = 0; i < userCheckboxes.length; i++) {
			if (!userCheckboxes[i].checked) {
				allChecked = false;
				break;
			}
		}

		sendToAllCheckbox.checked = allChecked;
	}
	var userCheckboxes = document
			.querySelectorAll('input[name="selectedUsers"]');
	for (var i = 0; i < userCheckboxes.length; i++) {
		userCheckboxes[i].addEventListener("change", updateSendToAllCheckbox);
	}
	
	// Check the notification must have receiver/recipient
	document.getElementById("submitBtn").addEventListener("click", function (e) {
	    var userCheckboxes = document.querySelectorAll('input[name="selectedUsers"]');
	    var atLeastOneSelected = false;

	    for (var i = 0; i < userCheckboxes.length; i++) {
	        if (userCheckboxes[i].checked) {
	            atLeastOneSelected = true;
	            break;
	        }
	    }

	    if (!atLeastOneSelected) {
	        alert("Please select at least one recipient.");
	        e.preventDefault(); 
	    }
	});

</script>


<%@ include file="../includes/footer.jsp"%>