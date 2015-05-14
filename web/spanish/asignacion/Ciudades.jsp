<%-- 
    Document   : Ciudades
    Created on : 18-mar-2015, 19:24:41
    @author Jairo
--%>

<%@page import="DTO.FuncionarioRolDto"%>
<%@page import="DAO.CiudadesDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DTO.CiudadesDto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <!-- InstanceBeginEditable name="doctitle" -->
        <title>Formulario Ciudades</title>
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
                        <li class="active">Formulario Tipos de Vehiculos</li>   
                    </ol>
                </div>
                <form class="formularioCiudades" name="Ciudades" action="../../GestionCiudades"  method="post">
                    </br> </br>
                    Codigo: <input type="text" name="idCiudad" value="" required=""/></br>
                    Nombre Ciudad: <input type="text" name="nombreCiudad" value="" required="" /></br> </br>

                    <input type="submit" name="boton" value="enviar" />
                    <input type="submit" name="boton" value="Consultar" />
                </form>
                <%
                    if (request.getParameter("Estado") != null) {

                        out.print("<h3>" + request.getParameter("Estado") + "</h3>");
                    }
                %>
                <h2>Lista Ciudades</h2>
                <table border="1">
                    <tbody>
                        <tr>
                            <td>idCiudad</td>
                            <td>nombreCiudad</td>
                            <th>Opciones</th>
                            <td> </td>
                        </tr>
                        <%
                            CiudadesDto ObjDtoC = new CiudadesDto();
                            CiudadesDao ObjDaoC = new CiudadesDao();
                            ArrayList<CiudadesDto> listado = new ArrayList<CiudadesDto>();
                            listado = ObjDaoC.ConsultarCiudadesTodas();

                            for (int a = 0; a < listado.size(); a++) {

                                out.print("<tr><td>" + listado.get(a).getIdCiudad() + "</td>");
                                out.print("<td>" + listado.get(a).getNombreCiudad() + "</td>");
                                //out.print("<td><a href='../../GestionCiudades?boton=Eliminar&pos="+listado.get(a).getIdCiudad()+"'>Eliminar</a></td></tr>");
%>
                    <td><a href="../../GestionCiudades?boton=Eliminar&pos=<%=listado.get(a).getIdCiudad()%>" onclick="return confirmation()">Eliminar</a></td>
                    <td><a href="../../GestionCiudades?boton=Actualizar&pos=<%=listado.get(a).getIdCiudad()%>" >Actualizar</a></td>
                    </tr>

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

                    </script>
                    <%}%>
                    </tbody>
                </table>

        </section>
        <script>
            $().ready(function () {
            $(".Ciudades").validate({
            rules: {
            Ciudades: {
            required: true,
                    maxlength: 10
            }
            },
                    messages: {
                    Ciudades: {
                    required: "Campo requerido",
                            maxlength: "Maximo {0} caracteres"
                    }
                    }
            });
            });
        </script>

        <!-- InstanceEndEditable -->

        <div id="espacio3"></div>
    </body>
    <foot>
        <div class="pie">VersiÃ³n 1.0 | COPYRIGHT   &copy;2014 SIMVA | ContÃ¡ctenos: 3108549716 | E-mail: contactenos@simva.url.ph</div> 
    </foot>

    <div id="espacio4"></div>

    <!-- InstanceEnd -->
</html>
