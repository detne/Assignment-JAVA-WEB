<%@page import="dao.AccountDetailsDAO"%>
<%@page import="dao.AccountDAO"%>
<%@page import="models.Transaction"%>
<%@page import="dao.TransactionDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="models.Sale"%>
<%@page import="dao.SaleDAO"%>
<%@ page import="dao.AccountDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    TransactionDAO transactionDAO = new TransactionDAO();
	AccountDAO accountDAO = new AccountDAO();
	AccountDetailsDAO accountDetailsDAO = new AccountDetailsDAO();
%>
<div class="content-wrapper">
    <!-- Tiêu đề nội dung -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h1>Danh sách giao dịch</h1>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>
<script>
								$(document).ready(function() {
									$('#buttonReload').click(function() {
										location.reload();
									});
								});
							
							
							</script>
							<script>
        function exportTableToExcel(tableID, filename = '') {
        	var table = $('#' + tableID).DataTable();
            var data = table.rows().data().toArray();
            var headers = [];
            $('#' + tableID + ' thead th').each(function() {
                headers.push($(this).text().trim());
            });

            var jsonData = [];
            data.forEach(function(row) {
                var rowData = {};
                headers.forEach(function(header, index) {
                    rowData[header] = row[index];
                });
                jsonData.push(rowData);
            });

            var ws = XLSX.utils.json_to_sheet(jsonData);
            var wb = XLSX.utils.book_new();
            XLSX.utils.book_append_sheet(wb, ws, "Sheet1");

            XLSX.writeFile(wb, filename + ".xlsx");
        }
    </script>
    <!-- Nội dung chính -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
          
                        <!-- /.card-header -->
                        <div class="card-body">
                         
                            
                            <button id="buttonReload" class="btn"><i class="fa-solid fa-rotate"></i></button>
                            <button class="btn btn-primary btn-md" onclick="exportTableToExcel('example2', 'myData')">Export to Excel</button>
                            <table style="text-align: center;" id="example2" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Mã giao dịch</th>
                                        <th>Loại giao dịch</th>
                                        <th>Số tiền</th>
                                        <th>Thời gian giao dịch</th>
                                        <th>Tài khoản</th>
                                        <th>Chi tiết giao dịch</th>
                                        <th>Phương thức giao dịch</th>
                                
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for(Transaction transaction : transactionDAO.findAll()){ %>
                                    	 <tr>
                                        <td><%= transaction.getTransactionNo() %></td>
                                        <td><%= transaction.getType() == 1 ? "Nạp tiền" : "Rút tiền" %></td>
                                        <td><%= transaction.getPrice() %> <%= transaction.getPaymentType().equals("ATM") ? "VND" : "$" %></td>
                                        <td><%= transaction.getDate()%></td>
                                        <td><%= transaction.getAccountID() %> - <%= accountDetailsDAO.findAccountByAccountID(transaction.getAccountID()).getName() %></td>
                                        <td><%= transaction.getOrderInfo() %></td>
                                        <td><%= transaction.getPaymentType() %></td>
                                  
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
            </div>
        </div>
    </section>
    <!-- /.content -->
</div>
