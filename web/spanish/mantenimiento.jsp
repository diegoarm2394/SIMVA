<%@page import="DTO.FuncionarioRolDto"%>
<html><!-- InstanceBegin template="/Templates/Template.dwt" codeOutsideHTMLIsLocked="false" -->
    <head>
    	<meta charset="utf-8">
    	<!-- InstanceBeginEditable name="doctitle" -->
    	<title>SIMVA -- Mantenimiento</title>
    	<!-- InstanceEndEditable -->
        <!-- InstanceBeginEditable name="head" -->
        <link type="text/css" rel="stylesheet" href="css/estilos.css">
        <link type="text/css" rel="stylesheet" href="css/font-awesome.css">
        <link type="text/css" rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/demo.css">
        <link rel="stylesheet" type="text/css" href="css/common.css">
        <link rel="stylesheet" type="text/css" href="css/style7.3.css">
        <link rel="shortcut icon" href="img/logos/logo.ico" type="image/x-icon">
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery.validate.js"></script>
        <script type="text/javascript" src="js/additional-methods.js"></script>
    	<!-- InstanceEndEditable -->
        <%
            HttpSession miSession = request.getSession(); 
            if(miSession.getAttribute("usuario")!=null){
                FuncionarioRolDto usuario = new FuncionarioRolDto();

                usuario = (FuncionarioRolDto)miSession.getAttribute("usuario");
                String nomUsuario = usuario.getUsuarioLogin();
        %>
    </head>
    <header>
    	<div id="logo">
        	<img src="img/logos/logo.png" alt="logo" width="110" height="110" />
    	</div>	
        <div id="texto">
        	<p id="h1"> SIMVA <br />  </p>
        	<p id="h2"> Sistema de Informacion de Control y Mantenimiento de Vehiculos Automotores </p>
    	</div>
    	<div id="logo2">
    		<img src="img/logos/logo2.png" alt="logodos" width="110" height="110" />
    	</div>
        <!-- InstanceBeginEditable name="user" -->
        <div id="user" title="Esta conectado como Administrador señor <%=nomUsuario%>"> Mant
        <!-- InstanceEndEditable -->
            <a href="#"><span class="fa fa-user fa-3x"> </span></a>
            <span class="trianguloar"></span>
        </div>
    </header>
    <%
    }else{response.sendRedirect("/ProyectoSimva/spanish/index-es.jsp");}
    %>
    <div id="espacio1"></div>
<!-- InstanceBeginEditable name="nav" -->
    	
    <nav>	
        <a href="mantenimiento.jsp"><span class="fa fa-home fa-1x"></span>Inicio</a>
        <a href="mantenimiento/consulMant.jsp" title="Consultar Fichas de Mantenimientos"><span class="fa fa-search fa-1x"></span>Consultar Ficha de Mant.</a>
        <a href="mantenimiento/crearMant.jsp" title="Editar Fichas de Mantenimientos"><span class="fa fa-wrench fa-1x"></span>Crear Ficha de Mant.</a>
        <a href="mantenimiento/hisMan.jsp" title="Consultar Historial de Mantenimientos"><span class="fa fa-calendar fa-1x"></span>Historial de Mant.</a> 
        <a href="index-es.jsp" title="Cerrar secciÃ³n"><span class="fa fa-sign-out fa-1x"></span>Desconectar</a>
    </nav>
<!-- InstanceEndEditable -->

    <div id="espacio2"></div>
<!-- InstanceBeginEditable name="Body" -->
    <body>
        <section>
    		<div id="area">
         
                <div id="miga">
                    <br>
                    <ol class="breadcrumb">
                    <li class="active">Inicio</li>   
                    </ol>
                    </div>

                    <section class="main">
                <BR>
                <p> Mantenimiento </p>
                <h2> Seleccione una opciÃ³n: </h2>
            
                <ul class="ch-grid">
                    <li>
                        <div class="ch-item">               
                            <div class="ch-info">
                                <div class="ch-info-front ch-img-1"></div>
                                <div class="ch-info-back">
                                   <a href="mantenimiento/consulMant.jsp"> <h3>Consulta F. de<br>Mantenimiento</h3> </a>
                                    <p> </p>
                                </div>  
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="ch-item">
                            <div class="ch-info">
                                <div class="ch-info-front ch-img-2"></div>
                                <div class="ch-info-back">
                                   <a href="mantenimiento/crearMant.jsp"> <h3>Crear F.<br>Mantenimiento</h3></a>
                                    <p> </p>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="ch-item">
                            <div class="ch-info">
                                <div class="ch-info-front ch-img-3"></div>
                                <div class="ch-info-back">
                                    <a href="mantenimiento/hisMan.jsp"><h3>historial de<br>Mantenimiento</h3></a>
                                    <p> </p>
                                </div>
                            </div>
                        </div>
                    </li>
                    

                </ul>
                
            </section>
     

            </div>
        </section> 
  
    </body>
        <!-- InstanceEndEditable -->

	<div id="espacio3"></div>

    <foot>
	   <div class="pie">Versión 1.0 | COPYRIGHT   &copy;2014 SIMVA | Contáctenos: 3108549716 | E-mail: contactenos@simva.url.ph</div> 
    </foot>

	<div id="espacio4"></div>

<!-- InstanceEnd --></html>