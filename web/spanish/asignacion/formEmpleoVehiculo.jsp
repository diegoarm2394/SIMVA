<%-- 
    Document   : formEmpleoVehiculo
    Created on : 08-abr-2015, 11:22:06
    Author     : Jairo
--%>

<%@page import="DTO.FuncionarioRolDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.EmpleoVehiculoDao"%>
<%@page import="DTO.EmpleoVehiculoDto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta charset="utf-8">
        <!-- InstanceBeginEditable name="doctitle" -->
        <title>Formulario Empleo Vehículo</title>
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
            <p id="h2"> Sistema de Información de Control y Mantenimiento de Vehículos Automotores </p>
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
        <a href="formVehiculo.jsp" title="Registro de vehÃ­culos"><span class="fa fa-car fa-1x"> Registro de vehículos</a>
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
                        <li class="active">Formulario Empleo Vehiculo</li>   
                    </ol>
                </div>
                <form class="formularioEmpleoVehiculo" method="post" action="../../GestionEmpleoVehiculo">

                    <h3>Formulario Empleo Vehículo</h3>

                    Código Empleo Vehículo: <input type="text" name="idEmpleoVehiculo" value="" required="" /><br>
                    Descripción: <input type="text" name="descripcionEmpleoVehiculo" value="" required="" /><br>

                    <input type="submit" name="enviar" value="Guardar" />
                                  
                    <!--input type="submit" name="boton" value="Consultar" /-->
                 <%
                    
                    if (request.getParameter("empleoVehiculo") != null) {

                        out.print("<h3>" + request.getParameter("empleoVehiculo") + "</h3>");
                    }
                %>
                <h2>Listado Empleos Vehículo</h2>
                <table border="2">
                    
                    <tbody>
                 
                        <tr>
                            <td>Código Empleo Vehículo</td>
                            <td>Descripción</td>
                            <th>Opción</th>
                            <td> </td>
                        </tr>

                        <%
                            EmpleoVehiculoDto ObjDtoEmp = new EmpleoVehiculoDto();
                            EmpleoVehiculoDao ObjDaoEmp = new EmpleoVehiculoDao();
                            ArrayList<EmpleoVehiculoDto> listadoEmpleoVehiculo = new ArrayList<EmpleoVehiculoDto>();
                            listadoEmpleoVehiculo = ObjDaoEmp.ConsultarEmpleoVehiculoTodos();

                            for (int a = 0; a < listadoEmpleoVehiculo.size(); a++) {

                                out.print("<tr><td>" + listadoEmpleoVehiculo.get(a).getIdEmpleoVehiculo()+ "</td>");
                                out.print("<td>" + listadoEmpleoVehiculo.get(a).getDescripcionEmpleVehiculo()+ "</td>");
                                //out.print("<td><a href='../../GestionEmpleoVehiculo?enviar=Eliminar&pos=" + listadoEmpleoVehiculo.get(a).getIdEmpleoVehiculo() + "'>Eliminar</a></td></tr>");
                        %>
                 
                    </form> 
                   
                    <td><a href="../../GestionEmpleoVehiculo?enviar=Eliminar&pos=<%=listadoEmpleoVehiculo.get(a).getIdEmpleoVehiculo()%>" onclick="return confirmation()">Eliminar</a></td>
                    <!--td><a href="../../GestionTiposCombustibles?boton=Actualizar&pos=<%=listadoEmpleoVehiculo.get(a).getIdEmpleoVehiculo()%>" >Actualizar</a></td-->
           </tr>
                    <script type="text/javascript">

                        function confirmation() {
                            var elim = confirm('Esta seguro de eliminar el Empleo del Vehículo ?');
                            if (elim) {
                                alert("Empleo de Vehículo Eliminado");
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
                $(".formularioEmpleoVehiculo").validate({
                    rules: {
                        idEmpleoVehiculo :{
                            required: true,
                            maxlength: 10
                        },
                        descripcionEmpleoVehiculo: {
                            required: true,
                            maxlength: 10
                        }
                    },
                    messages: {
                        idEmpleoVehiculo :{
                            required: "Campo requerido",
                            maxlength: "Maximo {0} caracteres"
                        },
                        descripcionEmpleoVehiculo: {
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
