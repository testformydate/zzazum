$(document).ready(function(){
	$(".ps_like").click(function(){
		xlike = $(this).attr("id");
		var like = $("." + xlike).val();
		var mem_id = $("#getId").val();
		var likeNode = $(this).prev();
		var likeVal = parseInt(likeNode.html());
		if(mem_id == "" || mem_id == 'null' ){
			alert("로그인해주세요!")
			return;
		}
		
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
		
		if(mem_id == "" || mem_id == 'null'){
			alert("로그인해주세요!")
			return;
		}
		
		$.ajax({
    		type: "post",
    		url: "psUpdateLike",
    		data: {"sortLike" : like, "ps_no" : $("#detailNo").val(), "mem_id" : mem_id, "pd_no" : xlike.substr(6)},
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
	
	$(".enter_click").keydown(function (key) {
		xlike = $(this).attr("id");
		content = $(this).val();
		var mem_id = $("#getId").val();
		
        if (key.keyCode == 13) {
        	
        	if(mem_id =="" || mem_id=='null'){
        		alert('로그인후 사용가능합니다!');
        		return;
        	}
        	
        	if(content == ""){
    			alert("내용을 입력하세요")
    			return;
    		}
        	$("#insertComment").attr('action',"commentInsert");
        	$("#co_pdno").attr('value', xlike.substr(6));
        	$("#co_comment").attr('value', content);
        	$("#insertComment").submit();
        }
    });
});