$(document).ready(function(){
	$(".ps_like").click(function(){
		xlike = $(this).attr("id");
		var like = $("." + xlike).val();
		var mem_id = $("#getId").val();
		var likeNode = $(this).prev();
		var likeVal = parseInt(likeNode.html());
		$.ajax({
    		type: "post",
    		url: "psUpdateLike",
    		data: {"sortLike" : like, "ps_no" : $("#detailNo").val(), "mem_id" : mem_id},
    		success: function(jdata){
        		if(jdata.trim() ==="like"){
        			$("." + xlike).attr("value",'like');
        			$("#" + xlike).attr("src","resources/ps_icon/like.png");
        			likeNode.html(likeVal+1);
        		}else if(jdata.trim() === "dislike"){
        			$("." + xlike).attr("value",'dislike');
        			$("#" + xlike).attr("src","resources/ps_icon/dislike.png");
        			likeNode.html(likeVal-1);
        		}
        			
        	}
    	});
	});
	
	$(".pd_like").click(function(){
		xlike = $(this).attr("id");
		var like = $("." + xlike).val();
		var mem_id = $("#getId").val();
		var likeNode =$(this).parent().next();
		var likeVal =  parseInt(likeNode.html());
		$.ajax({
    		type: "post",
    		url: "psUpdateLike",
    		data: {"sortLike" : like, "ps_no" : $("#detailNo").val(), "mem_id" : mem_id, "pd_no" : xlike.substr(6,7)},
    		success: function(jdata){
        		if(jdata.trim() ==="like"){
        			$("." + xlike).attr("value",'like');
        			$("#" + xlike).attr("src","resources/ps_icon/like.png");
        			likeNode.html(likeVal+1);
        		}else if(jdata.trim() === "dislike"){
        			$("." + xlike).attr("value",'dislike');
        			$("#" + xlike).attr("src","resources/ps_icon/dislike.png");
        			likeNode.html(likeVal-1);
        		}
        			
        	}
    	});
	});
});