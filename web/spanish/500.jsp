<%@page import="DTO.FuncionarioRolDto"%>
<html><!-- InstanceBegin template="/Templates/Template.dwt" codeOutsideHTMLIsLocked="false" -->
    <head>
    	<META HTTP-EQUIV="REFRESH" CONTENT="5;URL=/ProyectoSimva/spanish/index-es.jsp"/> 
	<title>500</title>
    	<!-- InstanceEndEditable -->
        <!-- InstanceBeginEditable name="head" -->
        <link type="text/css" rel="stylesheet" href="css/estilos.css">
        <link type="text/css" rel="stylesheet" href="css/font-awesome.css">
        <link type="text/css" rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/demo.css">
        <link rel="stylesheet" type="text/css" href="css/common.css">
        <link rel="stylesheet" type="text/css" href="css/style7.4.css">
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
        <div id="user" title="Esta conectado como Administrador señor <%=nomUsuario%>"> Asig
        <!-- InstanceEndEditable -->
            <a href="Login.jsp"><span class="fa fa-user fa-3x"> </span></a>
            <span class="trianguloar"></span>
        </div>
    </header>
    <%
    }else{response.sendRedirect("/ProyectoSimva/spanish/index-es.jsp");}
    %>
    <div id="espacio1"></div>


    <div id="espacio2"></div>
<!-- InstanceBeginEditable name="Body" -->
    <body>
        <section>
    		<div id="area">
                
                    <img src="img/500-4.png" id="500" width="900" height="500" alt="error404"/>
                    
                </div>
    </section> 
  
</body><!-- InstanceEndEditable -->

	<div id="espacio3"></div>

    <foot>
	   <div class="pie">Versión 5.0 | COPYRIGHT   &copy;2014 SIMVA | Contáctenos: 3108549716 | E-mail: contactenos@simva.url.ph</div> 
    </foot>

	<div id="espacio4"></div>

<!-- InstanceEnd --></html>x-icon