<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="${classpath}/admin/assets/images/favicon.png">
<title>${projectTittle }</title>

<!-- variables -->
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

<!-- Custome css resource file -->
<jsp:include page="/WEB-INF/views/admin/layout/css.jsp"></jsp:include>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body>

	<%-- 	<c:set var="currentPage" value="${currentPage }" scope="session"></c:set>
	<c:set var="totalPage" value="${totalPage }" scope="session"></c:set> --%>


	<!-- End test -->
	<!-- ============================================================== -->
	<!-- Preloader - style you can find in spinners.css -->
	<!-- ============================================================== -->

	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper" data-theme="light" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed"
		data-boxed-layout="full">

		<!-- Topbar header - style you can find in pages.scss -->
		<jsp:include page="/WEB-INF/views/admin/layout/header.jsp"></jsp:include>
		<!-- End Topbar header -->

		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<jsp:include page="/WEB-INF/views/admin/layout/menuleft.jsp"></jsp:include>
		<!-- End Left Sidebar - style you can find in sidebar.scss  -->

		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-7 align-self-center">
						<h4
							class="page-title text-truncate text-dark font-weight-medium mb-1">Ticket
							List</h4>
						<div class="d-flex align-items-center">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb m-0 p-0">
									<li class="breadcrumb-item"><a href="index.html"
										class="text-muted">Apps</a></li>
									<li class="breadcrumb-item text-muted active"
										aria-current="page">Ticket List</li>
								</ol>
							</nav>
						</div>
					</div>
					<div class="col-5 align-self-center">
						<div class="customize-input float-right">
							<select
								class="custom-select custom-select-set form-control bg-white border-0 custom-shadow custom-radius">
								<option selected>Aug 19</option>
								<option value="1">July 19</option>
								<option value="2">Jun 19</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				<!-- basic table -->
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<form action="${classpath }/list-cart" method="get">
									<div class="table-responsive">

										<div class="row">
											<div class="col-md-3">
												<div class="form-group mb-4">
													<label for="beginDate">Begin date</label> <input
														path="beginDate" class="form-control" type="date"
														id="beginDate" name="beginDate" value=""></input>
												</div>
											</div>

											<div class="col-md-3">
												<div class="form-group mb-4">
													<label for="endDate">End date</label> <input path="endDate"
														class="form-control" type="date" id="endDate"
														name="endDate" value=""></input>
												</div>
											</div>

											<div class="col-md-3">

												<div class="form-group mb-4">
													<label>Từ khóa</label><input type="text"
														class="form-control" id="keyword" name="keyword"
														placeholder="search" />
												</div>

											</div>
											<div class="col-md-3">
												<div class="form-group mb-3">
													<c:set var="daGiao" value="${1}" />
													<c:set var="chuaGiao" value="${0}" />
													<label>Trạng thái</label><select class="form-control"
														aria-label="All" id="status" name="status">
														<option value="2">All</option>
														<option value="${daGiao }">Đã giao hàng</option>
														<option value="${chuaGiao }">Chưa giao hàng</option>
													</select>
												</div>
											</div>

											<div class="col-md-1">

												<div class="form-group mb-4">
													<button type="submit" class="btn btn-primary"
														id="btnSearch" name="btnSearch">Search</button>
												</div>

											</div>

											<div class="col-md-3">
												<div class="form-group mb-3">
													<input id="page" name="page" class="form-control"
														value="${cartSearch.currentPage }">
												</div>
											</div>
										</div>

										<table id="zero_config"
											class="table table-striped table-bordered no-wrap">
											<thead>
												<tr>
													<th scope="col">No.</th>
													<th scope="col">Code</th>
													<th scope="col">Customer</th>
													<th scope="col">Mobile</th>
													<th scope="col">Address</th>
													<th scope="col">Total</th>
													<th scope="col">Create by</th>
													<th scope="col">Create date</th>
													<th scope="col">Delivery date</th>
													<th scope="col">Status</th>
													<th scope="col">Edit</th>
													<th scope="col">Delete</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="saleorder" items="${saleOrders }"
													varStatus="loop">
													<tr>
														<th scope="row">${loop.index + 1 }</th>
														<td>${saleorder.code }</td>
														<td>${saleorder.customer_name }</td>
														<td>${saleorder.customer_mobile }</td>
														<td>${saleorder.customer_address }</td>
														<td><fmt:formatNumber value="${saleorder.total }"
																minFractionDigits="0"></fmt:formatNumber> <sup>đ</sup></td>
														<td></td>
														<td><fmt:formatDate value="${saleorder.createDate }"
																pattern="dd-MM-yy" /></td>
														<td></td>
														<td>${saleorder.status }</td>
														<td><a
															href="${classpath }/edit-product/${product.id }"
															role="button" class="btn btn-primary">Edit</a>
														<td><a
															href="${classpath }/delete-product/${product.id }"
															role="button" class="btn btn-secondary">Delete</a>
													</tr>
												</c:forEach>
											</tbody>
											<tfoot>
												<tr>
													<th scope="col">No.</th>
													<th scope="col">Code</th>
													<th scope="col">Customer</th>
													<th scope="col">Mobile</th>
													<th scope="col">Address</th>
													<th scope="col">Total</th>
													<th scope="col">Create by</th>
													<th scope="col">Create date</th>
													<th scope="col">Delivery date</th>
													<th scope="col">Status</th>
													<th scope="col">Edit</th>
													<th scope="col">Delete</th>
												</tr>
											</tfoot>
										</table>

										<c:set var="totalPrices" value="${0}" />
										<c:forEach var="saleorder" items="${saleOrders }">
											<c:set var="totalPrices"
												value="${totalPrices + saleorder.total}" />
										</c:forEach>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group mb-4">
													Total sales:
													<fmt:formatNumber value="${totalPrices }"
														minFractionDigits="0"></fmt:formatNumber>
													<sup>đ</sup>
												</div>
											</div>

											<div class="col-md-6">

												<div class="pagination float-right">
													<div id="paging"></div>
												</div>

											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- End Container fluid  -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- footer -->
			<!-- ============================================================== -->
			<jsp:include page="/WEB-INF/views/admin/layout/footer.jsp"></jsp:include>
			<!-- ============================================================== -->
			<!-- End footer -->
			<!-- ============================================================== -->
		</div>
		<!-- ============================================================== -->
		<!-- End Page wrapper  -->
		<!-- ============================================================== -->
	</div>
	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->

	<!-- Slider js: All Jquery-->
	<jsp:include page="/WEB-INF/views/admin/layout/js.jsp"></jsp:include>

	<script type="text/javascript">
		$( document ).ready(function() {
			$("#status").val(${cartSearch.status});
			
			$("#paging").pagination({
				currentPage: ${cartSearch.currentPage}, //Trang hien tai
				items: ${cartSearch.totalItems}, //Tong so don hang (total sale orders)
				itemsOnPage: ${cartSearch.sizeOfPage},
				cssStyle: 'light-theme',
				onPageClick: function(pageNumber, event) {
					$('#page').val(pageNumber);
					$('#btnSearch').trigger('click');
				},
			});
		});
	</script>

</body>

</html>