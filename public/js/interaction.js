// JavaScript Document
$(document).ready(function(){
$('.browse').trigger('click');
$('.quan').change(function(){
	var par=$(this).parent().parent();
	$('.owe',par).html($(this).val()*$('.per',par).html());
});
$('.earnpoints ul li a').bind('click',share);
$('.file').click(function(){$('.browse').trigger('click');})
$('#specialurl').focus($(this).attr('value','http://www.iwannaeat.com/invite345'));
$('.close').click(function(){$(this).parent().parent().hide();$('#popup_holder').hide();$('.forgotpasswordbox').hide();});
$('.opted').live('click',opted);
   $("#closebox").click(function(){ $(".forgotpasswordbox").slideUp("slow")});
$('.del_item').live('click',deleteitem);
randomindex();


//$( "#datepicker" ).datepicker();
// For Set preference page


//$("ul.cusineselect li").click(function(obj){

//$('#tags_2').tagsInput({
       //         width: 'auto',
            //  //  onChange: function(elem, elem_tags)
             //   {
            //        var languages = ['php','ruby','javascript'];
             //       $('.tag', elem_tags).each(function()
              //      {
             //           if($(this).text().search(new RegExp('\\b(' + languages.join('|') + ')\\b')) >= 0)
              //              $(this).css('background-color', 'yellow');
             //       });
            //    }
          //  });

//if($("ul.cusineselect1 li").hasClass('activatedveg')){
//$("ul.cusineselect1 li").removeClass("activatedveg");

//}

//$(this).find("input").attr("checked",true);
//$(this).addClass("activated");
//limitUserchoice($(this).find("input"));


//})


//$("ul.cusineselect1 li").click(function(obj){
//$(this).find("input").attr("checked",true);

//$(this).addClass("activatedveg");

//deSelectAll($(this).find("input"));


//})


// For Set preference page


$("ul.cusineselect li").click(function(obj){



if($("ul.cusineselect1 li").hasClass('activatedveg')){
$("ul.cusineselect1 li").removeClass("activatedveg");

}

$(this).find("input").attr("checked",true);
$(this).addClass("activated");
limitUserchoice($(this).find("input"));


})


$("ul.cusineselect1 li").click(function(obj){
$(this).find("input").attr("checked",true);

$(this).addClass("activatedveg");

deSelectAll($(this).find("input"));


})





//$('#wrapper input').focus(function(){$(this).addClass('focus');$(this).attr('value','');$(this).css('color','#333');});
//$('#wrapper input').focusout(function(){$(this).removeClass('focus');if($(this).val()==''){$(this).val($(this).attr('rel'));$(this).css('color','#ccc');}else{$(this).css('color','#333');}});

$('.clear_text').focus(function(){

$(this).addClass('focus');

if ($(this).val()=='email' || $(this).val()=='password'   || $(this).val()=='Your Name' || $(this).val()=='Your Location')
   { $(this).attr('value',''); }

$(this).css('color','#333');

});
$('.clear_text').focusout(function(){

$(this).removeClass('focus');if($(this).val()==''){$(this).val($(this).attr('rel'));$(this).css('color','#ccc');}else{$(this).css('color','#333');}

});

$('.enter_text').focus(function(){$(this).addClass('focus');$(this).css('color','#333');});


$('.enter_text').focusout(function(){

$(this).removeClass('focus');if($(this).val()==''){$(this).css('color','#ccc');}else{$(this).css('color','#333');}

});



$('.band img').bind('click',inline);
$('#addnewdeal').bind('click',addnewdeal);
$('.bus_back').live('click',addnewdeal_bac);
$('.schedule').live('click',schedulecontent);
$('.previewitem').live('click',preview);
$('.loc ul li').bind('click',selectlocation);

// $('.band button').live('click',updatedata);




$('.pagination a').css('display','none');
$('.pagination em').css('display','none');
$('.previous_page').css('display','block');
$('.next_page').css('display','block');
$('.previous_page').html($('.back a').html());
$('.pagination span.previous_page').css('display','none');
$('.next_page').html($('.showmore a').html());







$('.band .cancel').live('click',updatecancel);
$('.band input').live('keypress',updatedatakey);
$('.del_item').live('click',deleteitem);
$('.tabs li').bind('click',tabbing);
$('.detailstick').css('padding-top',$('.detailspace').height()+'px');
$('#savelocation').live('click',savelocation);
$('#addnewlocation').live('click',addnewlocation);
$('.myorders ul li').live('click', selectmonth);
$('.mail li').bind('click',sendinvitee);
$('.fc-event-title').live('dblclick', showdelete);
$('.share ul li').click(function(){
	
	$('.share ul li').removeClass('act');
	$(this).addClass('act');
	
	});

function showdelete(e)
{
var temp=$(this).html();	
var eventtitle = prompt('Edit Title', $(this).html());

 if (eventtitle) $(this).html(eventtitle);
     else $(this).html(temp);
	 
	 //$(this).html();
}


$('#savecuisines').click(function(){
	
	
	var par=$(this).parent();
	var cusinecnt=$('ul li.activated', par).length;
	if(cusinecnt<3&&!$('ul li.veg', par).hasClass('activatedveg'))
	{
		$('.err',par).show();return false;
	}	
	else
	{
		$('.err',par).hide();return false;
	}
	
	});
	
	//forgot password email confirmation on hom page
	$('.memberlogin #submit').click(function(){
		
		$('.memberlogin .msg').fadeIn("slow", function() {$(this).fadeOut(3000) });
		
	});
	//email invitation send
	$('.share .save').click(function(){
		
		$('.share .msg').fadeIn("slow", function() {$(this).fadeOut(3000) });
		
	});
	//getting listed conirmation
	$('#getlisted .sub_location').click(function(){
		
		$('#getlisted .msg').fadeIn("slow", function() {$(this).fadeOut(3000) });
		
	});


// $('.friends').hover(function(){$('a',this).css('background-image','url("images/icon_hover.jpg")')});
// $('.friends').mouseout(function(){$('a',this).css('background-image','url("images/icons.jpg")')});

// $('.mobapp').hover(function(){$('a',this).css('background-image','url("images/icon_hover.jpg")')});
// $('.mobapp').mouseout(function(){$('a',this).css('background-image','url("images/icons.jpg")')});

$('.getlisted').bind('click',popupscreen4);
 // $('.showmore a').bind('click',showmore);
// $('#login, #log').bind('click',popupscreen);
$('#signup').bind('click',popupscreen3);
$('#sign').bind('click',popupscreen3);
$('.buynowmealdetail').bind('click',popupscreen2);
$('#popup_holder').bind('click',cleanscr);
$('.cusine_types li').click(function(){
	
	$('.cusine_types li').removeClass('selected');
	$(this).addClass('selected');
	$('.cusine_type_selected').html($(this).html());
	})
$(window).resize(function(){popupcss();});

$(window).scroll(function(){
	if($(window).scrollTop()>25)
		{
			$('.detailspace #detailcaption').css('box-shadow','0 0px 0px 0px #333');
			$('.todays-deals .stick_bg').css('box-shadow','box-shadow','0 0px 0px 0px #333');
		}
		else
		{
			$('.detailspace #detailcaption').css('box-shadow','0 0px 0px 0px #333');
			$('.todays-deals .stick_bg').css('box-shadow','0 0px 0px 0px #333');
		}
});



$('.todays-deals ul li .tag').live('mouseover',todaysdealslinktag);
$('.todays-deals ul li a').live('mouseover',todaysdealslink);
$('.todays-deals ul li a').live('mouseout',tdlinkout);	
$('.todays-deals ul li img').live('mouseout',todaysdealsimg);	
$('.todays-deals ul li img').live('mouseover',todaysdealsimg);
$('.todays-deals ul li a').live('mouseenter',todaysdealslink);
	
	$('.showmore a').hover(function(){$(this).removeClass('icons');$(this).addClass('iconhover');$(this).css('text-decoration','underline');});
	$('.showmore a').mouseout(function(){$(this).addClass('icons');$(this).removeClass('iconhover');$(this).css('text-decoration','none');})
	$('.option span,.option input').click(function(){
		$('.option input').removeAttr('checked');
		var par=$(this).parent();
		$('input', par).attr('checked','checked');
		
		if($(this).hasClass('cc'))
		{	
			$('.cashdetails').hide();
			$('.carddetails').show();
			$('.pointdetails').hide();
			return false;
		}
		
		if($(this).hasClass('cod'))
		{
			$('.cashdetails').show();
			$('.carddetails').hide();
			$('.pointdetails').hide();
			return false;
		}
		
		if($(this).hasClass('rp'))
		{
			$('.carddetails').hide();
			$('.cashdetails').hide();
			$('.pointdetails').show();
			return false;
		}
		
		});
		
		//profile page food selection

/*
		$('.cuisine').click(function(){
			if($(this).hasClass('veg')&&!$(this).hasClass('activatedveg'))
			{
				$('.cusineselect li').removeClass('activated');
				$(this).addClass('activatedveg');
				$('#cusinemsg').html('You will see <span class="col1">veg</span> choices across <span class="col2">all cuisines</span>');
						
			}
			
			else if($(this).hasClass('noveg')&&!$(this).hasClass('activated'))
			{
				$('.cusineselect li').removeClass('activatedveg');
				$(this).addClass('activated');
				var pend=$('ul.cusineselect li.activated').length;
				
				if(pend<3)
				{
					var more=3-pend
					$('#cusinemsg').html('Please select </br><span class="col2">'+more+' more cuisine(s)</span></br>or select <span class="col1">veg</span>');
				}
				else
				{
					$('#cusinemsg').html('You have to select a minima of <span class="col2">3 Cuisines</span> or select <span class="col1"> veg</span>');	
				}
						
			}
			
			else if($(this).hasClass('veg')&&$(this).hasClass('activatedveg'))
			{
				$(this).removeClass('activatedveg');
				$('#cusinemsg').html('You will see <span class="col1">veg</span> choices across <span class="col2">all cuisines</span>');	
			}
			
			else if($(this).hasClass('noveg')&&$(this).hasClass('activated'))
			{
				$(this).removeClass('activated');	
				var pend=$('ul.cusineselect li.activated').length;
				
				if(pend<3&&pend>0)
				{
					var more=3-pend
					$('#cusinemsg').html('Please select </br><span class="col2">'+more+' more cuisine(s)</span></br>or select <span class="col1">veg</span>');
				}
				else if(pend<=0)
				{
					$('#cusinemsg').html('You have to select a minima of <span class="col2">3 Cuisines</span> or select <span class="col1"> veg</span>');	
				}
				
				else if(pend>=3)
				{
					$('#cusinemsg').html('You have to select a minima of <span class="col2">3 Cuisines</span> or select <span class="col1"> veg</span>');	
				}
			}
			
		});
		
		*/
		$('.share').click(function(){
			
			if($(this).hasClass('set'))
			{
				$(this).removeClass('set');
				$(this).addClass('unset');
			}	
			
			else if(!$(this).hasClass('set'))
			{
				$(this).addClass('set');
				$(this).removeClass('unset');
			}	
			
		});
		
		$('#existlocation').click(function(){
			
			$(this).addClass('add');
			$(this).removeClass('add-dis');
			$('#addlocation').removeClass('add');
			$('#addlocation').addClass('add-dis');
			$('.locationdetails').fadeOut();
			$('.savedlocations').fadeIn();
			//$('.profile .info_adr .edit').show();
			return false;
			
		});
		$('#cancellocation').click(function(){
			
			
			$('#existlocation').addClass('add');
			$('#existlocation').removeClass('add-dis');
			$('#addlocation').removeClass('add');
			$('#addlocation').addClass('add-dis');
			$('.locationdetails').fadeOut();
			$('.savedlocations').fadeIn();
			//$('.profile .info_adr .edit').show();
			return false;
			
		});
		
		$('#addlocation').click(function(){
		
			$(this).addClass('add');
			$(this).removeClass('add-dis');
			$('#existlocation').removeClass('add');
			$('#existlocation').addClass('add-dis');
			//$('.locationdetails input').attr('value','');
			$('.locationdetails').fadeIn();
			$('#savelocation').hide();
			$('#addnewlocation').show();
			//$('.savedlocations').fadeOut();
            $("#preference_first_name").val($("#first_name").html())
            $("#preference_last_name").val($("#last_name").html())

			return false;	
		});
		
		$('.opt_location').live('click', selectlocationprofile);
		$('.edit').live('click', edit);
		function edit(e)
		{	
		//$('.profile .info_adr .edit').hide();
		var par=$(this).parent();
//$('.locationdetails input').attr('value','');
            //$('.locationdetails #locationname').val($('ul li:nth-child(1)',par).html());
            //$('.locationdetails #place').val($('ul li:nth-child(3)',par).html());
            //$('.locationdetails #street').val($('ul li:nth-child(4)',par).html());
            //$('.locationdetails #landmark').val($('ul li:nth-child(5)',par).html());
            //$('.locationdetails #state').val($('ul li:nth-child(5)',par).html());
            //$('.locationdetails #city').val($('ul li:nth-child(6)',par).html());
            //$('.locationdetails #zip').val($('ul li:nth-child(7)',par).html());
            //$('.savedlocations').fadeOut();
		$('.locationdetails').fadeIn();
		$('#savelocation').show();
		$('#addnewlocation').hide();
		return false;
		
		}
		
		//$('.edit').click(function(){alert('hi');});
		//$('#forgotpassword').click(function(){$('.forgotpasswordbox').slideDown();return false;});

                  $('#forgotpassword').click(function(){ $(".forgotpasswordbox").slideToggle("slow"); });

	designtable();
	

	
	

}); //ready ends

function showmore(e)
{	
	//$('.todays-deals ul').html("<li class='left'><a href='mealdetail.html'><p class='icons'>Applewood Bacon and Cheddar Sliders</p><img src='images/1.jpg' /></a></li><li><a href='mealdetail.html'><p class='icons'>Applewood Bacon and Cheddar Sliders</p><img src='images/1.jpg' /></a></li><li class='left'><a href='mealdetail.html'><p class='icons'>Applewood Bacon and Cheddar Sliders</p><img src='images/1.jpg' /></a></li><li><a href='mealdetail.html'><p class='icons'>Applewood Bacon and Cheddar Sliders</p><img src='images/1.jpg' /></a></li><li class='left'><a href='mealdetail.html'><p class='icons'>Applewood Bacon and Cheddar Sliders</p><img src='images/1.jpg' /></a></li><li><a href='mealdetail.html'><p class='icons'>Applewood Bacon and Cheddar Sliders</p><img src='images/1.jpg' /></a></li>");       
	$('.todays-deals ul').html("");                       
	var block1,block2,block3,block4,block5,block6;
	for(i=1;i<7;i++)
	{
		var numRand = Math.floor(Math.random()*9)
		if(i==1)
		{
			block1=numRand;
		}
		
		else if(i==2)
		{
			if(numRand!=block1)
			{
				block2=numRand;
			}
			else{i=i-1;}
		}
		
		else if(i==3)
		{
			if(numRand!=block1&&numRand!=block2)
			{
				block3=numRand;
			}
			else{i=i-1;}
		}
		
		else if(i==4)
		{
			if(numRand!=block1&&numRand!=block2&&numRand!=block3)
			{
				block4=numRand;
			}
			else{i=i-1;}
		}
		
		else if(i==5)
		{
			if(numRand!=block1&&numRand!=block2&&numRand!=block3&&numRand!=block4)
			{
				block5=numRand;
			}
			else{i=i-1;}
		}
		
		else if(i==6)
		{
			if(numRand!=block1&&numRand!=block2&&numRand!=block3&&numRand!=block4&&numRand!=block5)
			{
				block6=numRand;
			}
			else{i=i-1;}
		}
		
		
	}
	//alert(block1+"  "+block2+"  "+block3+"  "+block4+"  "+block5+"  "+block6);
	randomize(block1);
	randomize(block2);
	randomize(block3);
	randomize(block4);
	randomize(block5);
	randomize(block6);
}



function randomize(num)
{
	 switch (num) { 
	 	 case 0: 
          $('.todays-deals ul').append("<li class='left'><a href='mealdetail.html'><p class='icons'>Applewood Bacon and Cheddar Sliders</p><img src='images/0.jpg' /></a></li>");  
		  break;
	 
        case 1: 
          $('.todays-deals ul').append("<li class='left'><a href='mealdetail.html'><p class='icons'>Applewood Bacon and Cheddar Sliders</p><img src='images/1.jpg' /></a></li>");  
		  break;
		    
		case 2: 
          $('.todays-deals ul').append("<li class='left'><a href='mealdetail.html'><p class='icons'>Applewood Bacon and Cheddar Sliders</p><img src='images/2.jpg' /></a></li>");  
		  break;
		  
		  case 3: 
          $('.todays-deals ul').append("<li class='left'><a href='mealdetail.html'><p class='icons'>Applewood Bacon and Cheddar Sliders</p><img src='images/3.jpg' /></a></li>");  
		  break;
		  
		  case 4: 
          $('.todays-deals ul').append("<li class='left'><a href='mealdetail.html'><p class='icons'>Applewood Bacon and Cheddar Sliders</p><img src='images/4.jpg' /></a></li>");  
		  break;
		  
		  case 5: 
          $('.todays-deals ul').append("<li class='left'><a href='mealdetail.html'><p class='icons'>Applewood Bacon and Cheddar Sliders</p><img src='images/5.jpg' /></a></li>");  
		  break;
		  
		  case 6: 
          $('.todays-deals ul').append("<li class='left'><a href='mealdetail.html'><p class='icons'>Applewood Bacon and Cheddar Sliders</p><img src='images/6.jpg' /></a></li>");  
		  break;  
		  
		  case 7: 
          $('.todays-deals ul').append("<li class='left'><a href='mealdetail.html'><p class='icons'>Applewood Bacon and Cheddar Sliders</p><img src='images/7.jpg' /></a></li>");  
		  break; 
		  
		  case 8: 
          $('.todays-deals ul').append("<li class='left'><a href='mealdetail.html'><p class='icons'>Applewood Bacon and Cheddar Sliders</p><img src='images/8.jpg' /></a></li>");  
		  break; 
		  
		  case 9: 
          $('.todays-deals ul').append("<li class='left'><a href='mealdetail.html'><p class='icons'>Applewood Bacon and Cheddar Sliders</p><img src='images/9.jpg' /></a></li>");  
		  break; 
		  
		  case 10: 
          $('.todays-deals ul').append("<li class='left'><a href='mealdetail.html'><p class='icons'>Applewood Bacon and Cheddar Sliders</p><img src='images/10.jpg' /></a></li>");  
		  break; 
		  
		 
       
    }	
	
	$('.todays-deals ul li:nth-child(2)').removeClass('left');
	$('.todays-deals ul li:nth-child(4)').removeClass('left');
	$('.todays-deals ul li:nth-child(6)').removeClass('left');
	
	
	
}
function popupscreen(e)
{
	$('#popup_holder').css('height',$(document).height()+'px');
	$('#popup_holder,#form_holder').css('width',$(document).width()+'px');
	$('#form').css('width','360px');
	$('#popup_holder').show();
	$('#form').show();
	$('#form img').show();
	$('#form #signupform,.mealsholder, .memberpoint,.yo').hide();$('#form #loginform').show();
	//var mgrtop=($(window).height()-$('#form').height())/2;
	var mgrlft=($(window).width()-$('#form').width())/2;
	$('#form').css('top','110px');
	$('#form').css('left',mgrlft+'px');
	$('#form').css('text-align','left');
	$('#form img').css('margin', '20px 0px 20px 49px');
	//$('#popup_holder').css('background','red');
}

function popupscreen4(e)
{
	$('#popup_holder').css('height',$(document).height()+'px');
	$('#popup_holder,#form_holder').css('width',$(document).width()+'px');
	$('#form').css('width','360px');
	$('#popup_holder').show();
	$('#form').show();
	$('#form #signupform,#getlisted,.mealsholder, .memberpoint,.yo').hide();$('#form #getlisted').show();	
	var mgrlft=($(window).width()-$('#form').width())/2;
	$('#form').css('top','110px');
	$('#form').css('left',mgrlft+'px');
	$('#form').css('text-align','left');
	
}

function popupscreen2(e)
{
	$('#popup_holder').css('height',$(document).height()+'px');
	$('#popup_holder,#form_holder').css('width',$(document).width()+'px');
	$('#popup_holder').show();
	$('#form').css('width','750px');
	$('#form, .mealsholder, .memberpoint, .yo').show();
	$('#form').css('text-align','center');
	$('#form img').hide();
	$('#form #loginform,#getlisted').hide();$('#form #signupform').show();
	var mgrtop=($(window).height()-$('#form').height())/2;
	var mgrlft=($(window).width()-$('#form').width())/2;
	$('#form').css('top','0px');
	$('#form').css('left',mgrlft+'px');
	//$('#popup_holder').css('background','red');
	$('#form').css('text-align','center');
}

function popupscreen3(e)
{
	$('#popup_holder').css('height',$(document).height()+'px');
	$('#popup_holder,#form_holder').css('width',$(document).width()+'px');
	$('#popup_holder').show();
	$('#form').css('width','460px');
	$('#form,#form img ').show();
	$('#form img').css('margin', '20px 0px 20px 19px');
	$('#form').css('text-align','center');
	$('#form #loginform,.mealsholder, .memberpoint, .yo,#getlisted').hide();$('#form #signupform').show();
	var mgrtop=($(window).height()-$('#form').height())/2;
	var mgrlft=($(window).width()-$('#form').width())/2;
	$('#form').css('top','10px');
	$('#form').css('left',mgrlft+'px');
	$('#form').css('text-align','center');
	//$('#popup_holder').css('background','red');
}

function popupcss()
{
	$('#popup_holder').css('height',$(document).height()+'px');
	$('#popup_holder,#form_holder').css('width',$(document).width()+'px');	
	var mgrtop=($(window).height()-$('#form').height())/2;
	var mgrlft=($(window).width()-$('#form').width())/2;
	$('#form').css('top','10px');
	$('#form').css('left',mgrlft+'px');
}

function cleanscr(e)
{
	$('#popup_holder').hide();
	$('#form').hide();
}




function selectlocationprofile(e)
{	

	$('.opt_location input').removeAttr('checked');
	$('.opt_location .info_adr ul').removeClass('primary');
	$('input',this).attr('checked','checked');
	$('.info_adr ul',this).addClass('primary');
	$('.opt_location ul li.primaryaddr').remove();
	//var par=$(this).parent();
	$('ul',this).append("<li class='primaryaddr'>primary</li>");
}

function inline(e)
{	
	$('.band input, .band button, .band .cancel').remove();
	$('.band span,.band img').show();
	$('.band input').remove();
	$(this).removeClass('edit');
	$(this).hide();
	
	var par=$(this).parent();
	//$('span',par).hide();
	//$(par).append("<input type='text' class='inline focus'><button class='savepersonal'>Save changes</button><a href='#' class='cancel'>cancel</a> ");
	//$('input',par).val($('span',par).html());
	$('input',par).focus();
	$('label',par).css('line-height','38px');
	if($(this).hasClass('u-name'))
	{
		$(par).append("<input type='text' id='user_name' name='user_name' class='inline focus' placeholder='Enter new username'><button class='savepersonal' type='submit' id='u_name_submit'  name='u_name_submit'>Save changes</button><a href='#' class='cancel'>cancel</a> ");
	}

	else if($(this).hasClass('p-word'))
	{
		$('span',par).hide();
		$(par).append("<input type='password' id='o_pass' name='o_pass' class='inline focus' placeholder='Enter old password'><input type='password' id='n_pass' name='n_pass' class='inline focus' placeholder='Enter new password' style='left:276px'><input type='password' id='cn_pass' name='cn_pass' class='inline focus' placeholder='Confirm new password' style='left:476px'><button class='savepersonal' style='left:710px;' id='pass_submit'  type='submit' name='pass_submit'>Save changes</button><a href='#' class='cancel' style='left:862px'>cancel</a> ");
	}

	else if($(this).hasClass('e-mail'))
	{
		$(par).append("<input type='text' id='e_mail' name='e_mail' class='inline focus' placeholder='Enter new email'><button class='savepersonal' type='submit' id='e_mail_submit' name='e_mail_submit'>Save changes</button><a href='#' class='cancel'>cancel</a> ");
	}
        else if($(this).hasClass('phone'))
	{
		$(par).append("<input type='text' id='phone' name='phone' class='inline focus' placeholder='Enter new phone no.'><button class='savepersonal' type='submit' id='phone_submit' name='phone_submit'>Save changes</button><a href='#' class='cancel'>cancel</a> ");
	}
}

function updatedata(e)
{
	var par=$(this).parent();
	var val=$('input',par).val();
	$(this).remove();
	$('input',par).remove();
	$('.cancel',par).remove();
	$('span',par).show();
	$('img',par).show();
	$('span',par).html(val);
	$('label',par).css('line-height','38px');
}

function updatecancel(e)
{
var par=$(this).parent();	
$(this).remove();
$('input',par).remove();
$('button',par).remove();
$('span',par).show();
$('img',par).show();
}
	
function updatedatakey(e)
{
	var code = (e.keyCode ? e.keyCode : e.which);
	if(code==13||code==9)
	{
	var par=$(this).parent();
	var val=$(this).val();
	$(this).remove();
	$('span',par).html(val);
	$('label',par).css('line-height','20px');
	}
}


function todaysdealslink(e){
	
	$(this).parent().css('background','#eef3e2');
	$(this).css('background','#eef3e2');
	$('p',this).removeClass('icons');
	$('p',this).addClass('iconhover');
	
	
	$('p',this).css('background-position','430px -196px');
	$('p',this).css('background-repeat','no-repeat');
	}
	
function todaysdealslinktag(e){
	var par=$(this).parent();
	$(this).parent().css('background','#eef3e2');
	$('a',par).css('background','#eef3e2');
	
	
	$('p',par).removeClass('icons');
	$('p',par).addClass('iconhover');
	
	
	$('p',par).css('background-position','430px -196px');
	$('p',par).css('background-repeat','no-repeat');
	}
	
	
function todaysdealsimg(e){
	var par=$(this).parent();
	var grandpar=$(par).parent();
	$(grandpar).css('background','#eef3e2');
	$(par).css('background','#eef3e2');
	$('p',grandpar).removeClass('icons');
	$('p',grandpar).addClass('iconhover');

	
	$('p',this).css('background-position','430px -196px');
	$('p',this).css('background-repeat','no-repeat');

	}
	
function tdimgout(e){
	var par=$(this).parent();
	var grandpar=$(par).parent();
	$(grandpar).css('background','#fff');
	$(par).css('background','#fff');
	$('p',grandpar).addClass('icons');
	$('p',grandpar).removeClass('iconhover');

	
	$('p',this).css('background-position','430px -196px');
	$('p',this).css('background-repeat','no-repeat');
	}
	
function tdlinkout(e){
	
	$(this).parent().css('background','#fff');
	$(this).css('background','#fff');
	$('p',this).addClass('icons');
	$('p',this).removeClass('iconhover');

	
	$('p',this).css('background-position','430px -196px');
	$('p',this).css('background-repeat','no-repeat');
	}

function tabbing(e)
{
$('.tabs li').removeClass('activetab');
$(this).addClass('activetab');
var ind=$(this).index();
ind=ind+1;
$('.tab-content li').removeClass('visible');
$('.tab-content li:nth-child('+ind+')').addClass('visible');
if(ind==2)
	{
		//$('.tab-content li:nth-child(2)').html('');
	
	$('.fc-button-today').click();
	//alert('done;')
	
	}
}

function addnewdeal(e)
{
$('.approved').hide();
$('#add-deal-location').show();	
$('.preview').hide();	
$('#schedule_content').hide();
}

function addnewdeal_bac(e)
{
$('.approved').show();
$('#add-deal-location').hide();	
$('.preview').hide();	
$('#schedule_content').hide();
}

function schedulecontent(e)
{

$('.approved').hide();
$('#add-deal-location').hide();
$('.preview').hide();	
$('#schedule_content').show();	

}

function preview(e)
{
$('.approved').hide();
$('#add-deal-location').hide();	
$('#schedule_content').hide();	
$('.preview').show();	
}


function selectlocation(e)
{
$('.loc ul li').removeClass('selectedloc_leftnav');
$(this).addClass('selectedloc_leftnav');
$('#add-deal-location h4').html("Add Deal for "+$(this).html()+"<span class='bus_back'><a href='#'>back</a></span>");
	
}

function selectmonth(e)
{
	$('.myorders ul li a .month').removeClass('first');
	$('.myorders ul li a .orders').removeClass('orderslatest');
	$('a .month',this).addClass('first');
	$('a .orders',this).addClass('orderslatest');
	
}

function designtable()
{
$('#plantable tr:odd').addClass('alt');	
}


function deleteitem(e)
{
$(this).parent().remove();
return false;	
}

function savelocation(e)
{
	$('.newlocation').fadeOut();
	//$('.profile .info_adr .edit').show();
	return false;	 
}

function addnewlocation(e)
{
	
	$('.newlocation').fadeOut();
	//$('.profile .info_adr .edit').show();
	return false;	 
}

function sendinvitee(e)
{
	$('.mail li').removeClass('active');
	$(this).addClass('active');
	if($(this).index()==0)
	{
		
		$('.inviteppl .notify').html('Add friends email addresses ');
	}
	
	else if($(this).index()==1)
	{
		
		$('.inviteppl .notify').html('Add friends gmail addresses ');
	}
	
	else if($(this).index()==2)
	{
		$('.inviteppl .notify').html('Add friends facebook addresses ');
		
	}
	
}

function share(e)
{
	$('#popup_holder').css('height',$(document).height()+'px');
	$('#popup_holder,#form_holder').css('width',$(document).width()+'px');
	$('#popup_holder').show();
	$('#form').css('width','750px');
	$('#form').css('top','100px');
	var mgrlft=($(window).width()-$('#form').width())/2;
	$('#form').css('left',mgrlft+'px');
	
	
	if($(this).hasClass('inv'))
	{
		$('#form .share .msg').hide();
		$('#form #loginform,.mealsholder, .memberpoint, .yo,#getlisted,#signupform, #share2, #share3').hide();$('#form,#share1').show();
	}
	
	else if($(this).hasClass('feedback'))
	{
		
		$('#form .share .msg').hide();
		$('#form #loginform,.mealsholder, .memberpoint, .yo,#getlisted,#signupform,#share1, #share3').hide();$('#form,#share2').show();
	}
	
	else if($(this).hasClass('morefood'))
	{
		$('#form #loginform,.mealsholder, .memberpoint, .yo,#getlisted,#signupform,#share2, #share1,#form').hide();
	}
}



function editValue(ID){

    var FirstName=$("#first_name_"+ID).html();
    $("#preference_first_name").val(FirstName);

    var LastName=$("#last_name_"+ID).html();
    $("#preference_last_name").val(LastName);


    var Address1=$("#address_line1_"+ID).html();
    $("#preference_address_line1").val(Address1);


    var Address2=$("#address_line2_"+ID).html();
    $("#preference_address_line2").val(Address2);


    var City=$("#city_"+ID).html();
    $("#preference_city").val(City);


    var State=$("#state_"+ID).html();
    $("#preference_state").val(State);


    var Telephone_Number=$("#phone_"+ID).html();
    $("#preference_phone").val(Telephone_Number);


    var Zip_Code=$("#zipcode_"+ID).html();
    $("#preference_zipcode").val(Zip_Code);

    var Address_tag=$("#address_tagged_as_"+ID).html();
    $("#preference_address_tagged_as").val(Address_tag);


    $("#update").val("yes");
    $("#locationid").val(ID) ;

}


function randomindex()
{
	var randomindex = Math.floor(Math.random()*4);
	$('#log_ban').removeClass();
	$('#log_ban').addClass('loginbanner'+randomindex);
	//alert(randomindex);
}


function DisableDelivery(status){

if(status)
{
    $("#restaurant_delivery_staff").attr('disabled', true);
}else{
    $("#restaurant_delivery_staff").attr('disabled', false);
}


}

function limitUserchoice(Id){
var flag=0;
// deselect Vg

$("#user_is_veg").attr("checked", false);

$("li.noveg input").each(function(id){

    if($(this).attr("checked")=="checked"){
        flag=flag+1;
    }

})

if(flag>3){
Id.attr("checked",false);
Id.parent().removeClass("activated");
$("#cuisine_update").show()
$("#cuisine_update").html("You can select only 3 cuisine");
}else{
$("#cuisine_update").hide()
}

}


function deSelectAll(ID){



if(ID.attr("checked")){

$("li.noveg input").each(function(id){
    $(this).attr("checked",false);
$(this).parent().removeClass("activated");

})
}
$("#cuisine_update").hide();

}

function opted(e)
{
	$('.opted_popup').show();
	$('.opted_popup').css('left',(($(document).width()-500)/2)+'px');
	$('.opted_popup').css('top',(($(document).height()-$('.opted_popup').height())/2)+'px');
	$('#popup_holder').show();
	$('#popup_holder').css('height',$(document).height()+'px');
	$('#popup_holder').css('width',$(document).width()+'px');
	return false;
}
function randomindex()
{
	var randomindex = Math.floor(Math.random()*4);
	$('#log_ban').removeClass();
	$('#log_ban').addClass('loginbanner'+randomindex);
	//alert(randomindex);
}
$('.deletemeal').live('click',confirmdelete);

function confirmdelete(e)
{
	var par=$(this).parent();
	$('.confirmation',par).slideDown(300);
	$('#popup_holder').show();
	$('#popup_holder').css('height',$(document).height()+'px');
	$('#popup_holder').css('width',$(document).width()+'px');
	return false;
}

// $('.confirmation a').live('click',clean);
//$('.fixthisdeal').live('click',fixthisdeal);
//$('.icondetail').live('click',icondetail);

function icondetail(e)
{
	$('#popup_holder').show();
	$('#popup_holder').css('height',$(document).height()+'px');
	$('#popup_holder').css('width',$(document).width()+'px');
	$('.icondetails_popup').show();
	var mgrlft=($(window).width()-$('.icondetails_popup').width())/2;
	$('.icondetails_popup').css('left',mgrlft+'px');
	return false;
}
function highlightred(mcCbxCheck)
{
	 if($(this).is(':checked')) {
       $(this).next().addClass('err_field');



    }

	else{   $(this).next().removeClass('err_field');}
}

$('.share ul li').click(function(){

	$('.share ul li').removeClass('act');
	$(this).addClass('act');

	});
randomindex();


$(".toggle-nutrition").click(function () {
	  $(this).toggleClass('collapse');
      $("#nutrition-values").slideToggle("fast");
	  return false;
    });



function opted(e)
{
	$('.opted_popup').show();
	$('.opted_popup').css('left',(($(document).width()-500)/2)+'px');
	$('.opted_popup').css('top',(($(document).height()-$('.opted_popup').height())/2)+'px');
	$('#popup_holder').show();
	$('#popup_holder').css('height',$(document).height()+'px');
	$('#popup_holder').css('width',$(document).width()+'px');
	return false;
}


function confirmValidate(){
var Check = confirm("do you want to delete it");
if(Check){
    return true;
}else{
    return false;
}

}

function ToggleFacts(){
  $(this).toggleClass('collapse');
      $("#nutrition-values").slideToggle("fast");
      return false;
}
	



function opted(e)
{
	$('.opted_popup').show();
	$('.opted_popup').css('left',(($(document).width()-640)/2)+'px');
	$('.opted_popup').css('top',(($(document).height()-$('.opted_popup').height())/2)+'px');
	$('#popup_holder').show();
	$('#popup_holder').css('height',$(document).height()+'px');
	$('#popup_holder').css('width',$(document).width()+'px');
	return false;	
}	
function popupcss()
{
	$('#popup_holder').css('height',$(document).height()+'px');
	$('#popup_holder,#form_holder').css('width',$(document).width()+'px');	
	var mgrtop=($(window).height()-$('#form').height())/2;
	var mgrlft=($(window).width()-$('#form').width())/2;
	$('#form').css('top','110px');
	$('#form').css('left',mgrlft+'px');
	var mgrlft=($(window).width()-$('.alertmsg').width())/2;
	var mgrhgt=($(window).height()-$('.alertmsg').height())/2;
	$('.alertmsg').css('left',mgrlft+'px');
	$('.alertmsg').css('top',mgrhgt+'px');
}

function cleanscr(e)
{
	$('#popup_holder').hide();
	$('#form').hide();
	$('.confirmation').hide();
	$('.icondetails_popup').hide();
	$('.opted_popup').hide();
	$('.alertmsg').hide();
}




function selectlocationprofile(e)
{	

	$('.opt_location input').removeAttr('checked');
	$('.opt_location .info_adr ul').removeClass('primary');
	$('input',this).attr('checked','checked');
	$('.info_adr ul',this).addClass('primary');
	$('.opt_location ul li.primaryaddr').remove();
	//var par=$(this).parent();
	$('ul',this).append("<li class='primaryaddr'>primary</li>");
}

function sum()
{ 
 var Sum_value = 0;
 $("#target_input input").each(function()
   {
    Sum_value+= parseInt($(this).val());
   })

  $("#result_target").html(Sum_value)
    }

	
