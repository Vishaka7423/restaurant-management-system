<%@ page import="Connection.DBconnect"%>
<%@ page import="Model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Dao.ProductDao"%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MALHAR</title>
<%@ include file="component/head.jsp"%>
<%@ include file="component/navbar.jsp"%>
<link href="component/all.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- Flipster CSS -->
<link rel="stylesheet" href="dist/jquery.flipster.min.css">

<!-- Flipster Js -->
<script src="dist/jquery.flipster.min.js"></script>
<%
auth = (User) request.getSession().getAttribute("auth");

if (auth != null) {
	request.setAttribute("auth", auth);
}
%>
<style>
body, html {
	margin: 0;
	padding: 0;
	height: 100%;
	/* 	overflow: hidden;
 */
}

.video-bg-container {
	position: relative;
	width: 100%;
	height: 100vh;
}

.video-bg {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
	z-index: -1; /* Ensures the video stays in the background */
	display: none; /* Initially hide all videos */
	/*      clip-path: inset(0.1% 0.1% 0.1% 0.1%); /* Adjust to crop the video */
}

.text-overlay {
	position: absolute;
	top: 35%;
	left: 50%;
	color: white;
	transform: translate(-50%, -50%);
	font-size: 200%;
	font-weight: bold;
	font-family: cursive;
	text-align: center;
	z-index: 1; /* Ensures the text is above the video */
	background: rgba(0, 0, 0, 0.5);
	/* Optional: Add background for better readability */
	padding: 20px; /* Optional: Add padding for better readability */
	/* 	border-radius: 10px;
 */ /* Optional: Add border radius for better styling */
}

.chef-section {
	padding: 20px;
	background-color: #f8f9fa;
	text-align: center;
}

.chef-container {
	display: flex;
	justify-content: center; /* Center the items horizontally */
	flex-wrap: wrap; /* Allow items to wrap if necessary */
	gap: 20px; /* Space between items */
}

.chef-container .box {
	flex: 1 1 200px;
	/* Allow boxes to grow and shrink, with a base size of 200px */
	max-width: 400px; /* Set a max width for each box */
	position: relative;
	/* Needed for absolute positioning of the overlay */
	overflow: hidden;
}

.chef-container img {
	width: 100%;
	border-radius: 15px;
	display: block; /* Ensure images do not have extra space below */
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.8);
}

.chef-container img:hover {
	transform: scale(1.2); /* Magnify image on hover */
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.8);
	/* Add shadow for depth effect */
}

/* .carousel-inner {
  display: flex; /* Flexbox to handle alignment */
justify-content





 


center




; /* Center items horizontally */
}
.carousel-item {
	display: flex; /* Flexbox for the content inside */
	justify-content: center; /* Center content inside each slide */
}

.carousel-item img {
	width: 20%; /* Ensure images take full width of the slide */
	max-width: 100%; /* Ensure images do not exceed their container */
	height: auto; /* Maintain aspect ratio of images */
}
*
/
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
        document.addEventListener('DOMContentLoaded', (event) => {
            // Select all video elements
            const videos = document.querySelectorAll('.video-bg');
            
            // Set playback rate for each video
            videos.forEach(video => {
                video.playbackRate = 2; // Adjust the value to speed up or slow down
            });
        });
    </script>

</head>
<body>
	<div class="video-bg-container">
		<video class="video-bg" id="video1" muted>
			<source src="images/videos/threev.mp4" type="video/mp4">
			Your browser does not support the video tag.
		</video>
		<video class="video-bg" id="video2" muted>
			<source src="images/videos/onev.mp4" type="video/mp4">
			Your browser does not support the video tag.
		</video>
		<video class="video-bg" id="video3" muted>
			<source src="images/videos/fourv.mp4" type="video/mp4">
			Your browser does not support the video tag.
		</video>
		<div class="text-overlay">
			<h1 class="h-primary"
				style="font-family: 'Young Serif'; font-weight: bold;">WELCOME
				TO MALHAR</h1>
			<p>WE SERVE</p>
			<p>SPICE TO YOUR MOMENTS WITH US</p>
		</div>
	</div>

	<section class="chef-section" id="chef">
		<h1 style="font-family: Times New Roman; font-weight: bold;">OUR
			CHEFS</h1>
		<div class="chef-container">
			<div class="box">
				<img src="images/LOGO/chef1.jpg" alt="Chef Vikas Bhosale"><br>
				<p style="font-family: Times New Roman; font-size: 1.5rem;">
					<b>Chef. VIKAS BHOSALE</b>
				</p>
			</div>
			<div class="box">
				<img src="images/LOGO/chef3.png" alt="Chef Anjum Deshmukh"><br>
				<p style="font-family: Times New Roman; font-size: 1.5rem;">
					<b>Chef. ANJUM DESHMUKH</b>
				</p>
			</div>
			<div class="box">
				<img src="images/LOGO/chef2.jpg" alt="Chef Ranveer Patil"><br>
				<p style="font-family: Times New Roman; font-size: 1.5rem;">
					<b>Chef. RANVEER PATIL</b>
				</p>
			</div>
		</div>
	</section>

	<section id="menu">
		<div class="wrapper">
			<input type="radio" name="slide" id="one" checked>
			<input type="radio" name="slide" id="two"> 
			<input type="radio"name="slide" id="three">

			<div class="img img-1">
				<img src="images/LOGO/nonveg.png" alt="nonveg">
			</div>
			<div class="img img-2">
				<img src="images/LOGO/veg.png" alt="veg">
			</div>
			<div class="img img-3">
				<img src="images/LOGO/dessert.png" alt="dessert">
			</div>
			<div class="sliders">
				<label for="one" class="one"> </label>
				<label for="two" class="two"> </label>
				<label for="three" class="three"> </label>

			</div>
		
		</div>


	</section>


	<script type="text/javascript">window.onload = function() {
    var videos = [
        document.getElementById('video1'),
        document.getElementById('video2'),
        document.getElementById('video3')
    ];

    var currentVideoIndex = 0;

    function playNextVideo() {
        console.log("Video " + currentVideoIndex + " ended, preparing to play next video.");
        videos[currentVideoIndex].style.display = 'none';
        currentVideoIndex = (currentVideoIndex + 1) % videos.length;
        videos[currentVideoIndex].style.display = 'block';
        console.log("Playing video index: " + currentVideoIndex);
        videos[currentVideoIndex].play().catch(function(error) {
            console.error("Error playing video index: " + currentVideoIndex, error);
        });
    }

    // Initialize first video
    videos[currentVideoIndex].style.display = 'block';
    console.log("Playing initial video index: " + currentVideoIndex);
    videos[currentVideoIndex].play().catch(function(error) {
        console.error("Error playing initial video index: " + currentVideoIndex, error);
    });

    videos.forEach(function(video, index) {
        video.addEventListener('ended', playNextVideo);
        console.log("Added ended event listener to video index: " + index);
    });
};



</script>

	<%@ include file="component/foot.jsp"%>
</body>
</html>
