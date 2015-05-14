<%@page import="DTO.FuncionarioRolDto"%>
<%@page import="DTO.EstadosVehiculoDto"%>
<%@page import="DAO.EstadosVehiculoDao"%>
<%@page import="DTO.EmpleoVehiculoDto"%>
<%@page import="DAO.EmpleoVehiculoDao"%>
<%@page import="DTO.TiposCombustiblesDto"%>
<%@page import="DAO.TiposCombustiblesDao"%>
<%@page import="DTO.ColorVehiculoDto"%>
<%@page import="DAO.ColorVehiculoDao"%>
<%@page import="DTO.MarcasDto"%>
<%@page import="DAO.MarcasDao"%>
<%@page import="DTO.TiposVehiculoDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.TiposVehiculoDao"%>
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
        <a href="../asignacion.jsp" title="Menu principal"><span class="fa fa-home fa-1x"></span>Inicio</a>
        <a href="formFuncionario.jsp" title="Registro de Funcionarios"><span class="fa fa-users fa-1x"> Registro de Funcionarios</a>
        <a href="formVehiculos.jsp" title="Registro de vehículos"><span class="fa fa-car fa-1x"> Registro de vehículos</a>
        <a href="formAsignacion.jsp" title="Realizar asignación"><span class="fa fa-check-square-o fa-1x"> Realizar asignación</a>
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
                        <li class="active">Formulario Gestion de Vehículos</li>   
                    </ol>
                </div>

                <form class="formularioRegistroVehiculos" method="post" action="..\..\GestionVehiculos">

                    <h3>Formulario Gestion de Vehículos</h3>


                    <div class="cajas" id="cajaUno">      

                        <label for="placa">Placa:</label>
                        <input name="placa" id="placa" type="text" placeholder="Ej. MPW-734" tabindex="1" required minlength="5" maxlength="8"> 

                        <label for="sigla">Sigla:</label>
                        <input name="sigla" id="sigla" type="text" placeholder="Ej. EJC-L13-97-097" tabindex="2" minlength="5" maxlength="12">

                        <label for="tipoVehiculo">Tipo:</label>
                        <select name="tipoVehiculo" class="listas" id="tipoVehiculo" tabindex="3" required>
                            <option disabled>Seleccione un tipo</option>
                            <%
                                TiposVehiculoDao ObjDaoTive = new TiposVehiculoDao();
                                ArrayList<TiposVehiculoDto> listadoTiposVehiculo = new ArrayList<TiposVehiculoDto>();
                                listadoTiposVehiculo = ObjDaoTive.ConsultarTiposVehiculoTodos();
                                for (int a = 0; a < listadoTiposVehiculo.size(); a++) {
                            %>
                            <option value="<%= listadoTiposVehiculo.get(a).getIdTiposVehiculo()%>">
                                <%= listadoTiposVehiculo.get(a).getDescripcionTipoVehiculo()%></option>
                                <%}%>
                        </select>
                        <label for="marcaVehiculo">Marca:</label>
                        <select class="listas" name="marcaVehiculo" id="marcaVehiculo" tabindex="4" required>
                            <option disabled>Seleccione la marca</option>
                            <%
                                MarcasDao ObjDaoMar = new MarcasDao();
                                ArrayList<MarcasDto> listadoMarcas = new ArrayList<MarcasDto>();
                                listadoMarcas = ObjDaoMar.ConsultarMarcasTodas();
                                for (int a = 0; a < listadoMarcas.size(); a++) {
                            %>
                            <option value="<%= listadoMarcas.get(a).getIdMarcas()%>">
                                <%= listadoMarcas.get(a).getDescripcionMarcaVehiculo()%></option>
                                <%}%>
                        </select> 

                        <label for="modeloVehiculo">Modelo:</label>
                        <input name="modeloVehiculo" id="modeloVehiculo" type="text" placeholder="Ej. 2014" tabindex="5" minlength="4" maxlength="10">

                        <label for="colorVehiculo">Color:</label>
                        <select class="listas" name="colorVehiculo" id="colorVehiculo" tabindex="6" required>
                            <option disabled>Seleccione el color</option> 
                            <%
                                ColorVehiculoDao ObjDaoCol = new ColorVehiculoDao();
                                ArrayList<ColorVehiculoDto> listadoColorVehiculos = new ArrayList<ColorVehiculoDto>();
                                listadoColorVehiculos = ObjDaoCol.ConsultarColorVehiculosTodos();
                                for (int a = 0; a < listadoColorVehiculos.size(); a++) {
                            %>
                            <option value="<%= listadoColorVehiculos.get(a).getIdColorVehiculo()%>">
                                <%= listadoColorVehiculos.get(a).getDescripcionColorVehiculo()%></option>
                                <%}%>
                        </select> 

                        <label for="vin">VIN:</label>
                        <input name="vin" id="vin" type="text" placeholder="Ej. KPTC0B16SDP082986" tabindex="7" required minlength="10" maxlength="18">

                        <label for="motor">Motor:</label>
                        <input name="motor" id="motor" type="text" placeholder="Ej. 1619511001914SE104" tabindex="8" required minlength="10" maxlength="18">


                    </div>

                    <div class="cajas" id="cajados">

                        <label for="combustible">Combustible:</label>
                        <select name="tiposCombustibles" class="listas" id="combustible" tabindex="10" required>
                            <option disabled>Seleccione</option>
                            <%
                                TiposCombustiblesDao ObjDaoTico = new TiposCombustiblesDao();
                                ArrayList<TiposCombustiblesDto> listadoTiposCombustibles = new ArrayList<TiposCombustiblesDto>();
                                listadoTiposCombustibles = ObjDaoTico.ConsultarTiposCombustiblesTodos();
                                for (int a = 0; a < listadoTiposCombustibles.size(); a++) {
                            %>
                            <option value="<%= listadoTiposCombustibles.get(a).getIdTiposCombustibles()%>">
                                <%= listadoTiposCombustibles.get(a).getDescripcionTipoCombustible()%></option>
                                <%}%>
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
                        <input name="vencimientoResponsabilidad" class="fechas" id="vencimientoResponsabiliad" type="date" tabindex="16" required>

                    </div>

                    <div class="cajas" id="cajaTres">

                        <label for="revisionTecnomecanica">Revision Tecnomecanica:</label>
                        <input name="revisionTecnomecanica" id="revisionTecnomecanica" type="text" placeholder= "Ej. 1100100096612385" tabindex="17" required minlength:"5" maxlength="15">


                               <label for="vencimientoTecnomecanica">Fecha Vencimiento</label>
                        <input name="vencimientoTecnomecanica" class="fechas" id="vencimientoTecnomecanica" type="date" tabindex="18" required>


                        <label for="empleoVehiculo">Empleo:</label>
                        <select class="listas" name="empleoVehiculo" id="empleoVehiculo" tabindex="19" required>
                            <option disabled> Seleccione</option>
                            <%
                                EmpleoVehiculoDao ObjDaoEmp = new EmpleoVehiculoDao();
                                ArrayList<EmpleoVehiculoDto> listadoEmpleoVehiculo = new ArrayList<EmpleoVehiculoDto>();
                                listadoEmpleoVehiculo = ObjDaoEmp.ConsultarEmpleoVehiculoTodos();
                                for (int a = 0; a < listadoEmpleoVehiculo.size(); a++) {
                            %>
                            <option value="<%= listadoEmpleoVehiculo.get(a).getIdEmpleoVehiculo()%>">
                                <%= listadoEmpleoVehiculo.get(a).getDescripcionEmpleVehiculo()%></option>
                                <%}%>
                        </select> 


                        <label for="estadosVehiculo">Estado:</label>
                        <select class="listas" name="estadosVehiculo" id="estadoVehiculo"  tabindex="20" required>
                            <option disabled>Seleccione</option>
                            <%
                                EstadosVehiculoDao ObjDaoEst = new EstadosVehiculoDao();
                                ArrayList<EstadosVehiculoDto> listadoEstadosVehiculo = new ArrayList<EstadosVehiculoDto>();
                                listadoEstadosVehiculo = ObjDaoEst.ConsultarEstadosVehiculoTodos();
                                for (int a = 0; a < listadoEstadosVehiculo.size(); a++) {
                            %>
                            <option value="<%= listadoEstadosVehiculo.get(a).getIdEstadosVehiculo()%>">
                                <%= listadoEstadosVehiculo.get(a).getDescripcionEstadoVehiculo()%></option>
                                <%}%>
                        </select> 

                        <label for="fechaEstado">Fecha del Estado</label>
                        <input name="fechaEstado" class="fechas" id="fechaEstado" type="date" tabindex="21" required>
                        <br>
                         <div name="fotoVehiculo"  id="fotoVehiculo"> 
                            <img src="../img/Vehiculo.jpg" alt="foto" width="200px" height="120px">
                        </div>
                        <button class="btn btn-primary" type="submit">Buscar Fotografía</button>

                        <input class="btn btn-primary" type="submit" name="enviar" value="Guardar" >

                    </div>
                </form>

                <%
                    if (request.getParameter("Vehi") != null) {
                   out.print("<h2>" + request.getParameter("Vehi") + "</h2>");
                    }
                %>
        </section>
    </section>
    <script>
        $().ready(function () {
            $(".formularioRegistroVehiculos").validate({
                rules: {
                    placa: {
                        required: true,
                        minlength: 6,
                        maxlength: 8
                    },
                    sigla: {
                        minlength: 6,
                        maxlength: 14
                    },
                    tipoVehiculo: {
                        required: true,
                        maxlength: 10
                    },
                    marcaVehiculo: {
                        required: true,
                        maxlength: 10
                    },
                    modeloVehiculo: {
                        maxlength: 14
                    },
                    colorVehiculo: {
                        required: true,
                        maxlength: 20
                    },
                    vin: {
                        required: true,
                        maxlength: 18
                    },
                    motor: {
                        required: true
                    },
                    tiposCombustibles: {
                        required: true,
                        maxlength: 20
                    },
                    cilindraje: {
                        required: true
                    },
                    licenciaTransito: {
                        required: true,
                        maxlength: 10
                    },
                    seguroObligatorio: {
                        required: true,
                        maxlength: 10
                    },
                    vencimientoSeguro: {
                        required: true,
                        maxlength: 10
                    },
                    seguroResponsabilidadCivil: {
                        required: true,
                        maxlength: 10
                    },
                    vencimientoResponsabilidad: {
                        required: true,
                        maxlength: 10
                    },
                    revisionTecnomecanica: {
                        required: true,
                        maxlength: 15
                    },
                    vencimientoTecnomecanica: {
                        required: true,
                        maxlength: 10
                    },
                    empleoVehiculo: {
                        required: true
                    },
                    estadosVehiculo: {
                        required: true
                    },
                    fechaEstado: {
                        required: true
                    }
                },
                messages: {
                    placa: {
                        required: "Campo requerido",
                        minlength: "Minimo {0} caracteres",
                        maxlength: "Maximo {0} caracteres"
                    },
                    sigla: {
                        minlength: "Minimo {0} caracteres",
                        maxlength: "Maximo {0} caracteres"
                    },
                    tipoVehiculo: {
                        required: "Campo requerido",
                        maxlength: "Maximo {0} caracteres"
                    },
                    marcaVehiculo: {
                        required: "Campo requerido",
                        maxlength: "Maximo {0} caracteres"
                    },
                    modeloVehiculo: {
                        maxlength: "Maximo {0} caracteres"
                    },
                    colorVehiculo: {
                        required: "Campo requerido",
                        maxlength: "Maximo {0} caracteres"
                    },
                    vin: {
                        required: "Campo requerido",
                        maxlength: "Maximo {0} caracteres"
                    },
                    motor: {
                        required: "Campo requerido"
                    },
                    tiposCombustibles: {
                        required: "Campo requerido",
                        maxlength: "Maximo {0} caracteres"
                    },
                    cilindraje: {
                        required: "Campo requerido"
                    },
                    licenciaTransito: {
                        required: "Campo requerido",
                        maxlength: "Maximo {0} caracteres"
                    },
                    seguroObligatorio: {
                        required: "Campo requerido",
                        maxlength: "Maximo {0} caracteres"
                    },
                    vencimientoSeguro: {
                        required: "Campo requerido",
                        maxlength: "Maximo {0} caracteres"
                    },
                    seguroResponsabilidadCivil: {
                        required: "Campo requerido",
                        maxlength: "Maximo {0} caracteres"
                    },
                    vencimientoResponsabilidad: {
                        required: "Campo requerido",
                        maxlength: "Maximo {0} caracteres"
                    },
                    revisionTecnomecanica: {
                        required: "Campo requerido",
                        maxlength: "Maximo {0} caracteres"
                    },
                    vencimientoTecnomecanica: {
                        required: "Campo requerido",
                        maxlength: "Maximo {0} caracteres"
                    },
                    empleoVehiculo: {
                        required: "Campo requerido"
                    },
                    estadosVehiculo: {
                        required: "Campo requerido"
                    },
                    fechaEstado: {
                        required: "Campo requerido"
                    }
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