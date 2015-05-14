<%-- 
    Document   : formColorVehiculo
    Created on : 06-abr-2015, 13:54:24
    Author     : Jairo
--%>

<%@page import="DTO.FuncionarioRolDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.ColorVehiculoDao"%>
<%@page import="DTO.ColorVehiculoDto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <meta charset="utf-8">
        <!-- InstanceBeginEditable name="doctitle" -->
        <title>Formulario Color de Vehicúlos</title>
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
            <p id="h2"> Sistema de Informacion de Control y Mantenimiento de Vehículos Automotores </p>
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
                        <li class="active">Formulario Color de Vehículos</li>   
                    </ol>
                </div>
                <form class="formularioColorVehiculos" method="post" action="../../GestionColorVehiculo">

                    <h3>Formulario Color de Vehículos</h3>

                    Codigo Color: <input type="text" name="idColorVehiculo" value="" required="" /><br>
                    Nombre: <input type="text" name="descripcionColorVehiculo" value="" required="" /><br>

                    <input type="submit" name="boton" value="Guardar" />
                    
                    <!--input type="submit" name="boton" value="Consultar" /-->
                 <%
                    
                    if (request.getParameter("Estado") != null) {

                        out.print("<h3>" + request.getParameter("Estado") + "</h3>");
                    }
                %>
                <h2>Listado Colores de Vehículos</h2>
                <table border="1">
                    
                    <tbody>
                 
                        <tr>
                            <td>Código Color</td>
                            <td>Nombre</td>
                            <th>Opción</th>
                            <td> </td>
                        </tr>

                        <%
                            ColorVehiculoDto ObjDtoCol = new ColorVehiculoDto();
                            ColorVehiculoDao ObjDaoCol = new ColorVehiculoDao();
                            ArrayList<ColorVehiculoDto> listadoColorVehiculos = new ArrayList<ColorVehiculoDto>();
                            listadoColorVehiculos = ObjDaoCol.ConsultarColorVehiculosTodos();

                            for (int a = 0; a < listadoColorVehiculos.size(); a++) {

                                out.print("<tr><td>" + listadoColorVehiculos.get(a).getIdColorVehiculo()+ "</td>");
                                out.print("<td>" + listadoColorVehiculos.get(a).getDescripcionColorVehiculo()+ "</td>");
                                //out.print("<td><a href='../../GestionCiudades?boton=Eliminar&pos=" + listadoMarcas.get(a).getIdMarcas() + "'>Eliminar</a></td></tr>");
                        %>
                 
                    </form> 
                   
                    <td><a href="../../GestionColorVehiculo?boton=Eliminar&pos=<%=listadoColorVehiculos.get(a).getIdColorVehiculo()%>" onclick="return confirmation()">Eliminar</a></td>
                    <!--td><a href="../../GestionColorVehiculo?boton=Actualizar&pos=<%=listadoColorVehiculos.get(a).getIdColorVehiculo()%>" >Actualizar</a></td-->
                </tr>
                    <script type="text/javascript">

                        function confirmation() {
                            var elim = confirm('Esta seguro de eliminar el Color de Vehículo ?');
                            if (elim) {
                                alert("Color de Vehículo Eliminado");
                                return true;
                            } else {
                                alert("Cancelado!");
                                return false;
                            }
                        }

                    </script>
                    <%}%>
                    </tbody>
                </table>

        </section>
       <script>
            $().ready(function () {
                $(".formularioColorVehiculos").validate({
                    rules: {
                        idColorVehiculo :{
                            required: true,
                            maxlength: 10
                        },
                        descripcionColorVehiculo: {
                            required: true,
                            maxlength: 10
                        }
                    },
                    messages: {
                        idColorVehiculo :{
                            required: "Campo requerido",
                            maxlength: "Maximo {0} caracteres"
                        },
                        descripcionColorVehiculo: {
                            required: "Campo requerido",
                            maxlength: "Maximo {0} caracteres"
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

    <!-- InstanceEnd -->
</html>
