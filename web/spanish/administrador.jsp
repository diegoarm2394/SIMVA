<%@page import="DTO.FuncionarioRolDto"%>

<html><!-- InstanceBegin template="/Templates/Template.dwt" codeOutsideHTMLIsLocked="false" -->
   
<%//response.setHeader("Cacahe-Control", "no-store");%>
    <head>
        <meta http-equiv="Expires" content="0">
        <meta http-equiv="Last-Modified" content="0">
        <meta http-equiv="Cache-Control" content="no-cache, mustrevalidate">
        <meta http-equiv="Pragma" content="no-cache">
        <META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
        <META HTTP-EQUIV="Expires" CONTENT="-1">
    	<meta charset="utf-8">
    	<!-- InstanceBeginEditable name="doctitle" -->
    	<title>Menu Principal</title>
    	<!-- InstanceEndEditable -->
        <!-- InstanceBeginEditable name="head" -->
        <link type="text/css" rel="stylesheet" href="css/estilos.css">
        <link type="text/css" rel="stylesheet" href="css/font-awesome.css">
        <link type="text/css" rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/demo.css">
        <link rel="stylesheet" type="text/css" href="css/common.css">
        <link rel="stylesheet" type="text/css" href="css/style7.css">
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
    	<div id="logo" title="Logo SIMVA">
        	<img src="img/logos/logo.png" alt="logo" width="110" height="110" />
    	</div>	
        <div id="texto">
        	<p id="h1"> SIMVA <br />  </p>
        	<p id="h2"> Sistema de información de Control y Mantenimiento de Vehículos Automotores </p>
    	</div>
    	<div id="logo2" title="Logo Ejercito Nacional">
    		<img src="img/logos/logo2.png" alt="logodos" width="110" height="110" />
    	</div>
        <!-- InstanceBeginEditable name="user" -->
        <div  id="user" title="Esta conectado como Administrador señor <%=nomUsuario%>"> Admin 
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
        <a href="administrador.jsp" title="Menu principal"><span class="fa fa-home fa-1x"></span>Inicio</a>
        <a href="administrador/user.jsp" title="Gestión de usuarios"><span class="fa fa-users fa-1x"> Ingresar Usuario</a>
        <a href="administrador/usuarios_1.jsp" title="Herramientas Administrativas"><span class="fa fa-gears fa-1x"> Consultar Todos los Usuarios</a>
        <a href="administrador/usuario.jsp" title="Asignación de privilegios"><span class="fa fa-user fa-1x"> Consultar Usuario</a>
        <a href="index-es.jsp" title="Cerrar sección"><span class="fa fa-sign-in fa-1x"></span>Desconectar</a>
    </nav>
<!-- InstanceEndEditable -->
    


    <div id="espacio2"></div>
<!-- InstanceBeginEditable name="Body" -->

    


    <body >
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
                <p> Administrador </p>
                <h2> Seleccione una opción: </h2>
            
                <ul class="ch-grid">
                    <li>
                        <div class="ch-item">               
                            <div class="ch-info">
                                <div class="ch-info-front ch-img-1"></div>
                                <div class="ch-info-back">
                                    <h3><p><a href="administrador/user.jsp">Gestión de<br>usuarios</a></p></h3> 
                                </div>  
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="ch-item">
                            <div class="ch-info">
                                <div class="ch-info-front ch-img-2"></div>
                                <div class="ch-info-back">
                                    <h3><p><a href="administrador/usuarios_1.jsp">Contultar<br>T. Usuarios</a></p></h3> 
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="ch-item">
                            <div class="ch-info">
                                <div class="ch-info-front ch-img-3"></div>
                                <div class="ch-info-back">
                                    <h3><p> <a href="administrador/usuario.jsp">Consultar<br>Usuario</a></p></h3>   
                                </div>
                            </div>
                        </div>
                    </li>

                </ul>
                
            </section>
     
            </div>
    </section> 
  
</body>	<!-- InstanceEndEditable -->

	<div id="espacio3"></div>

    <foot>
	   <div class="pie">Versión 1.0 | COPYRIGHT   &copy;2014 SIMVA | Contáctenos: 3108549716 | E-mail: contactenos@simva.url.ph</div> 
    </foot>

	<div id="espacio4"></div>

<!-- InstanceEnd --></html>

