<%@page import="DTO.FuncionarioRolDto"%>
<html><!-- InstanceBegin template="/Templates/Template.dwt" codeOutsideHTMLIsLocked="false" -->
    <head>
    	<meta charset="utf-8">
    	<!-- InstanceBeginEditable name="doctitle" -->
    	<title>SIMVA</title>
    	<!-- InstanceEndEditable -->
        <!-- InstanceBeginEditable name="head" -->
        <link type="text/css" rel="stylesheet" href="../css/estilos.css">
    	<link type="text/css" rel="stylesheet" href="../css/font-awesome.css">
    	<link type="text/css" rel="stylesheet" href="../css/bootstrap.css">
        <link type="text/css" rel="stylesheet" href="../css/estilosFormV.css">
    	<link rel="shortcut icon" href="../img/logos/logo.ico" type="image/x-icon">
    	<script type="text/javascript" src="../js/jquery.js"></script>
    	<script type="text/javascript" src="../js/jquery.validate.js"></script>
    	<script type="text/javascript" src="../js/additional-methods.js"></script>
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
        	<img src="../img/logos/logo.png" alt="logo" width="110" height="110" />
    	</div>	
        <div id="texto">
        	<p id="h1"> SIMVA <br />  </p>
        	<p id="h2"> Sistema de Informacion de Control y Mantenimiento de Vehiculos Automotores </p>
    	</div>
    	<div id="logo2">
    		<img src="../img/logos/logo2.png" alt="logodos" width="110" height="110" />
    	</div>
        <!-- InstanceBeginEditable name="user" -->
        <div id="user"> Asig
        <!-- InstanceEndEditable -->
            <span class="fa fa-user fa-3x"> </span>
            <span class="trianguloar"></span>
        </div>
    </header>
<%
    }else{response.sendRedirect("/ProyectoSimva/spanish/index-es.jsp");}
    %>
    <div id="espacio1"></div>
<!-- InstanceBeginEditable name="nav" -->
    	
    <nav>
        <a href="../asignacion.html" title="Menu principal"><span class="fa fa-home fa-1x"></span>Inicio</a>
        <a href="formFuncionario.jsp" title="Registro de Funcionarios"><span class="fa fa-users fa-1x"> Registro de Funcionarios</a>
        <a href="formVehiculo.jsp" title="Registro de vehículos"><span class="fa fa-car fa-1x"> Registro de vehículos</a>
        <a href="formAsignacion.jsp" title="Realizar asignación"><span class="fa fa-check-square-o fa-1x"> Realizar asignación</a>
        <a href="../index-es.html" title="Cerrar sección"><span class="fa fa-sign-out fa-1x"></span>Desconectar</a>
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
                    <li><a href="../Asignacion.html">Inicio</a></li>
                    <li class="active">Formulario Registro de Vehículos</li>   
                    </ol>
                    </div>

                <form class="formularioRegistroVehiculo" method="post" action="http://ejercito.mil.co">
    	
    	<h3>Formulario registro de Vehículos</h3>
        
           
        <div class="cajas" id="cajaUno">      
        
        <label for="placa">Placa:</label>
        <input name="placa" id="placa" type="text" placeholder="Ej. MPW-734" tabindex="1" required minlength="5" maxlength="8"> 
        
        <label for="sigla">Sigla:</label>
        <input name="sigla" id="sigla" type="text" placeholder="Ej. EJC-L13-97-097" tabindex="2" minlength="5" maxlength="12">
        
        <label for="tipoVehiculo">Tipo:</label>
        <select class="listas" id="tipoVehiculo" tabindex="3" required>
        	<option disabled>Seleccione un tipo</option>
        	<option>Ambulancia</option>
        	<option>Automovil</option>
            <option>Avion</option>
            <option>Bus</option>
            <option>Buseta</option>
            <option>Camiones 2.5 ton Tácticos</option>
            <option>Camiones 6 a 15 Ton admin.</option>
            <option>Camioneta</option>
            <option>Camperos</option>
            <option>Carrotalleres</option>
            <option>Carrotanques de agua</option>
            <option>Carrotanques para combustible</option>
            <option>Coches fúnebres</option>
            <option>Grúas</option>
            <option>Helicópteros</option>
            <option>Montacarga</option>
            <option>Motocicletas</option>
            <option>Remolque</option>
            <option>Tráiler</option>          
            <option>Tractomula</option>
            <option>Tractores</option>
            <option>Vehículo Blindado</option>
            <option>Vehículo de bomberos</option>
            <option>Volquetas</option>
        </select> 
         
         <label for="marcaVehiculo">Marca:</label>
         <select class="listas" id="marcaVehiculo" tabindex="4" required>
         	<option disabled>Seleccione la marca</option>
        	<option>Audi</option>
            <option>Bmw</option>
            <option>Chevrolet</option>
            <option>Dodge</option>
            <option>Ford</option>
            <option>Honda</option>
            <option>JAC</option>
            <option>Kia</option>
            <option>Land Rover</option>
            <option>Mazda</option>
            <option>Nissan</option>
            <option>Peugeot</option>
            <option>Renault</option>
            <option>Ssangyong</option>
            <option>Suzuki</option>
            <option>Toyota</option>
            <option>Volkswagen</option>
            <option>Zotye</option>
			
         </select> 
         
		<label for="modeloVehiculo">Modelo:</label>
        <input name="modeloVehiculo" id="modeloVehiculo" type="text" placeholder="Ej. 2014" tabindex="5" minlength="4" maxlength="10">



         <label for="colorVehiculo">Color:</label>
         <select class="listas" id="colorVehiculo" tabindex="6" required>
         	<option disabled>Seleccione el color</option> 
        	<option>Verde oliva</option>
			<option>Negro</option>
            <option>Blanco</option>
            <option>Rojo</option>
            <option>Camuflado</option>
          </select> 
              
           
        <label for="vin">VIN:</label>
        <input name="vin" id="vin" type="text" placeholder="Ej. KPTC0B16SDP082986" tabindex="7" required minlength="10" maxlength="18">
        
        <label for="motor">Motor:</label>
        <input name="motor" id="motor" type="text" placeholder="Ej. 1619511001914SE104" tabindex="8" required minlength="10" maxlength="18">
        
                
        </div>
        
        <div class="cajas" id="cajados">
        
        <label for="combustible">Combustible:</label>
         <select class="listas" id="combustible" tabindex="10" required>
         	<option disabled>Seleccione</option>
        	<option>AvGas</option>
            <option>Diesel</option>
            <option>Gas</option>
			<option>Gasolina</option>
            <option>Queroseno</option>
           
          </select> 
                                    
		<label for="cilindraje">Cilindraje:</label>
        <input name="cilindraje" id="cilindraje" type="text" placeholder= "Ej. 2300" tabindex="11" required minlength="5" maxlength="10">
        
        <label for="licenciaTransito">Licencia de Transito:</label>
        <input name="licenciaTransito" id="licenciaTransito" type="text" placeholder= "Ej. 10004280106" tabindex="12" required minlength="5" maxlength="10">
        
		<label for="seguroObligatorio">Seguro Obligatorio:</label>
        <input name="seguroObligatorio" id="seguroObligatorio" type="text" placeholder= "Ej. 10004280106" tabindex="13" required minlength="5" maxlength="10">
        
         <label for="vencimientoSeguro">Fecha de Vencimiento</label>
        <input name="vencimientoSeguro" class="fechas" id="vencimientoSeguro" type="date" tabindex="14" required>

		<label for="seguroResponsabilidadCivil">Seguro de Responsabilidad Civil:</label>
        <input name="seguroResponsabilidadCivil" id="seguroResponsabilidadCivil" type="text" placeholder= "Ej. 10004280106" tabindex="15" required minlength="5" maxlength="10">
        
         <label for="vencimientoResponsabiliad">Fecha de Vencimiento</label>
        <input name="vencimientoResponsabiliad" class="fechas" id="vencimientoResponsabiliad" type="date" tabindex="16" required>

        </div>
        
      <div class="cajas" id="cajaTres">
        
        <label for="revisionTecnomecanica">Revision Tecnomecanica:</label>
        <input name="revisionTecnomecanica" id="revisionTecnomecanica" type="text" placeholder= "Ej. 1100100096612385" tabindex="17" required minlength:"5" maxlength="15">
        
            
        <label for="vencimientoTecnomecanica">Fecha Vencimiento</label>
        <input name="vencimientoTecnomecanica" class="fechas" id="vencimientoTecnomecanica" type="date" tabindex="18" required>
        
        
        <label for="empleoVehiculo">Empleo:</label>
         <select class="listas" id="empleoVehiculo" tabindex="19" required>
        	<option disabled> Seleccione</option>
            <option>Asignado</option>
            <option>De utilidad general</option>
            <option>Recorridos colectivos</option>
			<option>Tacticos</option>
                      
          </select> 
        
        
        <label for="estadoVehiculo">Estado:</label>
         <select class="listas" id="estadoVehiculo"  tabindex="20" required>
         	<option disabled>Seleccione</option>
        	<option>Activo</option>
            <option>Comision</option>
            <option>En mantenimiento</option>
			<option>Fuera de servicio</option>
            <option>Pendiente Baja</option>
           
          </select> 
        
        <label for="fechaEstado">Fecha del Estado</label>
        <input name="fechaEstado" class="fechas" id="fechaEstado" type="date" tabindex="21" required>
        <br>
        <div id="foto5"> 
        	<img src="../img/Vehiculo.jpg" alt="foto" width="200px" height="120px">
        </div>
        <button class="btn btn-primary" type="submit">Buscar Fotografía</button>
        <button class="btn btn-primary" type="submit">Enviar</button>
		</div>
        
            
        </form>
   
	</section>
	<script>
	$().ready(function(){
		$(".formularioRegistroVehiculo").validate({
			rules:{
				
				placa:{
					required: true,
					minlength: 6,
					maxlength: 8
					},
				sigla:{
					minlength: 6,
					maxlength: 14
					},
				tipoVehiculo:{
					required: true,
					maxlength: 10
					},
				marcaVehiculo:{
					required: true,
					maxlength: 10
					},
				modeloVehiculo:{
					maxlength:14
					},
				colorVehiculo:{
					required: true,
					maxlength:20
					},
				vin:{
					required:true,
					maxlength: 18
					},
				combustible:{
					required: true,
					maxlength: 20
					},
				cilindraje:{
					required: true,
					maxlength: 10
					},
				licenciaTransito:{
					required: true,
					maxlength: 10
					},
				seguroObligatorio:{
					required: true,
					maxlength: 10
					},
				vencimientoSeguro:{
					required: true,
					maxlength: 10
					},
				seguroResponsabilidadCivil:{
					required: true,
					maxlength: 10
					},
				vencimientoResponsabiliad:{
					required: true,
					maxlength: 10
					},
				revisionTecnomecanica:{
					required: true,
					maxlength: 15
					},
				vencimientoTecnomecanica:{
					required: true,
					maxlength: 10					
					},
				empleoVehiculo:{
					reuired: true,
					maxlength:20
					},
				estadoVehiculo:{
					required: true,
					maxlength: 20
					},
				fechaEstado:{
					required: true,
					maxlength: 10
					},
			},
			
			messages:{
				placa:{
					required: "Campo requerido",
					minlength: "Minimo {0} caracteres",
					maxlength: "Maximo {0} caracteres"
					},
				sigla:{
					minlength: "Minimo {0} caracteres",
					maxlength: "Maximo {0} caracteres"
					},
				tipoVehiculo:{
					required: "Campo requerido",
					maxlength: "Maximo {0} caracteres"
					},
				marcaVehiculo:{
					required: "Campo requerido",
					maxlength: "Maximo {0} caracteres"
					},
				modeloVehiculo:{
					maxlength: "Maximo {0} caracteres"
					},
				colorVehiculo:{
					required: "Campo requerido",
					maxlength: "Maximo {0} caracteres"
					},
				vin:{
					required: "Campo requerido",
					maxlength: "Maximo {0} caracteres"
					},
				combustible:{
					required: "Campo requerido",
					maxlength: "Maximo {0} caracteres"
					},
				cilindraje:{
					required: "Campo requerido",
					maxlength: "Maximo {0} caracteres"
					},
				licenciaTransito:{
					required: "Campo requerido",
					maxlength: "Maximo {0} caracteres"
					},
				seguroObligatorio:{
					required: "Campo requerido",
					maxlength: "Maximo {0} caracteres"
					},
				vencimientoSeguro:{
					required: "Campo requerido",
					maxlength: "Maximo {0} caracteres"
					},
				seguroResponsabilidadCivil:{
					required: "Campo requerido",
					maxlength: "Maximo {0} caracteres"
					},
				vencimientoResponsabiliad:{
					required: "Campo requerido",
					maxlength: "Maximo {0} caracteres"
					},
				revisionTecnomecanica:{
					required: "Campo requerido",
					maxlength: "Maximo {0} caracteres"
					},
				vencimientoTecnomecanica:{
					required: "Campo requerido",
					maxlength: "Maximo {0} caracteres"
					},
				empleoVehiculo:{
					reuired: "Campo requerido",
					maxlength: "Maximo {0} caracteres"
					},
				estadoVehiculo:{
					required: "Campo requerido",
					maxlength: "Maximo {0} caracteres"
					},
				fechaEstado:{
					required: "Campo requerido",
					maxlength: "Maximo {0} caracteres"
					},
				}	
			});
		});
	</script>

        <!-- InstanceEndEditable -->

	<div id="espacio3"></div>

    <foot>
	   <div class="pie">Versión 1.0 | COPYRIGHT   &copy;2014 SIMVA | Contáctenos: 3108549716 | E-mail: contactenos@simva.url.ph</div> 
    </foot>

	<div id="espacio4"></div>

<!-- InstanceEnd --></html>