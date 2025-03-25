<%@page import="java.util.Date"%>
<%@page import="models.Branch"%>
<%@page import="models.Systemapartment"%>
<%@page import="models.Contract"%>
<%@page import="dao.ContractDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="dao.BranchDAO" %>
<%@ page import="dao.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<script
	src="https://rawgit.com/evidenceprime/html-docx-js/master/dist/html-docx.js"></script>
<%
SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
int id = Integer.parseInt(request.getParameter("id"));
ContractDAO contractApartmentModel = new dao.ContractDAO();
OwnerDAO ownerDAO = new OwnerDAO();
Contract contract = contractApartmentModel.findContractByID(id);
SystemApartmentDAO systemApartmentDAO = new SystemApartmentDAO();
BranchDAO branchDAO = new BranchDAO();
Systemapartment systemapartment = systemApartmentDAO.findSystemApartmentByID(contract.getSystemapartmentid());
Branch branch = branchDAO.findBranchByID(systemapartment.getBranchid());
%>
<div id="contract" class="content-wrapper mt-3"
	style="font-family: 'Times New Roman', Times, serif; padding-left: 30px;">
	<div class="row">
		<!-- Content Header (Page header) -->
		<div id="contentContract" class="content col-8"
			style="overflow: auto; width: 1000px; height: 800px;">
			<div class="content_header" style="text-align: center;">
				<br>
				<h5>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</h5>
				<h5 style="text-decoration: underline;">Độc lập - Tự do - Hạnh
					phúc</h5>
			</div>
			<div class="contract_content">
				<h3 style="text-align: center; font-weight: bold;">HỢP ĐỒNG</h3>
				<h3 style="text-align: center; font-weight: bold;">MUA BÁN CĂN
					HỘ NHÀ CHUNG CƯ</h3>
				Tại địa chỉ: <span>1</span> <br> Hôm nay, <span><%=simpleDateFormat.format(new Date())%></span>
				tại <span>Quận 5</span>, chúng tôi gồm có: <br>
				<h3 style="font-weight: bold; font-size: 18px;">BÊN BÁN (Bên A)</h3>
				Chủ sở hữu: <span>Hệ thống cung cấp căn hộ cao cấp $Apartment</span>
				<br> Ông/bà:
				.................................................................................................................................
				<br> CMND số: ............................... Ngày cấp:
				............................... Nơi cấp:
				............................... <br> Hộ khẩu:
				............................... Ngày sinh: <span>2004</span> <br>
				Địa chỉ: <span>TPHCM</span> <br> Điện thoại: <span>0705317777</span>
				<h4 style="font-weight: bold; font-size: 18px;">BÊN MUA (Bên B)</h4>
				Ông/bà: ............................... <br> CMND số:
				............................... Ngày cấp:
				............................... Nơi cấp:
				............................... <br> Hộ khẩu:
				............................... <br> Ngày sinh:
				............................... <br> Địa chỉ:
				............................... <br> Điện thoại:
				............................... <br> Chúng tôi tự nguyện cùng
				nhau lập và ký bản hợp đồng này để thực hiện việc mua bán căn hộ nhà
				chung cư, với những điều khoản đã được hai bên bàn bạc và thỏa thuận
				như sau: <br>
				<h5 style="font-weight: bold;">Điều 1. Đối tượng của hợp đồng -
					Căn hộ mua bán</h5>
				1.1 Căn hộ $Apartment thuộc quyền sở hữu của Bên A theo "Giấy chứng
				nhận nhà ở" do UBND .............. cấp ngày ............., cụ thể
				như sau: <br> * Nhà ở: <br> - Địa chỉ:
				................................................... <br> - Diện
				tích: ................................................... <br>
				- Kết cấu nhà: ................................................... <br>
				1.2 Bằng hợp đồng này Bên A đồng ý bán, Bên B đồng ý mua toàn bộ căn
				nhà nêu trên với những điều khoản thỏa thuận dưới đây theo hợp đồng
				này. <br>
				<h5 style="font-weight: bold;">Điều 2. Giá mua bán căn hộ và
					việc thanh toán</h5>
				2.1 Giá mua bán hai bên thỏa thuận là ...............
				đồng(.............................. đồng) trả bằng tiền Nhà nước
				Việt Nam hiện hành. <br> 2.2 Phương thức thanh toasnL Bên B
				thanh toán cho Bên A bằng tiền mặt. <br> 2.3 Việc trả và nhận
				số tiền nói trên do hai bên lập giấy biên nhận tiền. <br>

				<h5 style="font-weight: bold;">Điều 3. Giao nhận căn hộ và đăng
					ký sang tên</h5>
				3.1. Bên A có nghĩa vụ giao căn hộ nêu tại Điều 1 của Hợp đồng này
				cùng toàn bộ bản chính giấy tờ về quyền sở hữu căn hộ, quyền sử dụng
				đất cho Bên B. <br> Việc giao nhận căn hộ và giấy tờ kèm theo
				do hai bên tự thực hiện và chịu trách nhiệm trước pháp luật. <br>
				3.2. Bên B có nghĩa vụ đăng ký quyền sở hữu căn hộ tại cơ quan có
				thẩm quyền theo quy định của pháp luật. <br>
				<h5 style="font-weight: bold;">Điều 4. Thuế, phí, lệ phí</h5>
				4.1. Thuế, lệ phí liên quan đến việc mua bán căn hộ theo Hợp đồng
				này do Bên …… chịu trách nhiệm nộp. <br> 4.2. Sau khi ký bản
				hợp đồng này, Bên …… có nghĩa vụ liên hệ với Cơ quan thuế để làm thủ
				tục nộp thuế theo quy định. <br>
				<h5 style="font-weight: bold;">Điều 5. Giải quyết tranh chấp</h5>
				Trong quá trình thực hiện Hợp đồng này, nếu phát sinh tranh chấp,
				các bên cùng nhau thương lượng giải quyết trên nguyên tắc tôn trọng
				quyền lợi của nhau; trong trường hợp không giải quyết được thì một
				trong hai bên có quyền khởi kiện để yêu cầu Toà án cấp có thẩm quyền
				giải quyết theo quy định của Pháp luật. <br>
				<h5 style="font-weight: bold;">Điều 6. Cam kết chung của hai
					bên</h5>
				6.1. Bên A chịu trách nhiệm trước pháp luật về những lời cam đoan
				sau đây: <br> a/ Những thông tin về nhân thân, về căn hộ đã ghi
				trong Hợp đồng này là đúng sự thật; <br> b/ Căn hộ thuộc trường
				hợp được phép mua bán theo quy định của Pháp luật; <br> c/ Tại
				thời điểm giao kết Hợp đồng này: <br> - Căn hộ nói trên thuộc
				quyền sở hữu và sử dụng hợp pháp của Bên A, không có tranh chấp
				khiếu kiện; <br> - Căn hộ không bị ràng buộc dưới bất cứ hình
				thức nào bởi các việc: Thế chấp, chuyển nhượng, trao đổi, tặng cho,
				cho thuê, cho mượn hoặc kê khai làm vốn của doanh nghiệp, không bị
				kê biên để đảm bảo thi hành án; <br> - Căn hộ không bị ràng
				buộc bởi bất cứ một quyết định nào của cơ quan nhà nước có thẩm
				quyền để hạn chế quyền của chủ sở hữu; <br> - Bản chính Giấy
				chứng nhận xác nhận quyền sở hữu căn hộ mà Bên A xuất trình trước
				công chứng viên tại thời điểm ký hợp đồng này là bản thật và duy
				nhất. <br> d/ Việc giao kết Hợp đồng này là hoàn toàn tự
				nguyện, không bị lừa dối, không bị ép buộc; <br> e/ Thực hiện
				đúng và đầy đủ các thoả thuận đã ghi trong hợp đồng này;<br>
				6.2. Bên B chịu trách nhiệm trước pháp luật về những lời cam đoan
				sau đây:<br> a/ Những thông tin về nhân thân đã ghi trong Hợp
				đồng này là đúng sự thật; <br> b/ Đã xem xét kỹ, biết rõ về căn
				hộ nêu tại Điều 1 của Hợp đồng này và các giấy tờ về quyền sở hữu
				căn hộ, quyền sử dụng đất;<br> c/ Việc giao kết Hợp đồng này là
				hoàn toàn tự nguyện, không bị lừa dối, không bị ép buộc; <br>
				d/ Thực hiện đúng và đầy đủ các thoả thuận đã ghi trong hợp đồng
				này;<br> 6.3. Bên A và Bên B cùng cam đoan: <br> Đặc
				điểm về căn hộ mua bán nêu tại Hợp đồng này là đúng với
				hiện trạng thực tế, nếu có sự khác biệt với thực tế thì
				Bên A và Bên B phải hoàn toàn chịu rủi ro và chịu trách
				nhiệm trước pháp luật. <br>
				<h5 style="font-weight: bold;">Điều 7. Điều khoản chung</h5>
				7.1. Bản Hợp đồng này có hiệu lực ngay sau khi hai bên ký kết. Mọi
				sửa đổi, bổ sung hoặc huỷ bỏ Hợp đồng này chỉ có giá trị khi được
				hai bên lập thành văn bản có đầy đủ chữ ký của các bên và chỉ được
				thực hiện khi Bên mua chưa đăng ký sang tên quyền sở hữu theo Hợp
				đồng này. <br> 7.2. Hai bên công nhận đã hiểu rõ những qui định
				của pháp luật về chuyển nhượng căn hộ; hiểu rõ quyền, nghĩa vụ và
				lợi ích hợp pháp của mình và hậu quả pháp lý của việc giao kết Hợp
				đồng này. <br> 7.3. Hai Bên tự đọc lại/nghe đọc lại nguyên văn
				bản Hợp đồng này, cùng chấp thuận toàn bộ các điều khoản của Hợp
				đồng và không có điều gì vướng mắc. Hai Bên cùng ký tên dưới đây để
				làm bằng chứng. <br>
				<div class="sign" style="display: flex;">
					<div class="signA" style="margin-left: 60px;">
						<p style="margin-left: 30px; font-weight: bold;">Bên A</p>
						(Ký,ghi rõ họ tên) <br> <br> <br> <br> <br>
						<br>
					</div>
					<div class="signB" style="margin-left: 500px;">
						<p style="margin-left: 30px; font-weight: bold;">Bên B</p>
						(Ký,ghi rõ họ tên)
					</div>
				</div>
			</div>
		</div>
		<div class="card card-primary col-4" style="height: 480px;">
			<div class="card-header">
				<h3 class="card-title">Thông tin hợp đồng</h3>
			</div>
			<!-- /.card-header -->
			<div class="card-body">

				<strong style="font-size: 20px;"><i
					class="fa-solid fa-location-dot"></i> &nbsp; <%=branch.getName()%></strong>

				<p class="text-muted mt-3"><%=branch.getAddress()%></p>

				<strong><i class="fa-solid fa-user"></i> &nbsp;Chủ sở hữu</strong>

				<p class="text-muted">
					<%=ownerDAO.findById(contract.getOwnerid()).getName()%>
				</p>

				<strong><i class="fa-solid fa-door-closed"></i> &nbsp;Số
					phòng</strong>

				<p class="text-muted">
					<%=systemApartmentDAO.findSystemApartmentByID(contract.getSystemapartmentid()).getFloorid() + "0"
		+ systemApartmentDAO.findSystemApartmentByID(contract.getSystemapartmentid()).getRoomid()%>
				</p>

				<strong><i class="fa-solid fa-calendar-days"></i>
					&nbsp;Ngày tạo hợp đồng</strong>

				<p class="text-muted">
					<span>23/01/2024
				</p>

				<hr>
				<strong><i class="fa-solid fa-money-bill"></i> &nbsp;Giá</strong>

				<p class="text-muted"><%=systemApartmentDAO.findSystemApartmentByID(contract.getSystemapartmentid()).getPrice()%>
					tỷ VND
				</p>

				<hr>


			</div>
			<!-- /.card-body -->
		</div>
	</div>
	<!-- /.content -->
	<div class="row mt-5">
		<div class="button_print col-8 d-flex justify-content-center">
			<button onclick="return printDiv('contentContract')"
				class="btn btn-primary" style="width: 80px;">In</button>
			<button id="editContract"
				onclick="return confirm('Bạn có chắc chắn muốn sửa')"
				class="btn btn-primary" style="width: 80px; margin-left: 10px">Sửa</button>
			<button id="saveContract"
				onclick="return confirm('Bạn có chắc chắn muốn lưu')"
				class="btn btn-primary" style="width: 80px; margin-left: 10px">Lưu</button>
			<button id="convertToWord" class="btn btn-primary"
				style="width: 80px; margin-left: 10px">
				<i class="fa-solid fa-file-word"></i>
			</button>
			<button id="reload" class="btn btn-primary"
				style="width: 80px; margin-left: 10px">
				<i class="fa-solid fa-rotate"></i>
			</button>

		</div>
	</div>
</div>
<script>
	function convertToWord() {
		var htmlContent = $('#contentContract').html();
		var docx = htmlDocx.asBlob(htmlContent);
		var link = document.createElement('a');
		link.href = window.URL.createObjectURL(docx);
		link.download = 'contract.docx';
		document.body.appendChild(link);
		link.click();
		document.body.removeChild(link);
	}
	function printDiv(divName) {
		var printContents = document.getElementById(divName).innerHTML;
		var originalContents = document.body.innerHTML;

		document.body.innerHTML = printContents;

		window.print();

		document.body.innerHTML = originalContents;

	}

	$(document).ready(function() {
		$("#editContract").click(function() {
			$("#contentContract").attr("contenteditable", true);
			$("#contentContract").css("border", "1px solid red");
		});
		$("#saveContract").click(function() {
			$("#contentContract").attr("contenteditable", false);
			$("#contentContract").css("border", "none");
		});
		$("#convertToWord").click(function() {
			convertToWord();
		});
		$("#reload").click(function() {
			window.location.reload();
		});

	});
</script>