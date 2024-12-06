<!DOCTYPE html>
<html>
<head>
    <title>Spring MVC</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
        }
.form-container 
{
    display: flex;
    justify-content: center;
    align-items: center;
}

label
{
font-weight: bolder;
}
        form {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
        }

        td {
            padding: 10px;
        }

        .button-container {
            text-align: center;
            padding-top: 10px;
        }

       input[type="reset"] {
            margin: 5px;
            padding: 5px 15px;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
        }

        input[type="submit"] {
          
            padding: 1.3em 3em;
  font-size: 12px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 500;
  color: #000;
  background-color: #fff;
  border: none;
  border-radius: 45px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
        }

        input[type="reset"] {
            background-color: #f44336;
        }

        input[type="submit"]:hover{
        background-color: #23c483;
  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
  color: #fff;
  transform: translateY(-7px);
        }
        
        input[type="submit"]:active{
        transform: translateY(-1px);
        }
        
         input[type="reset"]:hover {
            opacity: 0.8;
        }
        
        input[type="email"], input[type="number"], input[type="text"]{
        width: 80%;
  max-width: 200px;
  height: 25px;
  padding: 12px;
  border-radius: 12px;
  border: 1.5px solid lightgrey;
  outline: none;
  transition: all 0.3s cubic-bezier(0.19, 1, 0.22, 1);
  box-shadow: 0px 0px 20px -18px;
        }
        
        input[type="email"], input[type="number"], input[type="text"]:hover{
        border: 2px solid lightgrey;
  box-shadow: 0px 0px 20px -17px;
        }
        input[type="email"], input[type="number"], input[type="text"]:active{
        transform:scale(0.95);
        }
        input[type="email"], input[type="number"], input[type="text"]:focus{
         border: 2px solid grey;
        }
        
        * {
	box-sizing: border-box;
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

		<a href="addemp">Add User</a>
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
    
    <div class="form-container">
    
        <form method="post" action="update">
        <h3 style="text-align: center;">Update User</h3>
            <table>
                <tr>
                    <td><label for="uid">Enter Existing ID</label></td>
                    <td><input type="number" id="uid" name="uid" required/></td>
                </tr>
                 <tr>
                    <td><label for="uname">Enter Name</label></td>
                    <td><input type="text" id="uname" name="uname" required/></td>
                </tr>
                <tr> 
                
                <tr>
                    <td><label for="uemail">Enter Email ID</label></td>
                    <td><input type="email" id="uemail" name="uemail" required/></td>
                </tr>
                <tr>
                    <td><label for="ucontact">Enter Contact</label></td>
                    <td><input type="number" id="ucontact" name="ucontact" required/></td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <input type="submit" value="Update User"/>
                        <input type="reset" value="Clear"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
