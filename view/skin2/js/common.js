// JavaScript Document
function confirm_check(url,mess)
{
	anser=confirm(mess)
	
	if(anser==true)
		window.location = url
}
function linkto(url)
{
	window.location = url
}
function createInput(type,name,value,stype)
{
	return '<input type="'+type+'" name="'+name+'" value="'+value+'" "'+stype+'">';
}
function searchMatrix(matrix,col,need)
{
	for(i=0;i < matrix.length ;i++)
		if(matrix[i][col]==need)
			return i
	return -1
}
function getPosOfNode(idparent,eid)
{
	var e = document.getElementById(idparent);
	i=0
	chi=e.childNodes[i]
	while(chi)
	{
		if(chi.id == eid)
			return i
		
		i++
		chi=e.childNodes[i]
	}
	return -1
}

function setCKEditorType(strID, intType)
{
	switch (intType)
	{
		case 0: // giao dien full
		CKEDITOR.replace( strID,
				{
					toolbar : [ ['Source','-','Save','NewPage','Preview','-','Templates'],['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print','SpellChecker','Scayt'],['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],['Form','Checkbox','Radio','TextField','Textarea','Select','Button','ImageButton','HiddenField'],'/',['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],['Link','Unlink','Anchor'],['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],'/',['Styles','Format','Font','FontSize'],['TextColor','BGColor'],['Maximize','ShowBlocks','-','About'] ]
				});
		//CKEDITOR.config.contentsCss = ['../view/skin1/css/ckeditor.css'];
		CKEDITOR.config.height = '400px';
		CKEDITOR.config.width = '500px';
		break;
		
		case 1: //Giao dien simply nhat
		CKEDITOR.replace( strID,
				{
					toolbar : [ ['Bold','Italic','Underline'],['Font','FontSize','TextColor','BGColor'],['Smiley'],['Link','Unlink'],['NumberedList','BulletedList'],['Outdent','Indent'],['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],['RemoveFormat'],['Maximize'] ]
				});
		//CKEDITOR.config.contentsCss = ['../view/skin1/css/ckeditor.css'];
		CKEDITOR.config.height = '400px';
		CKEDITOR.config.width = '500px';
		break;
		
		case 2: //giao dien edit content
		CKEDITOR.replace( strID,
				{
					toolbar : [ ['Source','Bold','Italic','Underline'],['Font','FontSize','TextColor','BGColor'],['Smiley'],['Link','Unlink'],['NumberedList','BulletedList'],['Outdent','Indent'],['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],['RemoveFormat'],['Maximize'],['PasteText','PasteFromWord'],['Flash','Table','SpecialChar'] ]
				});
		//CKEDITOR.config.contentsCss = ['../view/skin1/css/ckeditor.css'];
		CKEDITOR.config.height = '400px';
		CKEDITOR.config.width = '500px';
		break;
		
		case 3:
		CKEDITOR.replace( strID,
				{
					toolbar : [ ['Source','-','Save','NewPage','Preview','-','Templates'],['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print','SpellChecker','Scayt'],['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],['Form','Checkbox','Radio','TextField','Textarea','Select','Button','ImageButton','HiddenField'],'/',['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],['Link','Unlink','Anchor'],['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],'/',['Styles','Format','Font','FontSize'],['TextColor','BGColor'],['Maximize','ShowBlocks','-','About'] ]
				});
		//CKEDITOR.config.contentsCss = ['../view/skin1/css/ckeditor.css'];
		CKEDITOR.config.height = '400px';
		CKEDITOR.config.width = '500px';
		break;
		case 4: //giao dien edit content
		CKEDITOR.replace( strID,
				{
					toolbar : [['Font'] ]
				});
		//CKEDITOR.config.contentsCss = ['../view/skin1/css/ckeditor.css'];
		CKEDITOR.config.height = '100px';
		CKEDITOR.config.width = '300px';
		break;
	}
	
	
}


function importJavaScript(jsFile) {
	
	var scriptElt = document.createElement('script');
	
	scriptElt.type = 'text/javascript';
	
	scriptElt.src = jsFile;
	
	document.getElementsByTagName('head')[0].appendChild(scriptElt);

}


function postStringData(object) {
	var str = "";
	$(object).each(function(){
		str += $(this).attr('name') + "=" + $(this).val() + "&";
	});
	return str;
}

function openDialog(url,width,height) {
    var result = window.showModalDialog(url, "", "dialogWidth:"+width+"px; dialogHeight:"+height+"px;");
}
function daysInMonth(month,year) 
{
	var m = [31,28,31,30,31,30,31,31,30,31,30,31];
	if (month != 2) return m[month - 1];
	if (year%4 != 0) return m[1];
	if (year%100 == 0 && year%400 != 0) return m[1];
	return m[1] + 1;
} 

function toMonth(month)
{
	if(month<10)
		return "0"+month;
	else
		return month;
}
function stringtoNumber(str)
{
	str = (""+str).replace(/,/g,"");
	var num = str*1;
	return num;
}
function formateNumber(num)
{
	ar = (""+num).split("\.");
	div = ar[0];
	mod = ar[1];
	
	arr = new Array();
	block = "";
	
	for(i=div.length-1; i>=0 ; i--)
	{
		
		block = div[i] + block;
		
		if(block.length == 3)
		{
			arr.unshift(block);
			block ="";
		}
		
	}
	arr.unshift(block);
	
	divnum = arr.join(",");
	divnum = trim(divnum,",")
	divnum = divnum.replace("-,","-")
	if(mod == undefined)
		return divnum;
	else
		return divnum+"\."+mod;
}

function numberView(str)
{
	str = (""+str).replace(/,/g,"");
	str = parseFloat(str);
	var obj = new Number(str);
	num=obj.toFixed(2);
	ar = (""+num).split("\.");
	div = ar[0];
	mod = ar[1];
	
	arr = new Array();
	block = "";
	
	for(i=div.length-1; i>=0 ; i--)
	{
		
		block = div[i] + block;
		
		if(block.length == 3)
		{
			arr.unshift(block);
			block ="";
		}
		
	}
	arr.unshift(block);
	
	divnum = arr.join(",");
	divnum = trim(divnum,",")
	divnum = divnum.replace("-,","-")
	if(mod == undefined || mod == 0)
		return divnum;
	else
		return divnum+"\."+mod;
}

function trim(str, chars) {
	return ltrim(rtrim(str, chars), chars);
}
 
function ltrim(str, chars) {
	chars = chars || "\\s";
	return str.replace(new RegExp("^[" + chars + "]+", "g"), "");
}
 
function rtrim(str, chars) {
	chars = chars || "\\s";
	return str.replace(new RegExp("[" + chars + "]+$", "g"), "");
}

function isNumber(char)
{
	if( char!=8 && char!=0 && (char<45 || char>57) )
	{
	//display error message
	//$("#errmsg").html("Digits Only").show().fadeOut("slow");
		return false;
	}
	else true
}
function getFileExt(filepath)
{
	arr = filepath.split("\.");
	return arr[arr.length-1];
}

function numberMod()
{
	$(".error").each(function(index){
		if($(this).text() == "")
		{
			$(this).hide();	
		}
	});
	
	$(".number").keyup(function (e)
	{
		num = formateNumber($(this).val().replace(/,/g,""));
		$(this).val(num)
	});
	$(".number").keypress(function (e)
	{
		
	  	return isNumber(e.which);
	});
}
$(document).ready(function(){
	numberMod();
	
	$(window).resize(function(e) {
		fixlayout();
    });
		   
});

function printObject(o) {
  var out = '';
  for (var p in o) {
    out += p + ': ' + o[p] + '\n';
  }
  alert(out);
}
function logout()
{
	$.blockUI({ message: "<h1>Please wait...</h1>" }); 
	
	$.get(HTTP_SERVER+"?route=sitebar/login/logout", 
		function(data){
			if(data == "true")
			{
				alert("Bạn đã đăng xuất thành công!");
				//window.location = "<?php echo HTTP_SERVER?>site/default/login";
				window.location = HTTP_SERVER;
			}
			else
			{
				
				$('#error').html(data).show('slow');
				
				
			}
			$.unblockUI();
		}
	);	
}
function numToString(n,minl)
{
	var s = String(n);
	if(s.length<=minl)
	{
		s = "0"+s;	
	}
	return s;
}
function toPhpTime(time)
{
	var d = new Date(time);
	
	var s= d.getFullYear()+"-"+ numToString(d.getMonth() + 1 ,2) +"-"+ numToString(d.getDate(),2)+ " "+ d.getHours()+":"+ d.getMinutes()+":"+d.getSeconds();
	return s;
}

function fixlayout()
{
	//alert($('body').width());
	/*if($('body').width()<1000)
	{
		$('.ben-sidebar').hide();
		//$('#ben-logo img').css('height','100px');
	}
	else
	{
		$('.ben-sidebar').show();
	}*/
	
}
function loadLazy() {
	 $('img.lazy').lazy({
        effect: "fadeIn",
        effectTime: 300,
        threshold: 0,
        beforeLoad: function(element) {
			console.log("beforeload");
            $(element).addClass('loading');
        },
        afterLoad: function(element) {
			console.log("afterLoad");
            $(element).removeClass('loading');
        },
		onError: function(element) {
            // called whenever an element could not be handled
        },
        onFinishedAll: function() {
            // called once all elements was handled
        }
    });
}
$(document).ready(function(e) {
    loadLazy();
});