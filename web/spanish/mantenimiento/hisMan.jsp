<html><!-- InstanceBegin template="/Templates/Template.dwt" codeOutsideHTMLIsLocked="false" -->
    <head>
    	<meta charset="utf-8">
    	<!-- InstanceBeginEditable name="doctitle" -->
    	<title>SIMVA</title>
    	<!-- InstanceEndEditable -->
    	<link type="text/css" rel="stylesheet" href="../css/estilos.css">
    	<link type="text/css" rel="stylesheet" href="../css/font-awesome.css">
    	<link type="text/css" rel="stylesheet" href="../css/bootstrap.css">
    	<link rel="shortcut icon" href="../img/logos/logo.ico" type="image/x-icon">
    	<script type="text/javascript" src="../js/jquery.js"></script>
    	<script type="text/javascript" src="../js/jquery.validate.js"></script>
    	<script type="text/javascript" src="../js/additional-methods.js"></script>
    	<!-- InstanceBeginEditable name="head" -->
        <link type="text/css" rel="stylesheet" href="../css/stiloshisMan.css">
    	<!-- InstanceEndEditable -->
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
        <div id="user"> Mant
        <!-- InstanceEndEditable -->
            <span class="fa fa-user fa-3x"> </span>
            <span class="trianguloar"></span>
        </div>
    </header>

    <div id="espacio1"></div>
<!-- InstanceBeginEditable name="nav" -->
    	
    <nav>   
        <a href="../mantenimiento.jsp"><span class="fa fa-home fa-1x"></span>Inicio</a>
        <a href="consulMant.jsp" title="Consultar Fichas de Mantenimientos"><span class="fa fa-search fa-1x"></span>Consultar Ficha de Mant.</a>
        <a href="editMant.jsp" title="Editar Fichas de Mantenimientos"><span class="fa fa-wrench fa-1x"></span>Editar Ficha de Mant.</a>
        <a href="hisMan.jsp" title="Consultar Historial de Mantenimientos"><span class="fa fa-calendar fa-1x"></span>Consultar Historial de Mant.</a>
        <a href="../index-es.jsp" title="Cerrar sección"><span class="fa fa-sign-out fa-1x"></span>Desconectar</a>
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
                    <li><a href="../mantenimiento.jsp">Inicio</a></li>
                    <li class="active">Historial de Mantenimiento</li>   
                    </ol>
                    </div>
     <br>
<h3> HISTORIAL MANTENIMIENTO AUTOMOTRIZ PM-13</h3>

<div id="foto">
<img src="../img/man2.jpg"  width="130" height="130" />
</div>


<form id="historialMantenimiento">
<br>
<br>

<div id="bloqueUno">
<div class="lupas">
<label for="campoPlaca">Placa:</label> 
<input name="placa" id="campoPlaca" placeholder="DHN123" required type="text" tabindex="1">
    <button type="button" class="lupa">
      <span class="glyphicon glyphicon-search"></span>
    </button>

<label for="campoFechaI">Fecha Inicio:</label>
<input class="fecha" name="FechaI" id="campoFechaI" placeholder="22/06/2014" required type="date" tabindex="8">

<label for="campoFechaF">Fecha Final:</label>
<input class="fecha" name="FechaF" id="campoFechaF" placeholder="22/06/2014" required type="date" tabindex="10">
</div>
<br>
<br>
<div class="lupas">
<label for="campoCedula">Cedula:</label>
<input name="cedula"id="campoCedula" placeholder="80876345" required type="text" tabindex="2">
<button type="button" class="lupa">
      <span class="glyphicon glyphicon-search"></span>
    </button>
</div>

</div>



<div id="bloqueDos">

<label for="campoPersona">Funcionario:</label>
<input name="persona"id="campoPersona" placeholder="JAIMES MALAGON LUDWING ANDRES" required type="text" tabindex="3" >

<label for="campoMantenimiento">Mantenimiento:</label>
<input name="Mantenimiento"id="campoMantenimiento" placeholder="001" required type="text"  tabindex="5">

<label for="tipoAutomotor">Tipo:</label> 
<select class="seleccion" name="tipo" id="tipoAutomotor" placeholder="NPR" required type="text" tabindex="7">
	<option>Ambulancia</option>
    <option>Automovil</option>
    <option>Avion</option>
    <option>Bus</option>
    <option>Buseta</option>
    <option>Camion 2.5 ton Tacticos</option>
    <option>Camion 6 a 15 ton Admin</option>
    <option>Camioneta</option>
    <option>Campero</option>
	<option>Carrotaller</option>
    <option>Carrotanque de agua</option>
    <option>Carrotanque para combusti</option>
    <option>Coche funebre</option>
    <option>Grua</option>
    <option>Helicoptero</option>
    <option>Montacarga</option>
    <option>Motocicleta</option>
    <option>Remolque</option>
    <option>Trailer</option>
    <option>Tractomula</option>
    <option>Tractor</option>
    <option>Vehiculo Blindado</option>
    <option>Vehiculo de Bomberos</option>
    <option>Volqueta</option>
</select>


</div>	

<div id="bloqueTres">

<label for="campoGrado">Grado:</label>
<select name="Grado" id="campoGrado" placeholder="CAPITAN" required type="text" tabindex="4">
    <option>General</option>
    <option>Mayor General</option>
    <option>Brigadier General</option>
    <option>Coronel</option>
    <option>Teniente Coronel</option>
    <option>Mayor</option>
    <option>Capitán</option>
    <option>Teniente</option>
    <option>Subteniente</option>
    <option>Sargento Mayor de Comando Conjunto</option>
    <option>Sargento Mayor de Comando</option>
    <option>Sargento Mayor</option>
    <option>Sargento Primero</option>
    <option>Sargento Viceprimero</option>
    <option>Sargento Segundo</option>
    <option>Cabo Primero</option>
    <option>Cabo Segundo</option>
    <option>Cabo Tercero</option>
    <option>Soldado Profesional</option>
    <option>Soldado Bachiller</option>
    <option>Soldado Bachiller</option>
    </select>
<br>

<label for="campoEstado">Estado:</label>
<select class="seleccion" name="estado"id="campoEstado" placeholder="Pendiente" required type="text" tabindex="6" >
	<option>Iniciado</option>
    <option>terminado</option>
    </select>
<br>
<br>
<br>
</div>

<div id="botones">
<div id="actualizar">
    <button class="btn btn-primary" type="submit" tabindex="11">Actualizar</button>
</div>

<br>

<div id="nuevo">
    <button class="btn btn-primary" type="submit" tabindex="12">Nuevo</button>
</div>
<br>
<div id="salir">
    <button class="btn btn-primary" type="submit" tabindex="12">Salir</button>
</div>

</div>

</form> 
            </div>
        </section> 
  
  <script>

		$().ready(function() {
		
		$("#editarMantenimiento").validate({//abre validete
		rules:{//abre rules
			placa:{//abre campo
				required: true,
				minlength: 6,
				maxlength: 10,
				alphanumeric: true
				},//cierra campo
			cedula:{//abre campo
				required: true,
				minlength: 6,
				maxlength: 10,
				},//cierra campo
			persona:{//abre campo
				required: true,
				minlength: 5,
				maxlength: 40,
				lettersonly: true,
				},//cierre campo
			Mantenimiento:{
				required: true,
				digits:true,
				minlength: 3,
				maxlength: 5,
			},
			tipo:{
				required:
				true,
			},
			FechaI:{
				required: true,
			},
			Grado:{
				required: true,
			},
			FechaF:{
				required: true,
			},
		},//cierra rules 
		messages:{// abre mensajes
			placa:{//abre campos
				required:"Campo Requerido",
				minlength:"Minimo {0} Caracteres",
				maxlength:"Maximo {0} Caracteres",
				alphanumeric:"Debe ser Alfanumerico",
				},//cierra campo
			cedula:{//abre campos
				required: "Campo Requerido",
				minlength: "Minimo {0} Caracteres",
				maxlength: "Maximo {0} Caracteres",
				},	//cierra campo
			persona:{//abre campo
				required: "Campo Requerido",
				minlength: "Minimo {0} Caracteres",
				maxlength: "Maximo {0} Caracteres",
				lettersonly: "Solo Letras",
				},//cierre campo
			Mantenimiento:{
				required: "Campo requerido",
				digits:"Solo Numeros",
				minlength: "Minimo {0} Caracteres",
				maxlength: "Maximo {0} Caracteres",
			},
			tipo:{
				required:"Seleccione un Tipo",
			},
			FechaI:{
				required: "Campo Requerido",
			},
			Grado:{
				required: "Campo Requerido",
			},
			FechaF:{
				required: "Campo Requerido",
			},		
			
		}//cierra mensajes
		
	});	 //cierra validete
	}); // cierra funcion
</script>
  
    </body>
        <!-- InstanceEndEditable -->

	<div id="espacio3"></div>

    <foot>
	   <div class="pie">Versión 1.0 | COPYRIGHT   &copy;2014 SIMVA | Contáctenos: 3108549716 | E-mail: contactenos@simva.url.ph</div> 
    </foot>

	<div id="espacio4"></div>

<!-- InstanceEnd --></html>