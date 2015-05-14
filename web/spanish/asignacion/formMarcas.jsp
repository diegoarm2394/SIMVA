<%-- 
    Document   : formMarcas
    Created on : 06-abr-2015, 12:11:19
    Author     : Jairo
--%>

<%@page import="DTO.FuncionarioRolDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.MarcasDao"%>
<%@page import="DTO.MarcasDto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <!-- InstanceBeginEditable name="doctitle" -->
        <title>Formulario Marcas de Vehicúlos</title>
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
        <a href="formVehiculos.jsp" title="Registro de vehÃ­culos"><span class="fa fa-car fa-1x"> Registro de vehÃ­culos</a>
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
                        <li class="active">Formulario Marcas de Vehículos</li>   
                    </ol>
                </div>
                <form class="formularioMarcasVehiculos" method="post" action="../../GestionMarcas">

                    <h3>Formulario Marcas de Vehículos</h3>

                    Codigo Marca: <input type="text" name="idMarcas" value="" required="" /></br>
                    Nombre: <input type="text" name="descripcionMarcaVehiculo" value="" required="" /></br>

                    <input type="submit" name="boton" value="Guardar" />
                    
                    <!--input type="submit" name="boton" value="Consultar" /-->
                </form>

                <%
                    if (request.getParameter("Estado") != null) {

                        out.print("<h3>" + request.getParameter("Estado") + "</h3>");
                    }
                %>
                <h2>Listado Marcas de Vehículos</h2>
                <table border="1">

                    <tbody>
                        <tr>
                            <td>Código Marca</td>
                            <td>Nombre</td>
                            <th>Opcion</th>
                            <td> </td>
                        </tr>

                        <%
                            MarcasDto ObjDtoMar = new MarcasDto();
                            MarcasDao ObjDaoMar = new MarcasDao();
                            ArrayList<MarcasDto> listadoMarcas = new ArrayList<MarcasDto>();
                            listadoMarcas = ObjDaoMar.ConsultarMarcasTodas();

                            for (int a = 0; a < listadoMarcas.size(); a++) {

                                out.print("<tr><td>" + listadoMarcas.get(a).getIdMarcas() + "</td>");
                                out.print("<td>" + listadoMarcas.get(a).getDescripcionMarcaVehiculo() + "</td>");
                                //out.print("<td><a href='../../GestionCiudades?boton=Eliminar&pos=" + listadoMarcas.get(a).getIdMarcas() + "'>Eliminar</a></td></tr>");
                        %>
                    <td><a href="../../GestionMarcas?boton=Eliminar&pos=<%=listadoMarcas.get(a).getIdMarcas()%>" onclick="return confirmation()">Eliminar</a></td>
                    <!--td><a href="../../GestionMarcas?boton=Actualizar&pos=<%=listadoMarcas.get(a).getIdMarcas()%>" >Actualizar</a></td-->
                </tr>
                    <script type="text/javascript">

                        function confirmation() {
                            var elim = confirm('Esta seguro de eliminar la Marca de Vehículo ?');
                            if (elim) {
                                alert("Marca de Vehículo Eliminada");
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
                $(".formularioMarcasVehiculos").validate({
                    rules: {
                        idMarcas: {
                            required: true,
                            maxlength: 10
                        },
                        descripcionMarcaVehiculo: {
                            required: true,
                            maxlength: 10
                        }
                    },
                    messages: {
                        idMarcas: {
                            required: "Campo requerido",
                            maxlength: "Maximo {0} caracteres"
                        },
                        descripcionMarcaVehiculo: {
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
