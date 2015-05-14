<%-- 
    Document   : formRh
    Created on : 04-abr-2015, 23:25:42
    Author     : Jairo
--%>

<%@page import="DTO.FuncionarioRolDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.RhDao"%>
<%@page import="DTO.RhDto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="../js/jquery.js"></script>
        <script type="text/javascript" src="../js/jquery.validate.js"></script>
        <script type="text/javascript" src="../js/additional-methods.js"></script>
        <title>Formulario Rh</title>
        <%
    HttpSession miSession = request.getSession(); 
    if(miSession.getAttribute("usuario")!=null){
        FuncionarioRolDto usuario = new FuncionarioRolDto();
        
        usuario = (FuncionarioRolDto)miSession.getAttribute("usuario");
        String nomUsuario = usuario.getUsuarioLogin();
    %>
    </head>
    <%
    }else{response.sendRedirect("/ProyectoSimva/spanish/index-es.jsp");}
    %>
    <body>
    <center>
        <h1>LISTADO GENERAL DE GRUPOS SANGUINEOS</h1>
        <h2>SIMVA</h2>
    </center>
    <form name="Rh" action="../../GestionRh"  method="post">
        Codigo: <input type="text" name="idRh" value="" /></br> </br>
        Nombre: <input type="text" name="descripcionRh" value="" />

        <input type="submit" name="boton" value="enviar" />
        <input type="submit" name="boton" value="consultar" />

    </form>

    <%
        if (request.getParameter("Estado") != null) {

            out.print("<h3>" + request.getParameter("Estado") + "</h3>");
        }
    %>

    <h2>Lista Rh</h2>
    <table border="2">

        <tbody>
            <tr>
                <td>Codigo</td>
                <td>Nombre</td>
                <th>Opciones</th>
                <td> </td>
            </tr>
            <%
                RhDto ObjDtoRh = new RhDto();
                RhDao ObjDaoRh = new RhDao();
                ArrayList<RhDto> listadoRh = new ArrayList<RhDto>();
                listadoRh = ObjDaoRh.ConsultarRhTodos();

                for (int a = 0; a < listadoRh.size(); a++) {

                    out.print("<tr><td>" + listadoRh.get(a).getIdRh() + "</td>");
                    out.print("<td>" + listadoRh.get(a).getDescripcionRh() + "</td>");
                    //out.print("<td><a href='../../GestionCiudades?boton=Eliminar&pos="+listado.get(a).getIdCiudad()+"'>Eliminar</a></td></tr>");
%>
        <td><a href="../../GestionRh?boton=Eliminar&pos=<%=listadoRh.get(a).getIdRh()%>" onclick="return confirmation()">Eliminar</a></td>
        <td><a href="../../GestionRh?boton=Actualizar&pos=<%=listadoRh.get(a).getIdRh()%>" >Actualizar</a></td>
    </tr>

    <script type="text/javascript">

        function confirmation() {
            var elim = confirm('Esta seguro de eliminar el Rh ?');
            if (elim) {
                alert("Rh Eliminado");
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
</body>
</html>
