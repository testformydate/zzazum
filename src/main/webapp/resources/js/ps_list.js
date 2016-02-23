$(document).ready(function() {
    var track_Num = 7; //total loaded record group(s)
    var track_Count = 7;
    var loading  = false; //to prevents multiple ajax loads
    var track_Size = $("#psListSize").val();
    var sycro = 'false';
    
    $(window).scroll(function() { //detect page scroll
    	if(track_Size > track_Num){
    		 if(Math.ceil($(window).scrollTop()) + $(window).height() == $(document).height()&& sycro=="false")  //user scrolled to bottom of the page?
    	        {	
    			 sycro="true";
    	        	$(".ps_loading_image").show();
    	        	setTimeout(function(){
	    	        	$.ajax({
	    	        		type: "GET",
	    	        		url: "psListPart?method=listPart&track_Num="+track_Num+"&track_Count="+track_Count,
	    	        		success: function(jdata){
		    	        		$(jdata).each(function(index,objArr){
		    	        		var str = "<div class='ps_card'><div class='ps_card_title'>";
		    	        			str += "<p class='ps_card_location card_click'><a href='#'><b>"+objArr.ps_location+"</b></a></p>";
		    	        			str += "</div><div class='ps_card_list_body'>";
		    	        			str += "<img class='card_all_image card_click card_detail_click'id='list"+objArr.ps_no+"' src='resources/ps_images/postscript/"+objArr.ps_image+"' onclick='detailClick("+ objArr.ps_no +")'>";
		    	        			str += "<div class='ps_card_profile'><img src='resources/ps_images/profile/"+objArr.mb_image+"'>";
		    	        			str += "</div><div class='ps_card_content'><div class='ps_card_day'>"+objArr.ps_date +"</div>";
		    	        			str += "<div class='ps_card_title ellipsText card_click' onclick='detailClick("+ objArr.ps_no +")'>"+objArr.ps_title+"</div>";
		    	        			str += "<div class='ps_card_etc'><span class='ps_card_clip'><img class='ps_icon' src='resources/ps_icon/clip.png'>"+ objArr.ps_clip + "</span><span class='ps_card_likes'><img class='ps_icon card_click' id='pslike"+ objArr.ps_no +"' src='resources/ps_icon/like.png' onclick='likeClick("+ objArr.ps_no +")'><span>"+ objArr.ps_like+"</span></span>";
		    	        			str += "<span class='ps_card_comments'><img class='ps_icon' src='resources/ps_icon/views.png'>"+objArr.ps_hits +"</span></div></div></div></div>";
		    	        			
		    	        			$(".ps_show_list").append(str);
		    	        		});
		    	        		$(".ps_loading_image").hide();
		    	        		track_Num += track_Count;
		    	        		
		    	        		if(track_Num >= track_Size) track_Num= track_Size;
		    	        		sycro="false";
		    	        		}
	    	        	});
    	        	},1000);
    	            
    	        }
    	}
       
        });
    
    $(".bestPlanner_Click").click(function(){
    	var ps_id = $(this).attr('id');
    	$("#bestPLIn").attr("value",ps_id);
    	$("#bestPL").attr("action","psListSort");;
    	$("#bestPL").submit();
    });
});

function detailClick(ps_no){
	$.ajax({
		url:'psHits',
		type:'post',
		data:{"ps_no":ps_no},
		success:function(){}});
	
	$("#detailNo").attr("value", ps_no);
	$("#detailForm").attr("action","psListDetail");
	$("#detailForm").submit();
}

function likeClick(ps_no){
	var mem_id = $("#detailId").val();
	var likeValNode = $("#pslike"+ps_no).next();
	var likeVal = parseInt(likeValNode.text());
	
	if(mem_id == "" || mem_id == 'null' ){
		alert("로그인해주세요!")
		return;
	}
	
	$.ajax({
		type: "post",
		url: "psUpdateLike",
		data: {"sortLike" : "pslike", "ps_no" : ps_no, "mem_id" : mem_id},
		success: function(jdata){
    		if(jdata.trim() ==="like"){
    			likeVal += 1;
    			likeValNode.html(likeVal);
    		}else if(jdata.trim() === "dislike"){
    			likeVal -= 1;
    			likeValNode.html(likeVal);
    		}	
    	}
	});
}
