<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="CSS/homeCSS.css">
</head>
<body>
	<header>
	<nav>
		<div class="logo">
			<h1>Expenditure Guider</h1>
		</div>
        <ul>
            <li><a href="">Tours Gallery</a></li>
            <li><a href="InsertBooking">Plan Your Tour</a></li>
            <li><a href="">Tour Guides</a></li>
            
        </ul>
        <div class ="User">
            <%
            	//if user already sign up the system
            	String userName=(String)session.getAttribute("UserName");
           		String profile=(String)session.getAttribute("profilePic");
            	String profilePic="Images/img2.png";
           		userName = (userName != null) ? userName : "";
           		profile = (profile != null) ?"data:image/jpg;base64,"+ profile:profilePic;
            %>
         
            <% if (!userName.isEmpty()) { %>
		        <!-- Display user's profile and logout button -->
		        <span><%= userName %></span>
		        <img id="profilePic" src="data:image/jpeg;base64,<%= session.getAttribute("profile") %>" alt="Profile Picture" style="cursor: pointer;width: 50px;height: 50px;border-radius: 50%;object-fit: cover;border: 1px solid #fff;">
		        
		        <ul id="customMenu" class="custom-menu" style="	display:none;display:none;position:absolute;background-color:#ffffff;box-shadow:0 2px 10px rba(0,0,0,0.2);list-styel:none;padding:10px;border-radius:5px;z-index:1000;cursor: pointer;">
        			<li onclick="editProfile()" style="padding: 8px 12px;color: #333;text-align: left;">Edit Profile</li>
       				<li onclick="logout()" style="padding: 8px 12px;color: #333;text-align: left;">Logout</li>
    			</ul>
    			
    			
    		<% } else { %>
		        <!-- Display Sign In and Sign Up links if user is not logged in -->
		        <a href="Login.jsp">Sign In</a>
		        <a href="TravelPlannerInsert.jsp">Sign Up</a>
    		<% } %>
        </div>
	</nav>
    
</header>
<section class="main-Content reveal">
    <div class="contentWelcome reveal" style="background-image:url('Images/BeachNew.png')">
        <p>Tours are waiting for You...</p>
        
        <form action="SearchServelet" method="post">
        <input type="text" placeholder="Search Your tour.." name="search">
        <button type="submit" class="search"><i class="fa fa-search"></i></button>
        </form>
    </div>
</section>
<section class="descript reveal">
    <div class="mainDes reveal">
    <div class="des1">
        <h1>Expenditure Guider</h1>
        <p>Expenditure Guider has been the leader in the Sri Lanka tourism industry.We guide tours for couples on holiday or honeymoon,for individual nature lovers as well as for special interest and incentives holiday groups.<br><br><b>All foriengs and Sri lankans are welcome</b></p>
        <ul>
            <li><a href="AboutUs.jsp">About Us</a></li>
            <li><a href="">Conatct US</a></li>
        </ul>
    </div>
    <div class="desImg">
        <img src="Images/traveller1.jpg">
    </div>
    <div class="des3">
        <h2><b>WHY JOIN WITH US</b></h2>
        <ul>
            <li>Tailor Made Tours</li>
            <hr>
            <li>Experinced Guides</li>
            <hr>
            <li>Value for Money </li>
            <hr>
            <li>Can Book and Excursion Online</li>
        </ul>
    </div>
</div>
</section>
<section class="tourContainer reveal">
    <div class="topic reveal" >
        <h1>Tours</h1>
    </div>
    <div class="tourItem ">
        <div class="items item1" style="background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)),url('Images/Culture.jpg')">
            <a href="TourServlet?category=Culture">
                <h2>Culture Tours</h2>
            </a>
        </div>
        <div class="items item2" style="background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)),url('Images/wild2.jpg')">
            <a href="TourServlet?category=Wild">
                <h2>WildLife Tours</h2>
            </a>
        </div>
        <div class="items item3" style="background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)),url('Images/Hill-Country42.jpg')">
            <a href="TourServlet?category=hill-Country">
                <h2>HillCountry Tours</h2>
            </a>
        </div>
        <div class="items item4" style="background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)),url('Images/Beach-Tours3.jpg')">
            <a href="TourServlet?category=Beach">
                <h2>Beach Tours</h2>
            </a>
        </div>
        <div class="items item5" style="background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)),url('Images/honeymoonTour.jpg')">
            <a href="TourServlet?category=weddedBliss">
                <h2>Wedded Bliss</h2>
            </a>
        </div>
    </div>
</section>
<footer class="reveal">
    <nav>
		<div class ="paymentMethod">
            <div>
            <img src="Images/visa.png">
            </div>
            <div>
            <img src="Images/master.png">
            </div>
        </div>
            
        
        <ul>
            <li><a href="#top">Home</a></li>
            <li><a href="AboutUs.jsp">About Us</a></li>
            <li><a href="">Tour Calender</a></li>
            <li><a href="">Tour Guides</a></li>
            <li><a href="Feedback.jsp">Reviews</a></li>
            <li><a href="">Gallery</a></li>
            
        </ul>
        
	</nav>
    <div class="details1">
        <div class="subDet1">
            <a href="">Privacy & policy </a>
            <span>|</span>
            <a href="">Terms & Conditions </a>
        </div>
        <h2>Expenditure Guider</h2>
        <div class="contactlink">
        <a href="#" class="fa fa-facebook"></a>
        <a href="#" class="fa fa-twitter"></a>
        </div>
    </div>
</footer>
<script type="text/javascript">
	
	window.addEventListener('scroll',reveal);
	
	
	function reveal(){
		var reveals=document.querySelectorAll('.reveal');
		
		for(var i=0;i<reveals.length;i++){
			var windowHeiht=window.innerHeight;
			var revealtop=reveals[i].getBoundingClientRect().top;
			var revealPoint=150;
			console.log("Scroll event triggered");
			console.log("revealTop:", revealtop);
			console.log("windowHeight:", windowHeiht);
			
			if(revealtop<windowHeiht-revealPoint){
				reveals[i].classList.add('active');
			}
			else{
				reveals[i].classList.remove('active');
			}
		}
	}
	const profi=document.getElementById("profilePic");
	const custMenue=document.getElementById("customMenu");
	const userName ="<%=userName %>";
	
	if(userName){
		profilePic.addEventListener("contextmenu", (e) => {
		    e.preventDefault(); // Prevent default context menu
		    const { clientX: mouseX, clientY: mouseY } = e;

		    // Position the custom menu
		    customMenu.style.top = `${mouseY}px`;
		    customMenu.style.left = `${mouseX}px`;
		    customMenu.style.display = "block";
		});
		document.addEventListener("click", (e) => {
		    if (e.target !== customMenu && !customMenu.contains(e.target)) {
		        customMenu.style.display = "none";
		    }
		});

	}
	
	function logout(){
		window.location.href="LogOutServelet";
	}

	function editProfile(){
		window.location.href="TravelPlannerAccount.jsp";
	}

</script>
</body>
</html>