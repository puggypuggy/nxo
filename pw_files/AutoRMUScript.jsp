

var webapp = "/internetbanking";
var msgRightClick = "Banco Exterior";
var niftyOk=(document.getElementById && document.createElement && Array.prototype.push);
var niftyCss=false;

closeAllPopUps();


//Verifica si alguna ventana pop up esta abierta cada vez y si es asi la cierra
function closeAllPopUps()
{	
	closePopUp("TimeOutWindow");
	closePopUp("PopUpWindow");
}


//Verifica si una ventana pop up esta abierta cada vez y si es asi la cierra
function closePopUp(windowID)
{	
	if(parent.top[windowID] != null){
	  if(parent.top[windowID] != false && parent.top[windowID] != undefined)
	  {  
		if(parent.top[windowID].closed == false)
		{
		  parent.top[windowID].close();
		  parent.top[windowID] = false;
		}			     
	  }
	}
}

function openPopUp(link, style)
{	
    closeAllPopUps();
	
	standar = "resizable=no,scrollbars=yes,toolbar=no,menubar=no,location=no,directories=no,copyhistory=no";

	if(style == "HELP")
		style = standar + ",width=450,height=250,top="+ ((screen.availWidth - 150)/4) +",left="+(screen.availWidth/3);
	else
	if(style == "SUMMARY")
		style = standar + ",width=640,height=350,top="+ ((screen.availWidth - 150)/4) +",left="+(screen.availWidth/4);
	else
	if(style == "BRANCH") //Pop de Sucursales
		style = standar + ",width=400,height=300,top="+ ((screen.availWidth - 150)/4) +",left="+(screen.availWidth/3);
	else
	if(style == "PDF")
		style = standar + ",width=850,height=600,top="+ ((screen.availWidth - 150)/10) +",left="+(screen.availWidth/10);
	else
	if(style == "EXPORT1")
		style = standar + ",width=0,height=0,top=" + screen.availWidth + ",left=" + screen.availWidth;
	else
	if(style == "EXPORT2")
		style = standar + ",width=0,height=0,top=" + screen.availWidth + ",left=" + screen.availWidth;
	else
	if(style == "EXPORT3")
		style = standar + ",width=850,height=600,top="+ ((screen.availWidth - 150)/10) +",left="+(screen.availWidth/10);
	else
	if(style == "EXPORT4")
		style = standar + ",width=850,height=600,top="+ ((screen.availWidth - 150)/10) +",left="+(screen.availWidth/10);	
	else
	if(style == "EXPORT5")
		style = standar + ",width=850,height=600,top="+ ((screen.availWidth - 150)/10) +",left="+(screen.availWidth/10);	
	else
	if(style == "EXPORT6")
		style = standar + ",width=850,height=600,top="+ ((screen.availWidth - 150)/10) +",left="+(screen.availWidth/10);

	parent.top.PopUpWindow= window.open(link ,"PopUpWindow", style); 
	 

   setTimeout("reloadExpirationTime();",100);	

} 


function habilitarIndexDesdePopup()
{
	//Se oculta el mensaje de espera
	window.opener.document.getElementById('wait').style.display="none"; 
	
	//Se coloca readOnly el campo userid
	window.opener.document.getElementById('UserId').disabled=false;
	
	//Se habilitan los botones y links
	if (navigator.appName =="Microsoft Internet Explorer" )
	{
	   window.opener.document.getElementById('UserId').disabled=false;
	   window.opener.document.getElementById('botonLogin').disabled=false;
	   window.opener.document.getElementById('botonNewUser').disabled=false;
	   window.opener.document.getElementById('recoverAlias').disabled=false;
	   window.opener.document.getElementById('recoverPass').disabled=false;
	   window.opener.document.getElementById('userSusp').disabled=false;
	   window.opener.document.getElementById('demo').disabled=false;
	}
}


/* Crea el objeto AJAX.*/
function nuevoAjax()
{ 	
	var xmlhttp=false; 
	try 
	{ 
		// Creacion del objeto AJAX para navegadores no IE
		xmlhttp=new ActiveXObject("Msxml2.XMLHTTP"); 
		
	}
	catch(e)
	{ 
		try
		{ 
			// Creacion del objet AJAX para IE 
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP"); 
		   
		} 
		catch(E) { xmlhttp=false; }
	}
	if (!xmlhttp && typeof XMLHttpRequest!='undefined') { xmlhttp=new XMLHttpRequest(); } 

	return xmlhttp; 
}

function blurify(e) 
{
  if(e) //Netscape    
  { 
	 if(e.which == 3 || e.which == 2)
     {
	    alert(msgRightClick); 
	    return false;
     }
  }  
  else if(window.event) //Internet Explorer
  { 
	 if (window.event.button == 2) 
	 {
	  	alert(msgRightClick);	
	 	return false;
	 }
  }

}

String.prototype.find=function(what){
return(this.indexOf(what)>=0 ? true : false);
}

var oldonload=window.onload;
if(typeof(NiftyLoad)!='function') NiftyLoad=function(){};
if(typeof(oldonload)=='function')
window.onload=function(){oldonload();AddCss();NiftyLoad()};
else window.onload=function(){AddCss();NiftyLoad()};

function AddCss(){
niftyCss=true;
var l=CreateEl("link");
l.setAttribute("type","text/css");
l.setAttribute("rel","stylesheet");
l.setAttribute("media","screen");
document.getElementsByTagName("head")[0].appendChild(l);
}

function Nifty(selector,options){
if(niftyOk==false) return;
if(niftyCss==false) AddCss();
var i,v=selector.split(","),h=0;
if(options==null) options="";
if(options.find("fixed-height"))
    h=getElementsBySelector(v[0])[0].offsetHeight;
for(i=0;i < v.length;i++)
    Rounded(v[i],options);
if(options.find("height")) SameHeight(selector,h);
}
function Rounded(selector,options){
var i,top="",bottom="",v=new Array();
if(options!=""){
    options=options.replace("left","tl bl");
    options=options.replace("right","tr br");
    options=options.replace("top","tr tl");
    options=options.replace("bottom","br bl");
    options=options.replace("transparent","alias");
    if(options.find("tl")){
        top="both";
        if(!options.find("tr")) top="left";
        }
    else if(options.find("tr")) top="right";
    if(options.find("bl")){
        bottom="both";
        if(!options.find("br")) bottom="left";
        }
    else if(options.find("br")) bottom="right";
    }
if(top=="" && bottom=="" && !options.find("none")){top="both";bottom="both";}
v=getElementsBySelector(selector);

for(i=0;i < v.length;i++){
    FixIE(v[i]);
    if(top!="") AddTop(v[i],top,options);
    if(bottom!="") AddBottom(v[i],bottom,options);
    }
}

function AddTop(el,side,options){

var d=CreateEl("b"),lim=4,border="",p,i,btype="r",bk,color;
d.style.marginLeft="-"+getPadding(el,"Left")+"px";
d.style.marginRight="-"+getPadding(el,"Right")+"px";
if(options.find("alias") || (color=getBk(el))=="transparent"){
    color="transparent";bk="transparent"; border=getParentBk(el);btype="t";
    }
else{
    bk=getParentBk(el); border=Mix(color,bk);
    }
d.style.background=bk;
d.className="niftycorners";
p=getPadding(el,"Top");

if(options.find("small")){
    d.style.marginBottom=(p-2)+"px";
    btype+="s"; lim=2;
    }
else if(options.find("big")){
    d.style.marginBottom=(p-10)+"px";
    btype+="b"; lim=8;
    }
else d.style.marginBottom=(p-5)+"px";
for(i=1;i<=lim;i++)
    d.appendChild(CreateStrip(i,side,color,border,btype));
el.style.paddingTop="0";
el.insertBefore(d,el.firstChild);

}

function AddBottom(el,side,options){
var d=CreateEl("b"),lim=4,border="",p,i,btype="r",bk,color;
d.style.marginLeft="-"+getPadding(el,"Left")+"px";
d.style.marginRight="-"+getPadding(el,"Right")+"px";
if(options.find("alias") || (color=getBk(el))=="transparent"){
    color="transparent";bk="transparent"; border=getParentBk(el);btype="t";
    }
else{
    bk=getParentBk(el); border=Mix(color,bk);
    }

d.style.background=bk;
d.className="niftycorners";
p=getPadding(el,"Bottom");
if(options.find("small")){
    d.style.marginTop=(p-2)+"px";
    btype+="s"; lim=2;
    }
else if(options.find("big")){
    d.style.marginTop=(p-10)+"px";
    btype+="b"; lim=8;
    }
else d.style.marginTop=(p-5)+"px";

for(i=lim;i>0;i--)
    d.appendChild(CreateStrip(i,side,color,border,btype));

    
el.style.paddingBottom=0;
el.appendChild(d);

}

function CreateStrip(index,side,color,border,btype){
var x=CreateEl("b");
x.className=btype+index;
x.style.backgroundColor=color;
x.style.borderColor=border;
if(side=="left"){
    x.style.borderRightWidth="0";
    x.style.marginRight="0";
    }
else if(side=="right"){
    x.style.borderLeftWidth="0";
    x.style.marginLeft="0";
    }
return(x);
}

function CreateEl(x){
return(document.createElement(x));
}

function FixIE(el){
if(el.currentStyle!=null && el.currentStyle.hasLayout!=null && el.currentStyle.hasLayout==false)
    el.style.display="inline-block";
}

function SameHeight(selector,maxh){
var i,v=selector.split(","),t,j,els=[],gap;
for(i=0;i < v.length;i++){
    t=getElementsBySelector(v[i]);
    els=els.concat(t);
    }
for(i=0;i < els.length;i++){
    if(els[i].offsetHeight>maxh) maxh=els[i].offsetHeight;
    els[i].style.height="auto";
    }
for(i=0;i < els.length;i++){
    gap=maxh-els[i].offsetHeight;
    if(gap > 0){
        t=CreateEl("b");t.className="niftyfill";t.style.height=gap+"px";
        nc=els[i].lastChild;
        if(nc.className=="niftycorners")
            els[i].insertBefore(t,nc);
        else els[i].appendChild(t);
        }
    }
}

function getElementsBySelector(selector){
var i,j,selid="",selclass="",tag=selector,tag2="",v2,k,f,a,s=[],objlist=[],c;
if(selector.find("#")){ //id selector like "tag#id"
    if(selector.find(" ")){  //descendant selector like "tag#id tag"
        s=selector.split(" ");
        var fs=s[0].split("#");
        if(fs.length==1) return(objlist);
        f=document.getElementById(fs[1]);
        if(f){
            v=f.getElementsByTagName(s[1]);
            for(i=0;i < v.length;i++) objlist.push(v[i]);
            }
        return(objlist);
        }
    else{
        s=selector.split("#");
        tag=s[0];
        selid=s[1];
        if(selid!=""){
            f=document.getElementById(selid);
            if(f) objlist.push(f);
            return(objlist);
            }
        }
    }
if(selector.find(".")){      //class selector like "tag.class"
    s=selector.split(".");
    tag=s[0];
    selclass=s[1];
    if(selclass.find(" ")){   //descendant selector like tag1.classname tag2
        s=selclass.split(" ");
        selclass=s[0];
        tag2=s[1];
        }
    }
var v=document.getElementsByTagName(tag);  // tag selector like "tag"
if(selclass==""){
    for(i=0;i < v.length;i++) objlist.push(v[i]);
    return(objlist);
    }
for(i=0;i < v.length;i++){
    c=v[i].className.split(" ");
    for(j=0;j < c.length;j++){
        if(c[j]==selclass){
            if(tag2=="") objlist.push(v[i]);
            else{
                v2=v[i].getElementsByTagName(tag2);
                for(k=0;k < v2.length;k++) objlist.push(v2[k]);
                }
            }
        }
    }
return(objlist);
}

function getParentBk(x){
var el=x.parentNode,c;
while(el.tagName.toUpperCase()!="HTML" && (c=getBk(el))=="transparent")
    el=el.parentNode;
if(c=="transparent") c="#FFFFFF";
return(c);
}

function getBk(x){
var c=getStyleProp(x,"backgroundColor");
if(c==null || c=="transparent" || c.find("rgba(0, 0, 0, 0)"))
    return("transparent");
if(c.find("rgb")) c=rgb2hex(c);
return(c);
}

function getPadding(x,side){
var p=getStyleProp(x,"padding"+side);
if(p==null || !p.find("px")) return(0);
return(parseInt(p));
}

function getStyleProp(x,prop){
if(x.currentStyle)
    return(x.currentStyle[prop]);
if(document.defaultView.getComputedStyle)
    return(document.defaultView.getComputedStyle(x,'')[prop]);
return(null);
}

function rgb2hex(value){
var hex="",v,h,i;
var regexp=/([0-9]+)[, ]+([0-9]+)[, ]+([0-9]+)/;
var h=regexp.exec(value);
for(i=1;i<4;i++){
    v=parseInt(h[i]).toString(16);
    if(v.length==1) hex+="0"+v;
    else hex+=v;
    }
return("#"+hex);
}

function Mix(c1,c2){
var i,step1,step2,x,y,r=new Array(3);
if(c1.length==4)step1=1;
else step1=2;
if(c2.length==4) step2=1;
else step2=2;
for(i=0;i<3;i++){
    x=parseInt(c1.substr(1+step1*i,step1),16);
    if(step1==1) x=16*x+x;
    y=parseInt(c2.substr(1+step2*i,step2),16);
    if(step2==1) y=16*y+y;
    r[i]=Math.floor((x*50+y*50)/100);
    r[i]=r[i].toString(16);
    if(r[i].length==1) r[i]="0"+r[i];
    }
return("#"+r[0]+r[1]+r[2]);
}

//Valida formato Integer
function enterInteger(e) {

 var kcode; 
 var elem;
 
 if(e.which)//Netscape    
 { 
    kcode=e.which; 
    elem = e.target;
 }  
 else
 if(e.keyCode)//Internet Explorer 
 { 
    kcode=e.keyCode; 
    elem = e.srcElement;
 }

 switch (kcode){
   case 8:
   {
      if(e.keyCode)//Internet Explorer           
        e.returnValue = false;
      break;          
   }   
   default: {
        if ((kcode < 48 || kcode > 57) && kcode != 13)
        { 
          if(e.which)//Netscape 
            e.preventDefault();
          e.returnValue = false;
        }
        
 	}
 }
}

//Teclado Virtual

pinIntroducido = "";
vpinIntroducido = "";
asteriscos = "";
teclasPresionadas = 0;
	
function tituloBarra(){
  window.status = "Teclado Virtual";
  return true;
}

function anadirLetra(valor,frm,tamanio){
  if(teclasPresionadas < tamanio){
    teclasPresionadas++;
    pinIntroducido += valor;
    vpinIntroducido += "*";
    asteriscos += "*";
	if(document.forms[frm].campo.value == 'OPASSWORD'){
	  document.forms[frm].OPASSWORD.value=pinIntroducido;
  	  document.forms[frm].VOPASSWORD.value=vpinIntroducido;
	}
	else if (document.forms[frm].campo.value == 'NPASSWORD'){
  	  document.forms[frm].NPASSWORD.value=pinIntroducido;
   	  document.forms[frm].VNPASSWORD.value=vpinIntroducido;
	}
	else if (document.forms[frm].campo.value == 'CPASSWORD'){
  	  document.forms[frm].CPASSWORD.value=pinIntroducido;
      document.forms[frm].VCPASSWORD.value=vpinIntroducido;
	}
    
  }
}

function quitarLetra(valor,frm){

  if(teclasPresionadas > valor){
    teclasPresionadas -= valor;
    pinIntroducido = pinIntroducido.substring ( 0, teclasPresionadas*12 );
    vpinIntroducido = pinIntroducido.substring ( 0, teclasPresionadas );
    if(document.forms[frm].campo.value == 'OPASSWORD'){
	  document.forms[frm].OPASSWORD.value=pinIntroducido;
	  document.forms[frm].VOPASSWORD.value=vpinIntroducido;
	}
	else if (document.forms[frm].campo.value == 'NPASSWORD'){
  	  document.forms[frm].NPASSWORD.value=pinIntroducido;
	  document.forms[frm].VNPASSWORD.value=vpinIntroducido;
	}
	else if (document.forms[frm].campo.value == 'CPASSWORD'){
  	  document.forms[frm].CPASSWORD.value=pinIntroducido;
  	  document.forms[frm].VCPASSWORD.value=vpinIntroducido;
	}
    asteriscos = asteriscos.substring ( 0, teclasPresionadas );
  } 
  else {
    teclasPresionadas = 0;
    pinIntroducido = "";
    vpinIntroducido = "";
    if(document.forms[frm].campo.value == 'OPASSWORD'){
	  document.forms[frm].OPASSWORD.value=pinIntroducido;
  	  document.forms[frm].VOPASSWORD.value=vpinIntroducido;
	}
	else if (document.forms[frm].campo.value == 'NPASSWORD'){
  	  document.forms[frm].NPASSWORD.value=pinIntroducido;
   	  document.forms[frm].VNPASSWORD.value=vpinIntroducido;
	}
	else if (document.forms[frm].campo.value == 'CPASSWORD'){
  	  document.forms[frm].CPASSWORD.value=pinIntroducido;
  	  document.forms[frm].VCPASSWORD.value=vpinIntroducido;  	  
	}
    asteriscos = "";
  }
}


function setval(valor,frm) {
  pinIntroducido = "";
  asteriscos = "";
  teclasPresionadas = 0;
  vpinIntroducido = "";	
  if(valor == 'OPASSWORD'){
    document.forms[frm].campo.value='OPASSWORD';
    document.forms[frm].OPASSWORD.value='';
    document.forms[frm].VOPASSWORD.value='';
  }
  else if (valor == 'NPASSWORD'){
    document.forms[frm].campo.value='NPASSWORD';
    document.forms[frm].NPASSWORD.value='';
    document.forms[frm].VNPASSWORD.value='';
  }
  else if (valor == 'CPASSWORD'){
    document.forms[frm].campo.value='CPASSWORD';
    document.forms[frm].CPASSWORD.value='';
    document.forms[frm].VCPASSWORD.value='';
  }
}



//Funciones para cerrar
function cerrarIB()
{
  setTimeout("window.top.location='login_logout.jsp';",100);
}


function goToIndex()
{
  setTimeout("parent.window.location.href='" + webapp + "/';",100);
}

function cerrarIBFromPopUp()
{
  setTimeout("opener.parent.window.location.href='" + webapp + "/login_logout.jsp';",100);
}

function goToIndexFromPopUp()
{
  setTimeout("opener.parent.window.location.href='" + webapp + "/';",100);
}


function goToMainPage()
{
  setTimeout("window.location.href='" + webapp + "/body_inimessages.jsp';",100);
}

//ErroresHTML
function monstrarErroresHTML (mensaje){

	document.getElementById("transerrorSpan").innerHTML = mensaje;
	document.getElementById('transerror').style.display='';

}

function ocultarErroresHTML (){

  if(document.getElementById("transerror"))
	  document.getElementById("transerror").style.display="none"; 

}


// Capture keyboard events to filter valid characters only.
function validCharacters(e)
{

	 var kcode; 
	 var elem;
	 
	 if(e.which)//Netscape    
	 { 
	    kcode=e.which; 
	    elem = e.target;
	 }  
	 else
	 if(e.keyCode)//Internet Explorer 
	 { 
	    kcode=e.keyCode; 
	    elem = e.srcElement;
	 }

	if (((kcode>64&&kcode<91)	    ||
	   (kcode>96&&kcode<123)	    ||
	   (kcode>47&&kcode<58)       ||
	   (kcode==164) 				||
	   (kcode==165) 				||
	   (kcode==32))){
	   return true;
 	}
	else{
	   return false;
	}      
}

function URLEncode (clearString) {
  var output = '';
  var x = 0;
  clearString = clearString.toString();
  var regex = /(^[a-zA-Z0-9_.]*)/;
  while (x < clearString.length) {
    var match = regex.exec(clearString.substr(x));
    if (match != null && match.length > 1 && match[1] != '') {
    	output += match[1];
      x += match[1].length;
    } else {
      if (clearString[x] == ' ')
        output += '+';
      else {
        var charCode = clearString.charCodeAt(x);
        var hexVal = charCode.toString(16);
        output += '%' + ( hexVal.length < 2 ? '0' : '' ) + hexVal.toUpperCase();
      }
      x++;
    }
  }
  return output;
}

// Valida que las teclas pulsadas sean permitidas para un Correo Electronico
function ValTeclasEmail(e)
{
	var kcode; 
	var elem;
	 
	 if(e.which)//Netscape    
	 { 
	    kcode=e.which; 
	    elem = e.target;
	 }  
	 else
	 if(e.keyCode)//Internet Explorer 
	 { 
	    kcode=e.keyCode; 
	    elem = e.srcElement;
	 }
	 
   
   if(kcode==44) //coma
   {
 	  if(e.which)//Netscape 
        e.preventDefault();
      e.returnValue = false;
   }
   else
   if(kcode!=8 && kcode!=13 && kcode!=241 && kcode!=209)  //Borrar, Enter, ñ, Ñ
   {   
 	 tecla= String.fromCharCode(kcode)
	//alert(tecla + " " + kcode)

	 re = /^[A-Z, a-z, 0-9,_ ,\-\,.,@]+/;
	 if (!re.test(tecla))
	 {
	 	if(e.which)//Netscape 
            e.preventDefault();
          e.returnValue = false;
	 }
  }  

}


// Valida que sea Correo Electronico y Requerido
function ValEmail(email)
{
  re = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;

  if (email == "") 
     return (false);
  else
  if (!re.test(email))
	return false;
  else
    return true;	

}

function doPrint(){
  if (!window.print) {
    var msg =       "Dear Customer:\n";
        msg = msg + "to use the print boton,\n";
        msg = msg + "please upgrade your browser.";
    alert(msg);

   return;
  }

  if(document.forms[0] != null)
  {
    var tabla780 = document.forms[0].getElementsByTagName('table');
    for(var i=0; i < tabla780.length; i++)
    {
      if (tabla780[i].width == '780')
        tabla780[i].width = '620';
    }
  }
  window.focus();
  window.print();

  if(document.forms[0] != null)
  {
    for(var i=0; i < tabla780.length; i++)
    {
      if (tabla780[i].width == '620')
	    tabla780[i].width = '780';
    }
  }
  return;
}