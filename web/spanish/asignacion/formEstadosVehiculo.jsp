<%-- 
    Document   : formEstadosVehiculo
    Created on : 08-abr-2015, 13:17:52
    Author     : Jairo
--%>

<%@page import="DTO.FuncionarioRolDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.EstadosVehiculoDao"%>
<%@page import="DTO.EstadosVehiculoDto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <meta charset="utf-8">
        <!-- InstanceBeginEditable name="doctitle" -->
        <title>Formulario Estados Vehículo</title>
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
                        <li class="active">Formulario Estados Vehiculo</li>   
                    </ol>
                </div>
                <form class="formularioEstadosVehiculo" method="post" action="../../GestionEstadosVehiculo">

                    <h3>Formulario Estados Vehiculo</h3>

                    Código Estados Vehículo: <input type="text" name="idEstadosVehiculo" value="" required="" /><br>
                    Descripción: <input type="text" name="descripcionEstadoVehiculo" value="" required="" /><br>

                    <input type="submit" name="enviar" value="Guardar" />
                                  
                    <!--input type="submit" name="boton" value="Consultar" /-->
                 <%
                    
                    if (request.getParameter("estadoVehiculo") != null) {

                        out.print("<h3>" + request.getParameter("estadoVehiculo") + "</h3>");
                    }
                %>
                <h2>Listado Estados Vehículo</h2>
                <table border="2">
                    
                    <tbody>
                 
                        <tr>
                            <td>Código Estado Vehículo</td>
                            <td>Descripción</td>
                            <th>Opción</th>
                            <td> </td>
                        </tr>

                        <%
                            EstadosVehiculoDto ObjDtoEst = new EstadosVehiculoDto();
                            EstadosVehiculoDao ObjDaoEst = new EstadosVehiculoDao();
                            ArrayList<EstadosVehiculoDto> listadoEstadosVehiculo = new ArrayList<EstadosVehiculoDto>();
                            listadoEstadosVehiculo = ObjDaoEst.ConsultarEstadosVehiculoTodos();

                            for (int a = 0; a < listadoEstadosVehiculo.size(); a++) {

                                out.print("<tr><td>" + listadoEstadosVehiculo.get(a).getIdEstadosVehiculo()+ "</td>");
                                out.print("<td>" + listadoEstadosVehiculo.get(a).getDescripcionEstadoVehiculo()+ "</td>");
                                //out.print("<td><a href='../../GestionEstadosVehiculo?enviar=Eliminar&pos=" + listadoEstadosVehiculo.get(a).getIdEstadosVehiculo() + "'>Eliminar</a></td></tr>");
                        %>
                 
                    </form> 
                   
                    <td><a href="../../GestionEstadosVehiculo?enviar=Eliminar&pos=<%=listadoEstadosVehiculo.get(a).getIdEstadosVehiculo()%>" onclick="return confirmation()">Eliminar</a></td>
                    <!--td><a href="../../GestionEstadosVehiculo?boton=Actualizar&pos=<%=listadoEstadosVehiculo.get(a).getIdEstadosVehiculo()%>" >Actualizar</a></td-->
           </tr>
                    <script type="text/javascript">

                        function confirmation() {
                            var elim = confirm('Esta seguro de eliminar el Estado del Vehículo ?');
                            if (elim) {
                                alert("Estado de Vehículo Eliminado");
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
                $(".formularioEstadosVehiculo").validate({
                    rules: {
                        idEstadosVehiculo :{
                            required: true,
                            maxlength: 10
                        },
                        descripcionEstadoVehiculo: {
                            required: true,
                            maxlength: 10
                        }
                    },
                    messages: {
                        idEstadosVehiculo :{
                            required: "Campo requerido",
                            maxlength: "Maximo {0} caracteres"
                        },
                        descripcionEstadoVehiculo: {
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
