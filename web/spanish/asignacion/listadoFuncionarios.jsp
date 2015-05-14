<%-- 
    Document   : listadoFuncionarios
    Created on : 06-abr-2015, 0:07:44
    Author     : Jairo
--%>

<%@page import="DTO.FuncionarioRolDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.FuncionariosDao"%>
<%@page import="DTO.FuncionariosDto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="../js/jquery.js"></script>
        <script type="text/javascript" src="../js/jquery.validate.js"></script>
        <script type="text/javascript" src="../js/additional-methods.js"></script>
        <title>Formulario Listado Funcionarios</title>
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
        <h1>LISTADO GENERAL DE FUNCIONARIOS</h1>
        <h2>SIMVA</h2>
    </center>
    <form name="listadoFuncionarios" action="../../GestionFuncionarios"  method="post">
        <label for="numeroDocumento">Cedula:</label>
        <input name="numeroDocumento" id="numeroDocumento" type="text" placeholder= "Ej. 79'399.894" tabindex="1" required maxlength="10">

        <!--input type="submit" name="enviar" value="enviar" /-->
        <input type="submit" name="enviar" value="Consultar" />

    </form>

    <%
        if (request.getParameter("Estado") != null) {

            out.print("<h3>" + request.getParameter("Estado") + "</h3>");
        }
    %>

    <h2>LISTADO GENERAL DE FUNCIONARIOS</h2>
    <table border="1">

        <tbody>
            <tr>
                 <th>Cedula:</th>
                <th>Primer Apellido</th>
                <th>segundo Apellido</th>
                <td> </td>
            </tr>
            <%
                FuncionariosDto ObjDtoFunci = new FuncionariosDto();
                FuncionariosDao ObjDaoFunci = new FuncionariosDao();
                ArrayList<FuncionariosDto> listadoFuncionarios = new ArrayList<FuncionariosDto>();
                listadoFuncionarios = ObjDaoFunci.ConsultarFuncionarios();
                for (int a = 0; a < listadoFuncionarios.size(); a++) {
                    %>   
                    <tr><td>listadoFuncionarios.get(a).getNumeroDocumento()</td>
                    <tr><td>listadoFuncionarios.get(a).getApellido1() </td>
                   <td> listadoFuncionarios.get(a).getApellido2()</td>
                    
            
       <!--     
        <td><a href="../../GestionFuncionarios?boton=Eliminar&pos=<%=listadoFuncionarios.get(a).getNumeroDocumento()%>" onclick="return confirmation()">Eliminar</a></td>
        <td><a href="../../GestionFuncionarios?boton=Actualizar&pos=<%=listadoFuncionarios.get(a).getNumeroDocumento()%>" >Actualizar</a></td>
-->
   </tr>

    <script type="text/javascript">

        function confirmation() {
            var elim = confirm('esta seguro de eliminar el Funcionario ?');
            if (elim) {
                alert("Funcionario Eliminado");
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
