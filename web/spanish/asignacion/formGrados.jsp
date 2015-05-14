<%-- 
    Document   : formGrados
    Created on : 04-abr-2015, 21:36:59
    Author     : Jairo
--%>

<%@page import="DTO.FuncionarioRolDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.GradosDao"%>
<%@page import="DTO.GradosDto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="../js/jquery.js"></script>
        <script type="text/javascript" src="../js/jquery.validate.js"></script>
        <script type="text/javascript" src="../js/additional-methods.js"></script>
        <title>Formulario Grados</title>
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
        <h1>LISTADO GENERAL DE GRADOS</h1>
        <h2>SIMVA</h2>
    </center>
    <form name="Grados" action="../../GestionGrados"  method="post">
        Codigo: <input type="text" name="idGrados" value="" /></br> </br>
        Nombre Grado: <input type="text" name="descripcionGrado" value="" />

        <input type="submit" name="boton" value="enviar" />
        <input type="submit" name="boton" value="consultar" />

    </form>

    <%
        if (request.getParameter("Estado") != null) {

            out.print("<h3>" + request.getParameter("Estado") + "</h3>");
        }
    %>

    <h2>Lista Grados!</h2>
    <table border="2">

        <tbody>
            <tr>
                <td>Codigo</td>
                <td>Nombre Grado</td>
                <th>Opciones</th>
                <td> </td>
            </tr>
            <%
                GradosDto ObjDtoGra = new GradosDto();
                GradosDao ObjDaoGra = new GradosDao();
                ArrayList<GradosDto> listado = new ArrayList<GradosDto>();
                listado = ObjDaoGra.ConsultarGradosTodos();

                for (int a = 0; a < listado.size(); a++) {

                    out.print("<tr><td>" + listado.get(a).getIdGrados() + "</td>");
                    out.print("<td>" + listado.get(a).getDescripcionGrado() + "</td>");
                    //out.print("<td><a href='../../GestionCiudades?boton=Eliminar&pos="+listado.get(a).getIdCiudad()+"'>Eliminar</a></td></tr>");
%>
        <td><a href="../../GestionGrados?boton=Eliminar&pos=<%=listado.get(a).getIdGrados()%>" onclick="return confirmation()">Eliminar</a></td>
        <td><a href="../../GestionGrados?boton=Actualizar&pos=<%=listado.get(a).getIdGrados()%>" >Actualizar</a></td>
    </tr>

    <script type="text/javascript">

        function confirmation() {
            var elim = confirm('Esta seguro de eliminar el Grado ?');
            if (elim) {
                alert("Grado Eliminado");
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
