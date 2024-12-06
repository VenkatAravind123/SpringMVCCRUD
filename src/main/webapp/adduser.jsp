<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" type="text/css" href="style.css"/>
    <title>Spring MVC</title>
    <style>
        body {
            background-color: lightgrey;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        form {
            width: 300px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        form input[type="text"], form input[type="number"], 
        form input[type="date"], form input[type="email"], 
        form select {
            width: 100%;
            padding: 8px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        form input[type="radio"] {
            margin-right: 5px;
        }
        form input[type="submit"] {
            width: 100%;
            background-color: #28a745;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        form input[type="submit"]:hover {
            background-color: #218838;
        }
        label {
            margin-top: 10px;
            display: block;
            font-weight: bold;
            color: #333;
        }
        form .form-group {
            margin-bottom: 15px;
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

    <h3 align="center">Add User</h3>
    <form method="post" action="insertuser">
        <div class="form-group">
            <label for="uid">Enter ID:</label>
            <input type="number" id="uid" name="uid" required/>
        </div>
        <div class="form-group">
            <label for="uname">Enter Name:</label>
            <input type="text" id="uname" name="uname" required/>
        </div>
        <div class="form-group">
            <label>Select Gender:</label>
            <input type="radio" id="male" name="ugender" value="MALE" required/><label for="male">Male</label>
            <input type="radio" id="female" name="ugender" value="FEMALE" required/><label for="female">Female</label>
            <input type="radio" id="others" name="ugender" value="OTHERS" required/><label for="others">Others</label>
        </div>
        <div class="form-group">
            <label for="udob">Select Date Of Birth:</label>
            <input type="date" id="udob" name="udob" required/>
        </div>
        
        
        <div class="form-group">
            <label for="uemail">Enter Email:</label>
            <input type="email" id="uemail" name="uemail" required/>
        </div>
        <div class="form-group">
            <label for="ucontact">Enter Contact:</label>
            <input type="number" id="ucontact" name="ucontact" required/>
        </div>
        <input type="submit" value="Add User"/>
    </form>
</body>
</html>
