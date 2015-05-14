
<%@page import="DAO.FuncionariosDao"%>
<%@page import="DTO.CategoriasDto"%>
<%@page import="DAO.CategoriasDao"%>
<%@page import="DTO.RhDto"%>
<%@page import="DAO.RhDao"%>
<%@page import="DTO.GradosDto"%>
<%@page import="DAO.GradosDao"%>
<%@page import="DTO.CiudadesDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.CiudadesDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DTO.FuncionariosDto"%>
<html><!-- InstanceBegin template="/Templates/Template.dwt" codeOutsideHTMLIsLocked="false" -->
    <head>
        <meta charset="utf-8">
        <!-- InstanceBeginEditable name="doctitle" -->
        <title>Registro de Funcionario</title>
        <!-- InstanceEndEditable -->
        <!-- InstanceBeginEditable name="head" -->
        <link type="text/css" rel="stylesheet" href="../css/estilos.css">
        <link type="text/css" rel="stylesheet" href="../css/font-awesome.css">
        <link type="text/css" rel="stylesheet" href="../css/bootstrap.css">
        <link rel="shortcut icon" href="../img/logos/logo.ico" type="image/x-icon">
        <script type="text/javascript" src="../js/jquery.js"></script>
        <script type="text/javascript" src="../js/jquery.validate.js"></script>
        <script type="text/javascript" src="../js/additional-methods.js"></script>
        <link type="text/css" rel="stylesheet" href="../css/estilosFormF.css">
        <!-- InstanceEndEditable -->
    </head>
    <header>
        <div id="logo">
            <img src="../img/logos/logo.png" alt="logo" width="110" height="110" />
        </div>	
        <div id="texto">
            <p id="h1"> SIMVA <br />  </p>
            <p id="h2"> Sistema de Informaci�n de Control y Mantenimiento de Veh�culos Automotores </p>
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
    <div id="espacio1"></div>
    <!-- InstanceBeginEditable name="nav" -->

    <nav>
        <a href="../asignacion.jsp" title="Menu principal"><span class="fa fa-home fa-1x"></span>Inicio</a>
        <a href="formFuncionario.jsp" title="Registro de Funcionarios"><span class="fa fa-users fa-1x"> Registro de Funcionarios</a>
        <a href="formVehiculos.jsp" title="Registro de vehículos"><span class="fa fa-car fa-1x"> Registro de veh�culos</a>
        <a href="formAsignacion.jsp" title="Realizar asignación"><span class="fa fa-check-square-o fa-1x"> Realizar asignaci�n</a>
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
                        <li><a href="../Asignacion.jsp">Inicio</a></li>
                        <li class="active">Formulario Registro de Funcionario</li>   
                    </ol>
                </div>

                <form class="formularioRegistroFuncionario" method="post" action="..\..\GestionFuncionarios">
                    <h3>Formulario Gestion de Funcionario</h3>

                    <div class="cajas" id="cajaUno">  

                        <label for="numeroDocumento">Cedula:</label>
                        <input name="numeroDocumento" id="numeroDocumento" type="text" placeholder= "Ej. 79'399.894" tabindex="1" required maxlength="10">
                        
                        <label for="grado">Grado:</label>
                        <Select name="grado" class="listas" id="grados" tabindex="3" required>
                            <option disabled>Seleccione el grado</option>
                            <%
                                GradosDao ObjDaoGra = new GradosDao();
                                ArrayList<GradosDto> listadoGrados = new ArrayList<GradosDto>();
                                listadoGrados = ObjDaoGra.ConsultarGradosTodos();
                                for (int a = 0; a < listadoGrados.size(); a++) {
                            %>
                            <option value="<%= listadoGrados.get(a).getIdGrados()%>">
                                <%= listadoGrados.get(a).getDescripcionGrado()%></option>
                                <%}%>
                        </select>
                        <br>
                        <label for="campoApellido1">Primer Apellido:</label>
                        <input name="apellido1" id="campoApellido1" type="text" placeholder="Ej. Medina" tabindex="4" required minlength="3" maxlength="10">
                        <br>
                        <label for="campoApellido2">Segundo Apellido:</label>
                        <input name="apellido2" id="campoApellido2" type="text" placeholder="Ej. Tarazona" tabindex="5" maxlength="10">
                        <br>
                        <label for="campoNombre1">Primer Nombre:</label>
                        <input name="nombre1" id="campoNombre1" type="text" placeholder="Ej. Jairo" tabindex="6" required maxlength="10">
                        <br>
                        <label for="campoNombre2">Segundo Nombre:</label>
                        <input name="nombre2" id="campoNombre2" type="text" placeholder="Ej. Ismael" tabindex="7" maxlength="10">
                        <br>
                        <label for="campoFechaNacimiento">Fecha Nacimiento</label>
                        <input class="fechas" name="campoFechaNacimiento" id="campoFechaNacimiento" type="date" tabindex="8" maxlength="10">
                        <br>
                        <label for="campoRh">RH</label>
                        <select name="idRh" class="listas"  id="idRh" tabindex="9" maxlength="10">
                            <option >Seleccione un Rh</option>
                            <%  RhDao ObjDaoRh = new RhDao();
                                ArrayList<RhDto> listadoRh = new ArrayList<RhDto>();
                                listadoRh = ObjDaoRh.ConsultarRhTodos();
                                for (int a = 0; a < listadoRh.size(); a++) {
                            %>
                            <option value="<%= listadoRh.get(a).getIdRh()%>">
                                <%= listadoRh.get(a).getDescripcionRh()%></option>
                                <%}%>
                        </select> 
                        <br>
                        <label for="email">Correo electronico:</label>
                        <input name="email" id="email" type="email" placeholder="Ej. jairoismael@hotmail.com" tabindex="10" required maxlength="25">
                        <br>
                    </div>

                    <div class="cajas" id="cajados">
                        <label for="ciudadDocumento">De:</label>
                        <select name="ciudadDocumento" class="listas"  id="ciudadDocumento" tabindex="2" required>
                            <option disabled>Seleccione una ciudad</option>
                            <%  CiudadesDao ObjDaoC = new CiudadesDao();
                                ArrayList<CiudadesDto> listado = new ArrayList<CiudadesDto>();
                                listado = ObjDaoC.ConsultarCiudadesTodas();
                                for (int a = 0; a < listado.size(); a++) {
                            %>
                            <option value="<%= listado.get(a).getIdCiudad()%>">
                                <%= listado.get(a).getNombreCiudad()%></option>
                                <%}%>
                        </select>
                        <br>
                        <!--label for="direccionResidencia">Direccion</label>
                      <input name="direccionResidencia" id="direccionResidencia" type="text" placeholder="Ej. Calle 200 # 23-50" tabindex="10" maxlength="40">

                      <label for="ciudadResidencia">Ciudad:</label>
                      <select class="listas" name="ciudadResidencia" id="ciudadResidencia" tabindex="11" required maxlength="11">
                          <option disabled>Seleccione la ciudad</option>
                          <option value="130" >Barranquilla</option>
                      </select--> 
                        <label for="telefono">Telefono:</label>
                        <input name="telefono" id="telefono" type="text" placeholder= "Ej. 7581429" tabindex="12" required minlength="7"maxlength="10">
                        <br>
                        <label for="movil">Celular:</label>
                        <input name="movil" id="movil" type="text" placeholder= "Ej. 3002128188" tabindex="13" required minlength="7" maxlength="10">
                        <br>
                        <label for="indicativo">Indicativo:</label>
                        <input name="indicativo" id="indicativo" type="text" placeholder= "Ej. Alfa-8" tabindex="14" required maxlength="10">
                        <br>
                        <label for="licenciaConduccion">Licencia de conduccion:</label>
                        <input name="licenciaConduccion" id="licenciaConduccion" type="text" placeholder= "Ej. 1100100096612385" tabindex="15" required minlength="8" maxlength="17">
                        <br>
                        <label for="categoria">Categoria</label>
                        <select class="listas" name="categoria" id="categoria" tabindex="16" required>
                            <option disabled>Seleccione</option>
                            <%  CategoriasDao ObjDaoCate = new CategoriasDao();
                                ArrayList<CategoriasDto> listadoCategorias = new ArrayList<CategoriasDto>();
                                listadoCategorias = ObjDaoCate.ConsultarCategoriasTodas();
                                for (int a = 0; a < listadoCategorias.size(); a++) {
                            %>
                            <option value="<%= listadoCategorias.get(a).getIdCategoria()%>">
                                <%= listadoCategorias.get(a).getDescripcionCategoria()%></option>
                                <%}%>
                        </select>
                        <br>
                        <label for="vencimientoCategoria">Fecha Vencimiento</label>
                        <input class="fechas" name="vencimientoCategoria" id="vencimientoCategoria" type="date" tabindex="17" required maxlength="10">
                        <br>
                        <label for="fechaAlta">Fecha alta</label>
                        <input  class="listas" name="fechaAlta" id="fechaAlta" type="date" tabindex="19" required maxlength="10">
                        <br>
                    </div>

                    <div class="cajas" id="cajaTres">

                        <div name="fotoFuncionario" id="fotoFuncionario"> 
                            <!--<img src="../img/funcionario.jpg" alt="foto" width="120" height="100"-->
                            <img src="../img/funcionario123.jpg" alt="foto" width="120" height="100">
                        </div>
                        <button class="btn btn-primary" type="submit">Buscar fotograf�a</button><br>
                        <br>
                        <input class="btn btn-primary" type="submit" name="enviar" value="Consultar" >
                        <br>
                        <input class="btn btn-primary" type="submit" name="enviar" value="Eliminar" >
                        <br>
                        <input class="btn btn-primary" type="submit" name="enviar" value="Modificar" >
                        <br>
                        <input class="btn btn-primary" type="submit" name="enviar" value="Guardar" >
                    </div>

                    <%
                        if (request.getParameter("funci") != null) {
                      out.print("<h2>" + request.getParameter("funci") + "</h2>");
                        }
                    %>
                </form>


                <!--
                <h2>Listado General de Funcionarios</h2>
                <table border="2">
                    <tbody>
                        <tr>
                            <td>numeroDocumento</td>
                            <td>grado</td>
                            <td>apellido1</td>
                            <td>apellido2</td>
                            <td>nombre1</td>
                            <td>nombre2</td>
                            <th>Opciones</th>
                        </tr>
                        
                        
                <!--%
                     FuncionariosDto ObjDtoFunci = new FuncionariosDto();
                     FuncionariosDao ObjDaoFunci = new FuncionariosDao();
                     ArrayList<FuncionariosDto> listadoFuncionarios = new ArrayList <FuncionariosDto>();
                     listadoFuncionarios = ObjDaoFunci.ConsultarFuncionarios();
                     for( int a = 0 ; a <listadoFuncionarios.size() ; a++ ){
                        
                     out.print("<tr><td>"+listadoFuncionarios.get(a).getNumeroDocumento()+"</td>");
                     //out.print("<td>"+listadoFuncionarios.get(a).getGrado()+"</td>");
                     //out.print("<td>"+listadoFuncionarios.get(a).(Integer.parseInt(request.getParameter("grado")+"</td>");
                     out.print("<td>"+listadoFuncionarios.get(a).getApellido1()+"</td>");
                     out.print("<td>"+listadoFuncionarios.get(a).getApellido2()+"</td>");
                     out.print("<td>"+listadoFuncionarios.get(a).getNombre1()+"</td>");
                     out.print("<td>"+listadoFuncionarios.get(a).getNombre2()+"</td>"); 
                     %>
   </tr> 

                -->


                <!--  
                  <script type="text/javascript">
  
                                  function confirmation() {
                                  var elim = confirm('esta seguro de eliminar la ciudad ?');
                                          if (elim) {
                                  alert("Ciudad Eliminada");
                                          return true;
                                  } else {
                                  alert("Cancelado!");
                                          return false;
                                  }
                                  }
  
                      </script> -->
        </section>
    </section>
    <script>
        $().ready(function () {
            $(".formularioRegistroFuncionario").validate({
                rules: {
                    grado: {
                        required: true
                    },
                    apellido1: {
                        lettersonly: true,
                        required: true,
                        minlength: 3,
                        maxlength: 10
                    },
                    apellido2: {
                        lettersonly: true,
                        minlength: 3,
                        maxlength: 10
                    },
                    nombre1: {
                        lettersonly: true,
                        required: true,
                        minlength: 3,
                        maxlength: 10
                    },
                    nombre2: {
                        lettersonly: true,
                        minlength: 3,
                        maxlength: 10
                    },
                    numeroDocumento: {
                        required: true,
                        digits: true,
                        minlength: 5,
                        maxlength: 10
                    },
                    ciudadDocumento: {
                        required: true
                    },
                    campoFechaNacimiento: {
                        required: true
                    },
                    telefono: {
                        digits: true,
                        required: true,
                        minlength: 7,
                        maxlength: 8
                    },
                    movil: {
                        digits: true,
                        required: true,
                        minlength: 7,
                        maxlength: 10
                    },
                    indicativo: {
                        required: true
                    },
                    licenciaConduccion: {
                        digits: true,
                        required: true,
                        minlength: 8,
                        maxlength: 17
                    },
                    categoria: {
                        required: true
                    },
                    vencimientoCategoria: {
                        required: true
                    },
                    email: {
                        required: true,
                        email: true
                    },
                    fechaAlta: {
                        required: true
                    }
                },
                messages: {
                    grado: {
                        required: "Campo requerido"
                    },
                    apellido1: {
                        required: "Campo requerido",
                        lettersonly: "Por favor Digite solo letras",
                        minlength: "Mínimo {0} caracteres"
                    },
                    apellido2: {
                        required: "Campo requerido",
                        lettersonly: "Por favor Digite solo letras",
                        minlength: "Mínimo {0} caracteres"
                    },
                    nombre1: {
                        required: "Campo requerido",
                        lettersonly: "Por favor Digite solo letras",
                        minlength: "Mínimo {0} caracteres"
                    },
                    nombre2: {
                        required: "Campo requerido",
                        lettersonly: "Por favor Digite solo letras",
                        minlength: "Mínimo {0} caracteres"
                    },
                    numeroDocumento: {
                        required: "Campo requerido",
                        digits: "Por favor digite solo numeros",
                        minlength: "Mínimo {0} caracteres"
                    },
                    ciudadDocumento: {
                        required: "Campo requerido"
                    },
                    campoFechaNacimiento: {
                        required: "Campo requerido"
                    },
                    telefono: {
                        required: "Campo requerido",
                        digits: "Por favor digite solo numeros",
                        minlength: "Mínimo {0} caracteres",
                        maxlength: "Maximo {0} caracteres"
                    },
                    movil: {
                        required: "Campo requerido",
                        digits: "Por favor digite solo numeros",
                        minlength: "Mínimo {0} caracteres",
                        maxlength: "Maximo {0} caracteres"
                    },
                    indicativo: {
                        required: "Campo requerido"
                    },
                    licenciaConduccion: {
                        required: "Campo requerido",
                        digits: "Por favor digite solo numeros",
                        minlength: "Minimo {0} caracteres",
                        maxlength: "Maximo {0} caracteres"
                    },
                    categoria: {
                        required: "Campo requerido"
                    },
                    vencimientoCategoria: {
                        required: "Campo requerido"
                    },
                    email: {
                        required: "Campo requerido",
                        email: "Digite un correo electronico valido"

                    },
                    fechaAlta: {
                        required: "Campo requerido"
                    }
                } // Cierre de los mensajes
            }); // Cierre de la función validate
        }); // Cierre de la función ready

    </script>
    <!-- InstanceEndEditable -->

    <div id="espacio3"></div>

<foot>
    <div class="pie">Versi�n 5.0 | COPYRIGHT   &copy;2014 SIMVA | Cont�ctenos: 3108549716 | E-mail: contactenos@simva.url.ph</div> 
</foot>

<div id="espacio4"></div>

<!-- InstanceEnd --></html>