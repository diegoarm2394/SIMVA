<%@page import="DTO.FuncionariosDto"%>
<%@page import="DAO.UsuariosDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.FuncionarioDao"%>
<%@page import="DTO.FuncionarioRolDto"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="Modelo.Conexion"%>
<%@page import="java.sql.Connection"%>
<html><!-- InstanceBegin template="/Templates/Template.dwt" codeOutsideHTMLIsLocked="false" -->
    <head>
    	<meta charset="utf-8">
    	<!-- InstanceBeginEditable name="doctitle" -->
    	<title>Gestión de usuarios</title>
    	<!-- InstanceEndEditable -->
    	<link type="text/css" rel="stylesheet" href="../css/estilos.css">
    	<link type="text/css" rel="stylesheet" href="../css/font-awesome.css">
    	<link type="text/css" rel="stylesheet" href="../css/bootstrap.css">
    	<link rel="shortcut icon" href="../img/logos/logo.ico" type="image/x-icon">
    	<script type="text/javascript" src="../js/jquery.js"></script>
    	<script type="text/javascript" src="../js/jquery.validate.js"></script>
    	<script type="text/javascript" src="../js/additional-methods.js"></script>
    	<!-- InstanceBeginEditable name="head" -->
    	<link type="text/css" rel="stylesheet" href="../css/admin.css">
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
        	<img src="../img/logos/logo.png" alt="logo" width="110" height="110" />
    	</div>	
        <div id="texto">
        	<p id="h1"> SIMVA <br />  </p>
        	<p id="h2"> Sistema de Información de Control y Mantenimiento de Vehículos Automotores </p>
    	</div>
    	<div id="logo2" title="Logo Ejercito Nacional">
    		<img src="../img/logos/logo2.png" alt="logodos" width="110" height="110" />
    	</div>
        <!-- InstanceBeginEditable name="user" -->
        <div id="user" title="Esta conectado como Administrador"> Admin
        <!-- InstanceEndEditable -->
            <span class="fa fa-user fa-3x"> </span>
            <span class="trianguloar"></span>
        </div>
        
        <script type="text/javascript">
   /* Validacion para que unicamente deje ingresar Letras  */         
            
  function validarLetras(e) { // 1
    tecla = (document.all) ? e.keyCode : e.which; 
                if (tecla==8) return true; // backspace
		if (tecla==32) return true; // espacio
                if (tecla==110) return true; // punto
                if (tecla==190) return true; // punto
		if (e.ctrlKey && tecla==86) { return true;} //Ctrl v
		if (e.ctrlKey && tecla==67) { return true;} //Ctrl c
		if (e.ctrlKey && tecla==88) { return true;} //Ctrl x
                if (tecla==192) return true //Tecla ñ
		patron = /[a-zA-Z]/; //patron
 
		te = String.fromCharCode(tecla); 
		return patron.test(te); // prueba de patron
	}	
</script>
        
<script type="text/javascript">
    /* Validacion para que unicamente deje ingresar Numeros  */
	function validarNumeros(e) { // 1
		tecla = (document.all) ? e.keyCode : e.which; // 2
		if (tecla==8) return true; // backspace
		if (tecla==109) return true; // menos
                if (tecla==110) return true; // punto
		if (tecla==189) return true; // guion
                if (tecla==13) return true; // guion
		if (e.ctrlKey && tecla==86) { return true}; //Ctrl v
		if (e.ctrlKey && tecla==67) { return true}; //Ctrl c
		if (e.ctrlKey && tecla==88) { return true}; //Ctrl x
		if (tecla>=96 && tecla<=105) { return true;} //numpad
 
		patron = /[0-9]/; // patron
 
		te = String.fromCharCode(tecla); 
		return patron.test(te); // prueba
	}
</script>




    </header>
<%
    }else{response.sendRedirect("/ProyectoSimva/spanish/index-es.jsp");}
    %>
    <div id="espacio1"></div>
<!-- InstanceBeginEditable name="nav" -->
    	
    <nav>
        <a href="../administrador.jsp" title="Menu principal"><span class="fa fa-home fa-1x"></span>Inicio</a>
        <a href="usuarios.jsp" title="Gestión de usuarios"><span class="fa fa-users fa-1x"> Gestión de usuarios</a>
        <a href="menu2.jsp" title="Herramientas Administrativas"><span class="fa fa-gears fa-1x"> Herramientas Administrativas</a>
        <a href="asignacionPriv.jsp" title="Asignación de privilegios"><span class="fa fa-user fa-1x"> Asignación de privilegios</a>
        <a href="../index-es.jsp" title="Cerrar sección"><span class="fa fa-sign-in fa-1x"></span>Desconectar</a>
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
                    <li><a href="../administrador.jsp">Inicio</a></li>
                    <li class="active">Gestión de usuarios</li>   
                    </ol>
                    </div>  
                           
                        <%
                            FuncionarioRolDto  objDto = new FuncionarioRolDto();
                            UsuariosDao objDao = new UsuariosDao();
                            FuncionariosDto objDtoF = new FuncionariosDto();
                            objDto=objDao.ConsultarUno(Integer.parseInt(request.getParameter("pos")));
                            objDtoF = objDao.ConsultarUno2(Integer.parseInt(request.getParameter("pos")));
                        %> 

            <form id="formulario" action="../../ControlUsuarios">


                         <br>

			<h3>Digite la cédula para realizar la consulta:</h3>
            
                        <br>
                        <label for="cedula">Cédula</label>
                        <input type="text" name="cedula1" id="cedula1" class="inputad" value='<%=objDto.getNumeroDocumento()%>' placeholder="" required tabindex="1" onkeydown="return validarNumeros(event)" >
                        &nbsp;
                        
                        
			<input type="hidden" name="" class="" onkeydown="return validarLetras(event)"/>
                        <input type="hidden" name="num" class="num" onkeydown="return validarNumeros(event)"/>
                        
                        <br>
			<label for="nombre">Nombres:</label>
                        <input type="text" name="nombre" id="nombre" class="inputad" value='<%=objDtoF.getNombre1()+" "+objDtoF.getNombre2() %>'   tabindex="2" disabled="">
			<br>
			<label for="apellido">Apellidos:</label>
                        <input type="text" name="apellido" id="apellido" class="inputad" value='<%=objDtoF.getApellido1()+" "+objDtoF.getApellido2() %>' placeholder=""   tabindex="3" disabled="">             
                         <br>           
                        <label for="usuario">Nombre de usuario:</label>
                        <input type="text" name="usuario" id="usuario" class="inputad" value='<%=objDto.getUsuarioLogin()%>' placeholder="" required tabindex="4" onkeydown="return validarLetras(event)" />
			<br>
			<label for="rol">Rol:</label>
			<select list="rol" name="rol" class="inputad"  placeholder="" required tabindex="5" >
                            <option value=""></option>
                            <option value="100" <% if (100 == (Integer) objDto.getIdRol()){out.print("selected=true");} %>  >Administrador</option>
                            <option value="200" <% if (200 == (Integer) objDto.getIdRol()){out.print("selected=true");} %>  >Asignacion</option>
                            <option value="300" <% if (300 == (Integer) objDto.getIdRol()){out.print("selected=true");} %>  >Mantenimiento</option>
                            <option value="400" <% if (400 == (Integer) objDto.getIdRol()){out.print("selected=true");} %>  >Consulta</option>
                            <option value="500" <% if (500 == (Integer) objDto.getIdRol()){out.print("selected=true");} %>  >Conductor</option>  
                        </select>
			<br>
                        <label for="contrasenia">Contraseña:</label>
			<input type="password" name="contrasenia" id="contrasenia" class="inputad" value='<%=objDto.getContraseña()%>' placeholder="" tabindex="6" >
                        <br>
                        <label for="contraseniaC">Confirmar Contraseña:</label>
			<input type="password" name="contraseniaC" id="contraseniaC" class="inputad" value='<%=objDto.getContraseña()%>' placeholder="" tabindex="7" >			
                    <br>

                    <p style="text-align: center;">
                        
                        <input class="btn btn-success" id="botenv" type="submit" name="boton" value="Actualizar" >
                                
                        
                                
                                </div>
        </form> 
                    
                    
                        <form action="../../GestionUsuarios"><input class="btn btn-warning" id="botenv2" type="submit" name="boton" value="Consultar Todos" ></form>
                   
                     
                  
                <% 
                        if (request.getAttribute("Estado")!=null){
                         out.print(request.getAttribute("Estado"));
                        }
                %> 
                
   
  
  
     
            </div>
    </section>
    
    
    
			<script>
        $().ready(function() {
            $("#formulario").validate({ 
                rules:{
                    cedula1: {
                        required:true, 
                        minlength:6, 
                        maxlength:12
                    },
                    usuario:{
                        required: true,
                        minlength: 6,
                        maxlength: 15
                    },
                    rol:{
                        required: true
                    },
                    contrasenia:{
                        required: true,
                        minlength: 3,
                        maxlength: 15
                    },
                    contraseniaC:{
                        required: true,
                        minlength: 3,
                        equalTo:"#contrasenia"
                    }
                },
               messages:{
                                cedula1:{
                                    required:"Campo Requerido", 
                                    minlength:"Minimo 6 Caracteres", 
                                    maxlength:"Maximo 12 Caracteres"
                                },		
                                usuario:{
                                    required:"Campo requerido", 
                                    minlength:"Minimo 3 Caracteres", 
                                    maxlength:"Maximo 15 Caracteres"
                                },
                                rol:{
                                    required:"Campo requerido"
                                },
                                contrasenia:{ 
                                    required:"Campo requerido", 
                                    minlength:"Minimo 3 Caracteres", 
                                    maxlength:"Maximo 15 Caracteres"
                                },
                                contraseniaC:{ 
                                    required:"Campo requerido",
                                    minlength:"Minimo 3 Caracteres",
                                    equalTo:"la contraseña no coincide"
                                }
                        }
            });
        });
			
			</script>

 
  
</body>	<!-- InstanceEndEditable -->

	<div id="espacio3"></div>

    <foot>
	   <div class="pie">Versión 1.0 | COPYRIGHT   &copy;2014 SIMVA | Contáctenos: 3108549716 | E-mail: contactenos@simva.url.ph</div> 
    </foot>

	<div id="espacio4"></div>

<!-- InstanceEnd --></html>