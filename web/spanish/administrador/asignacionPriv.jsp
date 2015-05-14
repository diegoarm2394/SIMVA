<html><!-- InstanceBegin template="/Templates/Template.dwt" codeOutsideHTMLIsLocked="false" -->
    <head>
    	<meta charset="utf-8">
    	<!-- InstanceBeginEditable name="doctitle" -->
    	<title>Asignacion de Privilegios</title>
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
        <div id="user"> Admin
        <!-- InstanceEndEditable -->
            <span class="fa fa-user fa-3x"> </span>
            <span class="trianguloar"></span>
        </div>
    </header>

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

   <section>
  
    		        
<form id="formatoa">

<div id="area">

                    <div id="miga">
                    <br>
                    <ol class="breadcrumb">
                    <li><a href="../administrador.jsp">Inicio</a></li>
                    
                    <li class="active">Asignación de privilegios</li>   
                    </ol>
                    </div>


<strong>
<br />
<br />
<br />
<br />

   <label for="Cedula">Cedula</label>                
			<input type="text" name="Cedula" id="Cedula" placeholder="0000000000" required tabindex="3">
            <button type="submit" class="btn btn-success3 boton">Buscar</button>
             <button type="submit" class="btn btn-success3 boton">Editar</button>
            </strong></p>
            <strong>          
			<label for="Nombre">Nombre:</label>
			<input type="text" name="Nombre" id="Nombre" placeholder="Edwin" required tabindex="1">
            
            
            
            
            <label id="perfill" for="Perfil">Perfil:</label>
            <select id="perfil" placeholder="perfil" required>
            <option>Selecione Perfil</option>
            <option>Administrador</option>
            <option>Asignacion</option>
            <option>Mantenimiento</option>
            <option>Consulta</option>
            </select>

               
<p/>
            </strong></p>
            
            <strong>
			
			<label for="Apellido">Apellido:</label>
			<input type="text" name="Apellido" id="Apellido" placeholder="Carlosama" required tabindex="2">
              <button type="submit" class="btn btn-success3 boton">Guardar</button>
            
            </strong></p>
                                   
			<br>
            
             <p style="text-align: center;"><strong>
              <button type="submit" class="btn btn-success1 boton" id="botsal5">Salir</button>
            </strong></p>
         </div>
</form>
</section>


			<script>
$().ready(function(){
	$("#formatoa").validate({
		rules:{
			Nombre:{
				required:true,
				minlength:3,
				maxlength:15},
			Cedula:{
				required:true,
				minlength:8,
				maxlength:12},
				
			Apellido:{
				required:true,
				minlength:3,
				maxlength:15},
					
				
		},messages:{
			Nombre:{required:"Campo requerido",
					minlength:"Minimo 3 Caracteres",
					maxlength:"Maximo 15 Caracteres"},
					
			Cedula:{required:"Campo Requerido",
			        minlength:"Minimo 8 Caracteres",
					maxlength:"Maximo 12 Caracteres"
			},
			Apellido:{required:"Campo requerido",
					minlength:"Minimo 3 Caracteres",
					maxlength:"Maximo 15 Caracteres"},
			
			
		}
			
			
				
			});
			});
			
			</script>

</section>








    
    
		
 
  
</body>	<!-- InstanceEndEditable -->

	<div id="espacio3"></div>

    <foot>
	   <div class="pie">Versión 1.0 | COPYRIGHT   &copy;2014 SIMVA | Contáctenos: 3108549716 | E-mail: contactenos@simva.url.ph</div> 
    </foot>

	<div id="espacio4"></div>

<!-- InstanceEnd --></html>