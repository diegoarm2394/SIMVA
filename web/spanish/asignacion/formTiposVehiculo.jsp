<%-- 
    Document   : formTiposVehiculo
    Created on : 06-abr-2015, 9:05:10
    Author     : Jairo
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="DAO.TiposVehiculoDao"%>
<%@page import="DTO.TiposVehiculoDto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <!-- InstanceBeginEditable name="doctitle" -->
        <title>Formulario Tipos de Vehicúlos</title>
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
        <a href="formVehiculo.jsp" title="Registro de vehÃ­culos"><span class="fa fa-car fa-1x"> Registro de vehÃ­culos</a>
        <a href="formAsignacion.jsp" title="Realizar asignaciÃ³n"><span class="fa fa-check-square-o fa-1x"> Realizar asignaciÃ³n</a>
        <a href="../index-es.html" title="Cerrar secciÃ³n"><span class="fa fa-sign-out fa-1x"></span>Desconectar</a>
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
                        <li class="active">Formulario Tipos de Vehiculos</li>   
                    </ol>
                </div>
                <form class="formularioTiposVehiculo" method="post" action="../../GestionTiposVehiculos">

                    <h3>Formulario Tipos de Vehiculos</h3>

                    Tipo Vehiculo: <input type="text" name="idTiposVehiculo" value="" required="" /></br>
                    Descripcion: <input type="text" name="descripcionTipoVehiculo" value="" required="" /></br>

                    <input type="submit" name="boton" value="Guardar" />
                    <input type="submit" name="boton" value="Consultar" />
                </form>
                <%
                    if (request.getParameter("Estado") != null) {

                        out.print("<h3>" + request.getParameter("Estado") + "</h3>");
                    }
                %>

                <h2>Lista Tipos de Vehiculos</h2>
                <table border="1">

                    <tbody>
                        <tr>
                            <td>Codigo Tipos Vehiculo</td>
                            <td>descripcion Tipo Vehiculo</td>
                            <th>Opciones</th>
                            <td> </td>
                        </tr>
                        <%
                            TiposVehiculoDto ObjDtoTiVe = new TiposVehiculoDto();
                            TiposVehiculoDao ObjDaoTiVe = new TiposVehiculoDao();
                            ArrayList<TiposVehiculoDto> listadoTiposVehiculo = new ArrayList<TiposVehiculoDto>();
                            listadoTiposVehiculo = ObjDaoTiVe.ConsultarTiposVehiculoTodos();

                            for (int a = 0; a < listadoTiposVehiculo.size(); a++) {

                                out.print("<tr><td>" + listadoTiposVehiculo.get(a).getIdTiposVehiculo() + "</td>");
                                out.print("<td>" + listadoTiposVehiculo.get(a).getDescripcionTipoVehiculo() + "</td>");
                                //out.print("<td><a href='../../GestionCiudades?boton=Eliminar&pos="+listado.get(a).getIdCiudad()+"'>Eliminar</a></td></tr>");
                        %>
                    <td><a href="../../GestionTiposVehiculos?boton=Eliminar&pos=<%=listadoTiposVehiculo.get(a).getIdTiposVehiculo()%>" onclick="return confirmation()">Eliminar</a></td>
                    <td><a href="../../GestionTiposVehiculos?boton=Actualizar&pos=<%=listadoTiposVehiculo.get(a).getIdTiposVehiculo()%>" >Actualizar</a></td>
                    </tr>

                    <script type="text/javascript">

                        function confirmation() {
                            var elim = confirm('Esta seguro de eliminar el Tipo de Vehicúlo ?');
                            if (elim) {
                                alert("Tipo de Vehicúlo Eliminado");
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
                $(".formTiposVehiculo").validate({
                    rules: {
                        tipoVehiculo: {
                            required: true,
                            maxlength: 10
                        }
                    },
                    messages: {
                        tipoVehiculo: {
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
        <div class="pie">VersiÃ³n 1.0 | COPYRIGHT   &copy;2014 SIMVA | ContÃ¡ctenos: 3108549716 | E-mail: contactenos@simva.url.ph</div> 
    </foot>

    <div id="espacio4"></div>

    <!-- InstanceEnd -->
</html>
