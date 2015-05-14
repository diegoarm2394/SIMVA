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
        <link type="text/css" rel="stylesheet" href="../css/stilosConsulMant.css">
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
                    <li class="active">Consultar Fichas de mantenimiento</li>   
                    </ol>
                    </div>
     <br>
<h3> CONSULTA DE MANTENIMIENTO VEHICULAR PM-13</h3>

<div id="foto">
    

</div>


<form id="consultaMantenimiento">
<br>
<br>
<div id="bloqueUno">
<div>
<label for="campoPlaca">Placa:</label> 
<input name="placa" id="campoPlaca" placeholder="DHN123" required type="text" tabindex="1">
    <button type="button" class="lupa">
      <span class="glyphicon glyphicon-search"></span>
    </button>
</div>

<div>
<label for="campoPersona">Funcionario:</label>
<input name="persona"id="campoPersona" placeholder="JAIMES MALAGON LUDWING ANDRES" required type="text" disabled >
</div>

<div>
<label for="campoMantenimiento">Mantenimiento:</label>
<input name="Mantenimiento"id="campoMantenimiento" placeholder="001" required type="text" disabled >
</div>
</div>



<div id="bloqueDos">
<div>
<label for="tipoAutomotor">Tipo:</label> 
<input name="tipo" id="tipoAutomotor" placeholder="NPR" required type="text" disabled>
</div>

<div>
<label for="campoCedula">Cedula:</label>
<input name="cedula"id="campoCedula" placeholder="80876345" required type="text" disabled>
</div>

<div>
<label for="campoEstado">Estado:</label>
<input name="estado"id="campoEstado" placeholder="Pendiente" required type="text" disabled >
</div>
</div>	


<div id="bloqueTres">
<div>
<label for="campoGrado">Grado:</label>
<input name="Grado"id="campoGrado" placeholder="CAPITAN" required type="text" disabled>
</div>

<br>


<div>
<label for="campoFecha">Fecha:</label>
<input name="Fecha" id="campoFecha" placeholder="22/06/2014" required type="text" disabled>
</div>
</div>

<div id="botones">
<div id="nuevo">
    <button class="btn btn-primary" type="submit" tabindex="2">Nuevo</button>
</div>

<br>

<div id="salir">
    <button class="btn btn-primary" type="submit" tabindex="3">Salir</button>
</div>
</div>

</form> 
            </div>
        </section> 
  
  <script>

		$().ready(function() {
		
		$("#consultaMantenimiento").validate({//abre validete
		rules:{//abre rules
			placa:{//abre campo
				required: true,
				minlength: 6,
				maxlength: 10,
				alphanumeric: true
				},//cierra campo
		},//cierra rules 
		messages:{// abre mensajes
			placa:{//abre campos
				required:"Campo Requerido",
				minlength:"Minimo 6 Caracteres",
				maxlength:"Maximo 10 Caracteres",
				alphanumeric:"Debe ser Alfanumerico"
				},//cierra campo
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