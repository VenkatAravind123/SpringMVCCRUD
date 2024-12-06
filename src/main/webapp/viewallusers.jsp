<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>  
<!DOCTYPE html>  
<html>  
<head>  
    <meta charset="UTF-8">  
    <title>View All Users</title>  
    <style>  
        body {  
            font-family: Arial, sans-serif;  
            background-color: #f4f4f4;  
            margin: 0;  
            padding: 20px;  
        }  
        h2, h3 {
            text-align: center;
            color: #333;
        }
        h3 {  
            text-align: center;  
            color: #333;  
        }  
        table {  
            width: 80%;  
            margin: 20px auto;  
            border-collapse: collapse;  
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);  
            background-color: #ffffff;  
        }  
        th {  
            background-color: #343a40;  
            color: white;  
            padding: 10px;  
        }  
        td {  
            border: 1px solid #dddddd;  
            padding: 8px;  
            text-align: center;  
        }  
        tr:nth-child(even) {  
            background-color: #f2f2f2; /* Gray for even rows */  
        }  
        tr:hover {  
            background-color: #f1c40f; /* Highlight row on mouse over */  
            color: white;  
        }  
        th, td {  
            transition: background-color 0.3s, color 0.3s; /* Smooth transitions */  
        }  
        
$primary: hsl(260, 100%, 80%);
nav,
.nav-item {
	display: flex;
}
nav {
	border-radius: 6px;
	height:50px;
	font-size:30px;
	background-image: linear-gradient(
		rgb(48, 48, 48) 13%,
		rgb(30, 30, 30) 40%,
		#0c0d11 86%
	);
	color: rgba(255, 255, 255, 0.6);
	text-shadow: 0 -2px 0 black;
	cursor: pointer;
	box-shadow: 1px 2px 4px rgb(20, 20, 20), 0 4px 12px rgb(10, 10, 10);
}
.nav-item {
	flex-direction: row-reverse;
	font-size: 0.8999rem;
	line-height: 1rem;
	align-items: center;
	min-width: 120px;
	justify-content: space-between;
	transition: all 80ms ease;

	&.active {
		color: $primary;
		text-shadow: 0 0 3px hsla(260, 100%, 70%, 0.7);
	}

	&:not(.active):hover {
		color: rgba(255, 255, 255, 0.87);
	}

	&:hover > .icon .subicon {
		height: 32px;
		width: 32px;
		border-radius: 32px;
		top: -16px;
		right: -16px;
		border-color: white;
	}

	&:not(:first-of-type) {
		border-left: 1px solid rgb(60, 60, 60);
	}
	&:not(:last-of-type) {
		border-right: 0.1rem solid black;
	}

	a {
		color: inherit;
		text-decoration: none;
		padding: 1ch;
	}

	.icon {
		padding: 1ch;
		position: relative;

		.subicon {
			text-shadow: none;
			transition: all 40ms ease;
			position: absolute;
			top: -3px;
			right: -3px;
			background: red;
			color: white;
			box-shadow: 0 0 4px rgba(41, 41, 41, 0.405);
			width: 18px;
			height: 18px;
			border-radius: 14px;
			font-size: 0.7em;
			font-weight: 700;
			display: inline-grid;
			place-items: center;
			border: 2px solid mix(white, red);
		}
	}

	.icon > svg {
		max-width: 16px;
	}
}
    </style>  
</head>  
<body>  
 <h2 align="center">Spring MVC CRUD Operations with ORM/Hibernate</h2>
    <nav class="menu" id="nav">
	<span class="nav-item active">
		<span class="icon">
			<i data-feather="home"></i>
		</span>
		<a href="home">Home</a>
	</span>
	<span class="nav-item">

		<a href="adduser">Add User</a>
	</span>
	<span class="nav-item">
		<span class="icon">

		</span>
		<a href="viewallusers">View All User</a>
	</span>
	<span class="nav-item">

		<a href="deleteuser">Delete User</a>
	</span>
	<span class="nav-item">		
		<a href="updateuser">Update User</a>
	</span>
	
	<span class="nav-item">
		<a href="viewuserbyid">View User By ID</a>
	</span>
</nav>
<h3><u>View All User</u></h3>  

<table>  
    <tr>  
        <th>ID</th>  
        <th>Name</th>  
        <th>Gender</th>  
        <th>Date of Birth</th>   
        <th>Email</th>  
        <th>Contact</th>  
    </tr>  

    <c:forEach items="${userlist}" var="user">  
    <tr>  
        <td><c:out value="${user.id}"/></td>  
        <td><c:out value="${user.name}"/></td>  
        <td><c:out value="${user.gender}"/></td>  
        <td><c:out value="${user.dateofbirth}"/></td>    
        <td><c:out value="${user.email}"/></td>  
        <td><c:out value="${user.contact}"/></td>  
    </tr>  
    </c:forEach>  

</table>  

</body>  
</html>
