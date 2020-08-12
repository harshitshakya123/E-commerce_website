<%@page import="java.util.Map"%>
<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.*"%>
<%@page import="com.learn.mycart.entities.*"%>

<%
	User user = (User) session.getAttribute("current-user");
	if (user == null) {
		session.setAttribute("message", "You are not logged in !! Login first");
		response.sendRedirect("login.jsp");
	} else {
		if (user.getUserType().equals("normal")) {
			session.setAttribute("message", "You are not Admin !! Do not access this page");
			response.sendRedirect("login.jsp");
			return;
		}
	}
%>

<%
							CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
							List<Category> list = cdao.getCategories();
						    
							Map<String, Long> m= Helper.getCounts(FactoryProvider.getFactory());
						%>









<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin page: Mycart</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container admin mt-3">
		<div class="container-fluid">
			<%@include file="components/message.jsp"%>


		</div>



		<div class="row mt-3">

			<!-- //first column -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								src="img/user.png" alt="user.png">
						</div>

						<h1><%=m.get("userCount") %></h1>
						<h1>Users</h1>

					</div>
				</div>
			</div>

			<!-- //second column -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								src="img/category.png" alt="user.png">

						</div>
						<h1><%= list.size() %></h1>
						<h1>Categories</h1>
					</div>
				</div>
			</div>

			<!-- //third column  -->
			<div class="col-md-4">

				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								src="img/product.png" alt="user.png">

						</div>
						<h1><%=m.get("productCount") %></h1>
						<h1>Product</h1>

					</div>
				</div>
			</div>


		</div>

		<!-- second row -->
		<div class="row mt-3">
			<!-- first column -->
			<div class="col-md-6">
				<div class="card" data-toggle="modal"
					data-target="#add-category-modal">
					<div class="card-body text-center ">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								src="img/keys.png" alt="user.png">
						</div>
						<p class="mt-2">Click here to add new category</p>
						<h1>Add Categories</h1>
					</div>
				</div>
			</div>

			<!-- second column -->
			<div class="col-md-6">
				<div class="card" data-toggle="modal"
					data-target="#add-product-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								src="img/add.png" alt="user.png">
						</div>
						<p class="mt-2">Click here to add new product</p>
						<h1>Add Products</h1>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- modal -->


	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill Category
						Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post">

						<input type="hidden" name="operation" value="addCategory">

						<div class="form-group">
							<input type="text" class="form-control" name="catTitle"
								placeholder="Enter category title" required />

						</div>
						<div class="form-group">
							<textarea style="height: 300px" class="form-control"
								placeholder="Enter category description" name="catDescription"
								required></textarea>

						</div>

						<div class="container text-center">
							<button type="submit" class="btn btn-outline-success">Add
								Category</button>
							<button type="submit" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Products
						details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- form -->
					<form action="ProductOperationServlet" method="post"
						enctype="multipart/form-data">

						<input type="hidden" name="operation" value="addProduct">

						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="Enter title of product" name="pName" required />

						</div>
						<div class="form-group">
							<textarea style="height: 150px;" class="form-control"
								placeholder="Enter product description" name="pDesc" required></textarea>
						</div>

						<div class="form-group">
							<input type="number" class="form-control"
								placeholder="Price of the product" name="pPrice" required />

						</div>

						<div class="form-group">
							<input type="number" class="form-control"
								placeholder="Enter product discount" name="pDiscount" required />

						</div>

						<div class="form-group">
							<input type="number" class="form-control"
								placeholder="Enter product quantity" name="pQuantity" required />

						</div>

						




						<!--  product categories -->
						<div class="form-group">
							<select name="catId" class="form-control" id="">

								<%
									for (Category c : list) {
								%>
								<option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>
								<%
									}
								%>
							</select>





							<div class="form-group">
								<label for="pPic">Select Picture of product</label><br> <input
									type="file" id="pPic" name="pPic" required />

							</div>


						</div>

						<div class="container text-center">
							<button class="btn btn-outline-success">Add Product</button>
						</div>

					</form>

					<!-- end form -->

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>
	
		<%@include file="components/common_modals.jsp"%>

</body>
</html>
