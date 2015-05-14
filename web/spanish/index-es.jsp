<!DOCTYPE html PUBLIC>

<html>
   <%
//response.setHeader("Cacahe-Control", "no-store");
%>

<head>
<meta http-equiv="Expires" content="0">
<meta http-equiv="Last-Modified" content="0">
<meta http-equiv="Cache-Control" content="no-cache, mustrevalidate">
<meta http-equiv="Pragma" content="no-cache">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<meta charset="utf-8">
	<title>.::Login::SIMVA::.</title>

<link href="css/stilos.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="img/logos/logo.ico" type="image/x-icon">
<link href="css/animations.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script type="text/javascript" src="js/additional-methods.js"></script>
</head>

<%
  HttpSession miSession = request.getSession();  
%>
<body onLoad="if ('Navigator' == navigator.appName) document.forms[0].reset();">

	<div class="heading">
    	Sistema de información
    </div>
    
<div id="wrapper" class="FadeIn">
    <div class="user-icon"></div>
    <div class="pass-icon"></div>
 

    <form id="login-form" name="login-form" class="login-form" action="../GestionLogin" method="post" >
    
     <div class="logo">
      </div>
    <div class="header">

        <h1>SIMVA</h1>
        <span>Digita los datos correspondientes</span>
    </div>
  
    <div class="content">
    	<input name="usuario" type="text" id="usuario" class="input username" placeholder="Username*" required tabindex="1">
        <input name="clave" type="password" id="clave" class="input password" placeholder="Password*" required tabindex="2">
    </div>

    <div id="temp">

                
    </div>

    <div class="footer">
        <input type="submit" name="Boton" value="Login" class="button" >
        

    </div>

</form>
<a id="olvCon" href="">Si olvido la contraseña por favor comuniquese con el Admisnitrador del sistema.</a>
</div>

    <div class="gradient"></div>
    	<div class="clr"></div>
    

<script>
        $().ready(function() {
            $(".login-form").validate({ 
                rules:{
                    usuario:{
                        required: true,
                        minlength: 3,
                        maxlength: 15,
                        lettersonly: true
                    },
                    clave:{
                        required: true,
                        minlength: 6,
                        maxlength: 16
                    }
                },
                messages:{
                    usuario:{
                        required: "        Campo Requerido",
                        minlength: "Minimo {0} caracteres",
                        maxlength: "Maximo {0} caracteres",
                        lettersonly: "Digite solo letras"
                    },
                    clave:{
                        required: "         Campo Requerido",
                        minlength: "Minimo {0} caracteres",
                        maxlength: "Maximo {0} caracteres"
                    }
                }
            });
        });

        $().ready(function() {
            $(".username").focus(function() {
                $(".user-icon").css("left","-48px");
            });
            $(".username").blur(function() {
                $(".user-icon").css("left","0px");
            });
            
            $(".password").focus(function() {
                $(".pass-icon").css("left","-48px");
            });
            $(".password").blur(function() {
                $(".pass-icon").css("left","0px");
            });
        });

            function redireccion(){
                if(document.getElementById("admin").checked){
                    document.getElementById("login-form").action="administrador.jsp";
                }
                if(document.getElementById("asig").checked){
                    document.getElementById("login-form").action="asignacion.jsp";
                }
                if(document.getElementById("mant").checked){
                    document.getElementById("login-form").action="mantenimiento.jsp";
                }
            }
            
    </script>

    <%
        String mensaje =(String) miSession.getAttribute("mensaje");
        miSession.invalidate();
        if(mensaje !=null){
  
        if(mensaje.equals("1")){
            
        %>
        <script type="text/javascript"> alert("Usuario o Contraseña incorrectos") </script>
        <%
        }
        } 
        %>
    
</body>
</html>