<%-- 
    Document   : formTiposCombustibles
    Created on : 08-abr-2015, 5:15:21
    Author     : Jairo
--%>

<%@page import="DTO.FuncionarioRolDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.TiposCombustiblesDao"%>
<%@page import="DTO.TiposCombustiblesDto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <head>
        <meta charset="utf-8">
        <!-- InstanceBeginEditable name="doctitle" -->
        <title>Formulario Tipos de Combustible</title>
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
                        <li class="active">Formulario Tipos de Combustible</li>   
                    </ol>
                </div>
                <form class="formularioTiposCombustible" method="post" action="../../GestionTiposCombustibles">

                    <h3>Formulario Tipos de Combustible</h3>

                    Código Tipo Combustible: <input type="text" name="idTiposCombustibles" value="" required="" /><br>
                    Nombre: <input type="text" name="descripcionTipoCombustible" value="" required="" /><br>

                    <input type="submit" name="enviar" value="Guardar" />
                                  
                    <!--input type="submit" name="boton" value="Consultar" /-->
                 <%
                    
                    if (request.getParameter("tipoCombustible") != null) {

                        out.print("<h3>" + request.getParameter("tipoCombustible") + "</h3>");
                    }
                %>
                <h2>Listado Tipos de Combustibles</h2>
                <table border="1">
                    
                    <tbody>
                 
                        <tr>
                            <td>Código Tipo de Combustibles</td>
                            <td>Nombre</td>
                            <th>Opción</th>
                            <td> </td>
                        </tr>

                        <%
                            TiposCombustiblesDto ObjDtoTico = new TiposCombustiblesDto();
                            TiposCombustiblesDao ObjDaoTico = new TiposCombustiblesDao();
                            ArrayList<TiposCombustiblesDto> listadoTiposCombustibles = new ArrayList<TiposCombustiblesDto>();
                            listadoTiposCombustibles = ObjDaoTico.ConsultarTiposCombustiblesTodos();

                            for (int a = 0; a < listadoTiposCombustibles.size(); a++) {

                                out.print("<tr><td>" + listadoTiposCombustibles.get(a).getIdTiposCombustibles()+ "</td>");
                                out.print("<td>" + listadoTiposCombustibles.get(a).getDescripcionTipoCombustible()+ "</td>");
                                //out.print("<td><a href='../../GestionCiudades?boton=Eliminar&pos=" + listadoMarcas.get(a).getIdMarcas() + "'>Eliminar</a></td></tr>");
                        %>
                 
                    </form> 
                   
                    <td><a href="../../GestionTiposCombustibles?enviar=Eliminar&pos=<%=listadoTiposCombustibles.get(a).getIdTiposCombustibles()%>" onclick="return confirmation()">Eliminar</a></td>
                    <!--td><a href="../../GestionTiposCombustibles?boton=Actualizar&pos=<%=listadoTiposCombustibles.get(a).getIdTiposCombustibles()%>" >Actualizar</a></td-->
           </tr>
                    <script type="text/javascript">

                        function confirmation() {
                            var elim = confirm('Esta seguro de eliminar el Tipo de Combustible ?');
                            if (elim) {
                                alert("Tipo de Combustible Eliminado");
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
                $(".formularioTiposCombustible").validate({
                    rules: {
                        idTiposCombustibles :{
                            required: true,
                            maxlength: 10
                        },
                        descripcionTipoCombustible: {
                            required: true,
                            maxlength: 10
                        }
                    },
                    messages: {
                        idTiposCombustibles :{
                            required: "Campo requerido",
                            maxlength: "Maximo {0} caracteres"
                        },
                        descripcionTipoCombustible: {
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
