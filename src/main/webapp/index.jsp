
<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.*"%>
<html>
<head>
<title>Mycart: Home</title>
<%@include file="components/common_css_js.jsp"%>

</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<%
	    String cat=request.getParameter("category");
	
		ProductDao dao = new ProductDao(FactoryProvider.getFactory());
		List<Product> list=null;
			
		 if(cat==null ||cat.trim().equals("all"))
		{
			list =dao.getAllProducts();
		}
		else{
			int cid=Integer.parseInt(cat.trim());
			list=dao.getAllProductsById(cid);
		}
	
		CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
		List<Category> clist = cdao.getCategories();
	%>


	<div class="row ml-2">
		<!-- show categories -->

		<div class="col-md-2">

			<div class="list-group mt-4">
				<a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
					All Products</a>

				<%
					for (Category c : clist) {
				%>
				<a href="index.jsp?category=<%=c.getCategoryId() %>" class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>


				<%
					}
				%>

			</div>
		</div>
		<!-- //show products -->
		<div class="col-md-10">

			<!-- row -->
	      <div class="row mt-4">
	      	<div class="col-md-12">
	      	  		
	      	  	<div class="card-columns">
	      	  	
	      	  	<!--   traversing product -->
	      	  	
	      	  	<%
	      	  	
	      	  	for(Product p:list)
	      	  	{
	      	    %>
	      	    <div class="card">
	      	    	<div class="container text-center">
	      	    	<img alt="..." style="max-height:200px; max-width:100px; width:auto;" src="img/products/<%= p.getpPhoto()%>" class="card-img-top m-2">		
	      	   
	      	    	
	      	    	</div>
	      	    	 	<div class="class-body">
	      	    		<h5 class="card-title ml-2"><%=p.getpName() %></h5>
	      	    	    <p class="card-text ml-2"><%=Helper.get10Words(p.getpDesc()) %></p>
	      	    	</div>
	      	    	
	      	    <div class="card-footer text-center">
	      	    	 <button class="btn custom-bg text-white" onclick="add_to_cart(<%=p.getPid() %>,'<%=p.getpName() %>','<%=p.getPriceAfterApplyDiscount() %>')">Add to Cart</button>
	      	    	 <button class="btn btn-outline-success">&#8377; <%=p.getPriceAfterApplyDiscount()%>/- <span class="text-secondary discount-label">  &#8377;<%=p.getpPrice() %> <%=p.getpDiscount() %>%</span></button>
	      	    </div>	
	      	    
	      	    </div>
	      	    
	      	    
	      	    <%		
	      	  	}
	      	  	
	      	  	
	      	  	if(list.size()==0)
	      	  	{
	      	  		out.println("<h3>No item in this category</h3>");
	      	  	}
	      	  	
	      	  	
	      	  	
	      	  	%>
	      	  	
	      	  	</div>	
	      	
	      	</div>
	      
	      
	      </div>

				

		</div>

	</div>
			
				<%@include file="components/common_modals.jsp" %>


</body>
</html>
