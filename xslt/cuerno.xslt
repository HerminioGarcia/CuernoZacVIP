<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<xsl:param name="MenuCuernoVip" select="MenuCuernoVip"></xsl:param>

	<xsl:output method="html" indent="yes"/>

	<xsl:template match="CuernoVip">
		<html lang="en">

			<head>
				<meta charset="utf-8"/>
				<title>Cuerno Terraza</title>
				<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
				<meta content="" name="keywords"/>
				<meta content="" name="description"/>

				<!-- Favicon -->
				<link href="assets/img/favicon.ico" rel="icon"/>

				<!-- Google Web Fonts -->
				<link rel="preconnect" href="https://fonts.googleapis.com"/>
				<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin=""/>

				<!-- Icon Font Stylesheet -->
				<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet"/>
				<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet"/>

				<!-- Libraries Stylesheet -->
				<link href="assets/lib/animate/animate.min.css" rel="stylesheet"/>
				<link href="assets/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet"/>
				<link href="assets/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet"/>

				<!-- Customized Bootstrap Stylesheet -->
				<link href="assets/css/bootstrap.min.css" rel="stylesheet"/>

				<!-- Template Stylesheet -->
				<link href="assets/css/style.css" rel="stylesheet"/>
			</head>

			<body>
				<div class="container-xxl bg-white p-0">
					<!-- Spinner Start -->
					<div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
						<div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
							<span class="sr-only">Loading...</span>
						</div>
					</div>
					<!-- Spinner End -->


					<div class="container-xxl position-relative p-0">
						<nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0">
							<a href="" class="navbar-brand p-0">
								<h1 class="text-primary m-0">
									<h1 class="text-primary m-0">
										<img src="assets/img/cuernoLogo.png" alt="Logo"/>
										Cuerno Terraza
									</h1>
								</h1>
							</a>
							<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
								<span class="fa fa-bars"></span>
							</button>
							<div class="collapse navbar-collapse" id="navbarCollapse">
								<xsl:for-each select ="Ventanas/Ventana">
									
									
									<xsl:choose>
										<xsl:when test="$MenuCuernoVip = @Id">
										<div class="navbar-nav ms-auto py-0 pe-4">
											<a class="nav-item nav-link active" href="{@Url}">
												<xsl:value-of select="@Texto"/>
											</a>
										</div>
										</xsl:when>
										<xsl:otherwise>
											<!--el uso de la @ hace referencia a un atributo del nodo en cuestion-->
											<a class="nav-item nav-link" href="{@Url}">
												<xsl:value-of select="@Texto"/>
											</a>
										</xsl:otherwise>
									</xsl:choose>

								</xsl:for-each>

							</div>
						</nav>

						<div class="container-xxl py-5 bg-dark hero-header mb-5">
							<div class="container my-5 py-5">
								<div class="row align-items-center g-5">
									<div class="col-lg-6 text-center text-lg-start">
										<h1 class="display-3 text-white animated slideInLeft">
											Cuerno Vip
										</h1>
										<p class="text-white animated slideInLeft mb-4 pb-2">Aquí no hay finales felices, pero sí tragos fuertes.</p>
										<!--<a href="" class="btn btn-primary py-sm-3 px-sm-5 me-3 animated slideInLeft">Book A Table</a>-->
									</div>
									<div class="col-lg-6 text-center text-lg-end overflow-hidden">
										<img class="img-fluid" src="assets/img/cuernoLogo.png" alt=""/>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Navbar & Hero End -->

					<!-- ======= choose section ======= -->
					<xsl:choose>
						<xsl:when test="$MenuCuernoVip = 0">
							<!--xsl:call-trmplate me ayuda a invocar un template que contiene informacion o estructura dentro del mismo,
						y asi inferior dentro del template principal-->
							<xsl:call-template name="Inicio"></xsl:call-template>
						</xsl:when>
						<xsl:when test="$MenuCuernoVip = 1">
							<xsl:call-template name="Menu"></xsl:call-template>
						</xsl:when>
						<xsl:when test="$MenuCuernoVip = 2">
							<xsl:call-template name="Juego"></xsl:call-template>
						</xsl:when>
						
					</xsl:choose>
					<!-- choose main -->
					
					<!-- Footer Start -->
					<div class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
						<div class="container py-5">
							<div class="row g-5">
								<div class="col-lg-3 col-md-6">
									<h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Contact</h4>
									<p class="mb-2">
										<i class="fa fa-map-marker-alt me-3"></i>123 Street, New York, USA
									</p>
									<p class="mb-2">
										<i class="fa fa-phone-alt me-3"></i>+012 345 67890
									</p>
									<p class="mb-2">
										<i class="fa fa-envelope me-3"></i>info@example.com
									</p>
									<div class="d-flex pt-2">
										<a class="btn btn-outline-light btn-social" href="">
											<i class="fab fa-twitter"></i>
										</a>
										<a class="btn btn-outline-light btn-social" href="">
											<i class="fab fa-facebook-f"></i>
										</a>
										<a class="btn btn-outline-light btn-social" href="">
											<i class="fab fa-youtube"></i>
										</a>
										<a class="btn btn-outline-light btn-social" href="">
											<i class="fab fa-linkedin-in"></i>
										</a>
									</div>
								</div>
								<div class="col-lg-3 col-md-6">
									<h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Opening</h4>
									<h5 class="text-light fw-normal">Monday - Saturday</h5>
									<p>09AM - 09PM</p>
									<h5 class="text-light fw-normal">Sunday</h5>
									<p>10AM - 08PM</p>
								</div>

							</div>
						</div>

					</div>
					<!-- Footer End -->

					
				</div>

				<!-- JavaScript Libraries -->
				<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
				<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
				<script src="assets/lib/wow/wow.min.js"></script>
				<script src="assets/lib/easing/easing.min.js"></script>
				<script src="assets/lib/waypoints/waypoints.min.js"></script>
				<script src="assets/lib/counterup/counterup.min.js"></script>
				<script src="assets/lib/owlcarousel/owl.carousel.min.js"></script>
				<script src="assets/lib/tempusdominus/js/moment.min.js"></script>
				<script src="assets/lib/tempusdominus/js/moment-timezone.min.js"></script>
				<script src="assets/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

				<!-- Template Javascript -->
				<script src="assets/js/main.js"></script>
			</body>

		</html>
	</xsl:template>
	
	
	<xsl:template name ="Inicio">
		<h2>Inicio</h2>
	</xsl:template>

	<xsl:template name ="Menu">
		<h2>Menu</h2>
	</xsl:template>

	<xsl:template name ="Juego">
		<h2>Juego</h2>
	</xsl:template>
	

</xsl:stylesheet>