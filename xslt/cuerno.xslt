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
				<script src="assets/js/MiScript.js" type="text/javascript"></script>
				<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
							<xsl:call-template name="Mapa"></xsl:call-template>
						</xsl:when>

					</xsl:choose>
					<!-- choose main -->



					<!-- Footer Start -->
					<div class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
						<div class="container py-5">
							<div class="row g-5">
								<div class="col-lg-3 col-md-6">
									<h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Contacto</h4>
									<p class="mb-2">
										<i class="fa fa-map-marker-alt me-3"></i>
										<xsl:value-of select="Datos/Direccion"/>
									</p>
									<p class="mb-2">
										<i class="fa fa-phone-alt me-3"></i>
										<xsl:value-of select="Datos/Telefono"/>
									</p>
									<p class="mb-2">
										<i class="fa fa-envelope me-3"></i>
										<xsl:value-of select="Datos/correo"/>
									</p>
									<div class="d-flex pt-2">

										<a class="btn btn-outline-light btn-social" href="{Datos/facebook}">
											<i class="fab fa-facebook-f"></i>
										</a>


									</div>
								</div>
								<div class="col-lg-3 col-md-6">
									<h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Horario</h4>
									<h5 class="text-light fw-normal">
										<xsl:value-of select="Datos/Horarios/Dias"/>
									</h5>
									<p>
										<xsl:value-of select="Datos/Horarios/Horario"/>
									</p>
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

	<xsl:template name="Inicio">
		<link href="assets/css/style.css" rel="stylesheet"/>
		<script src="assets/js/MiScript.js" type="text/javascript"></script>

		<!-- Promociones -->
		<div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
			<div class="container">
				<div class="text-center">
					<h5 class="section-title ff-secondary text-center text-primary fw-normal">Promociones de la semana</h5>
					<h1 class="mb-5">Revisa nuestras promociones</h1>
				</div>

				<div class="owl-carousel testimonial-carousel" style="width: 90%; margin: auto;">
					<xsl:for-each select="Promociones/Promocion">
						<div class="testimonial-item bg-transparent border rounded p-4">
							<div class="ps-3">
								<h5 class="mb-1 promo-dia">
									<xsl:value-of select="@Dia" />
								</h5>
							</div>
							<p>
								<xsl:value-of select="Descripcion" />
							</p>
							<div class="d-flex align-items-center">
								<img class="img-fluid rounded w-75 wow zoomIn" src="{Imagen}" style="margin-top: 25;" />
							</div>
						</div>
					</xsl:for-each>
				</div>
			</div>
		</div>
		<!-- Promociones End -->

		<!-- Video and Audio -->
		<div class="container-xxl py-5 px-0 wow fadeInUp" data-wow-delay="0.1s">
			<div class="row g-0">
				<section>
					<section class="tm-section-row p-5">
						<h2 class="text-primary section-title">Video</h2>
						<div id="Video">
							<video controls="true" width="100%" poster="{Eventos/Evento/@Portada}">
								<source src="{Eventos/Evento/Video}"></source>
							</video>
						</div>
					</section>
					<section class="tm-section-row p-5">
						<br></br>
						<br></br>
						<h2 class="text-primary section-title">Audio</h2>
						<div id="Audio" class="media-container">
							<img src="{Eventos/Evento/@Portada}" width="100%" class="media-poster"/>
							<audio controls="true" style="width:100%" class="audio-player">
								<source src="{Eventos/Evento/Audio}"></source>
							</audio>
						</div>
					</section>
				</section>
			</div>
		</div>
	</xsl:template>



	<xsl:template name="Menu">
		<!-- ======= Menu ======= -->
		<div class="container-xxl py-5">
			<div class="container">
				<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
					<h5 class="section-title ff-secondary text-center text-primary fw-normal">Menu de Bebidas</h5>
					<h1 class="mb-5">Disfruta de nuestro menu</h1>
				</div>
				<div class="tab-class text-center wow fadeInUp" data-wow-delay="0.1s">
					<ul class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
						<!-- Opción para "ALL" -->
						<li class="nav-item">
							<a class="d-flex align-items-center text-start mx-3 ms-0 pb-3 active" data-bs-toggle="pill" href="#tab-all">
								<i class="fa fa-2x text-primary">
									<img src="assets/img/cerveza_cocteleria.jpeg" class="fa menu-logo fa-2x text-primary"/>
								</i>
								<div class="ps-3">
									<h6 class="mt-n1 mb-0">ALL</h6>
								</div>
							</a>
						</li>
						<!-- Iteración sobre tipos de bebidas -->
						<xsl:for-each select="Bebidas/Tipo">
							<li class="nav-item">
								<!-- ID único basado en el nombre del tipo -->
								<a class="d-flex align-items-center text-start mx-3 pb-3" data-bs-toggle="pill" href="#tab-{position()}">
									<i class="fa fa-2x text-primary">
										<img src="{@OpcionLogo}" class="fa menu-logo fa-2x text-primary"/>
									</i>
									<div class="ps-3">
										<h6 class="mt-n1 mb-0">
											<xsl:value-of select="@Nombre"/>
										</h6>
									</div>
								</a>
							</li>
						</xsl:for-each>
					</ul>

					<!-- Contenido de las tabs -->
					<div class="tab-content">
						<!-- Opción para mostrar todas las bebidas -->
						<div id="tab-all" class="tab-pane fade show p-0 active">
							<div class="row g-4">
								<xsl:for-each select="Bebidas/Tipo/Bebida">
									<div class="col-lg-6" draggable="true" ondragstart="drag(event)"
										data-name="{@Nombre}"
										data-price="{Precio/@Medio}">
										<div class="d-flex align-items-center">
											<img class="flex-shrink-0 img-fluid rounded" src="{Imagen}" alt="" style="width: 80px;"/>
											<div class="w-100 d-flex flex-column text-start ps-4">
												<h5 class="d-flex justify-content-between border-bottom pb-2">
													<span>
														<xsl:value-of select="@Nombre"/>
													</span>
													<span class="text-primary">
														$<xsl:value-of select="Precio/@Medio"/>
													</span>
												</h5>
												<small class="fst-italic">
													<xsl:value-of select="Descripcion"/>
												</small>
											</div>
										</div>
									</div>
								</xsl:for-each>
							</div>
						</div>

						<!-- Iteración para contenido de tabs de tipos de bebidas -->
						<xsl:for-each select="Bebidas/Tipo">
							<div id="tab-{position()}" class="tab-pane fade show p-0">
								<div class="row g-4">
									<!-- Mostrar solo bebidas del tipo seleccionado -->
									<xsl:for-each select="Bebida">
										<div class="col-lg-6" draggable="true" ondragstart="drag(event)"
											data-name="{@Nombre}"
											data-price="{Precio/@Medio}">
											<div class="d-flex align-items-center">
												<img class="flex-shrink-0 img-fluid rounded" src="{Imagen}" alt="" style="width: 80px;"/>
												<div class="w-100 d-flex flex-column text-start ps-4">
													<h5 class="d-flex justify-content-between border-bottom pb-2">
														<span>
															<xsl:value-of select="@Nombre"/>
														</span>
														<span class="text-primary">
															$<xsl:value-of select="Precio/@Medio"/>
														</span>
													</h5>
													<small class="fst-italic">
														<xsl:value-of select="Descripcion"/>
													</small>
												</div>
											</div>
										</div>
									</xsl:for-each>
								</div>
							</div>
						</xsl:for-each>
					</div>
				</div>
			</div>
		</div>

		<!-- Carrito de Compras -->
		<div id="cart" ondrop="drop(event)" ondragover="allowDrop(event)" style="border: 1px solid #ccc; padding: 20px; min-height: 200px;">
			<h2>Carrito de Compras</h2>
			<ul id="cart-items"></ul>
			<p>
				Total: $<span id="total">0</span>
			</p>
			<button onclick="finalizePurchase()">Comprar</button>
		</div>

		<!-- Zona de eliminación -->
		<div id="trash" ondrop="dropTrash(event)" ondragover="allowDrop(event)" style="border: 1px solid red; padding: 20px; min-height: 100px;">
			<h3>Eliminar del carrito</h3>
		</div>
		
		
	</xsl:template>




	<xsl:template name ="Mapa">
			<!-- ======= Contact Section ======= -->

			<!--API de Google-->
			<script>
				<![CDATA[
			(g=>{var h,a,k,p="The Google Maps JavaScript API",c="google",l="importLibrary",q="__ib__",m=document,b=window;b=b[c]||(b[c]={});var d=b.maps||(b.maps={}),r=new Set,e=new URLSearchParams,u=()=>h||(h=new Promise(async(f,n)=>{await (a=m.createElement("script"));e.set("libraries",[...r]+"");for(k in g)e.set(k.replace(/[A-Z]/g,t=>"_"+t[0].toLowerCase()),g[k]);e.set("callback",c+".maps."+q);a.src=`https://maps.${c}apis.com/maps/api/js?`+e;d[q]=f;a.onerror=()=>h=n(Error(p+" could not load."));a.nonce=m.querySelector("script[nonce]")?.nonce||"";m.head.append(a)}));d[l]?console.warn(p+" only loads once. Ignoring:",g):d[l]=(f,...n)=>r.add(f)&&u().then(()=>d[l](f,...n))})({
			key: "AIzaSyCWeeateTaYGqsHhNcmoDfT7Us-vLDZVPs",
			// Add other bootstrap parameters as needed, using camel case.
			// Use the 'v' parameter to indicate the version to load (alpha, beta, weekly, etc.)
			});]]>
			</script>

			<script src="assets/js/MiScript.js" type="text/javascript"></script>

			<section id="contact" class="contact">
				<div class="container" data-aos="fade-up">

					<div class="section-title">
						<h2>Mapa</h2>
					</div>
				</div>

				<div data-aos="fade-up">
					<!--<iframe style="border:0; width: 100%; height: 350px;" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12097.433213460943!2d-74.0062269!3d40.7101282!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb89d1fe6bc499443!2sDowntown+Conference+Center!5e0!3m2!1smk!2sbg!4v1539943755621" frameborder="0" allowfullscreen=""></iframe>-->
					<style>
						#map{
						border:0;
						width: 100%;
						height: 350px;
						}
					</style>
					<div id="google-map">
						<div id="map"></div>
					</div>
					<text id="direccion"></text>
					<div class="col-lg-12 megin-bottom-30" id="street"></div>
				</div>


				<script>
					initMap();
					getGeo();
					validar();

				</script>
			</section>
			<!-- End Contact Section -->

		
		
	</xsl:template>


</xsl:stylesheet>