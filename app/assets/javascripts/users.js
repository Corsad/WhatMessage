$(document).ready(function(){
	$("#inbox-btn").click(function(){
		$("#sent-div").removeClass("hidden").addClass("show");
		$("#friend-div").removeClass("show").addClass("hidden");
		$("#received-div").removeClass("show").addClass("hidden");
		$("#friend-list-btn").removeClass("btn-primary").addClass("btn-secondary");
		$("#send-mess-btn").removeClass("btn-primary").addClass("btn-secondary");
		$("#inbox-btn").removeClass("btn-secondary").addClass("btn-primary");
	});

	$("#send-mess-btn").click(function(){
		$("#received-div").removeClass("hidden").addClass("show");
		$("#friend-div").removeClass("show").addClass("hidden");
		$("#sent-div").removeClass("show").addClass("hidden");
		$("#friend-list-btn").removeClass("btn-primary").addClass("btn-secondary");
		$("#inbox-btn").removeClass("btn-primary").addClass("btn-secondary");
		$("#send-mess-btn").removeClass("btn-secondary").addClass("btn-primary");
	});

	$("#friend-list-btn").click(function(){
		$("#received-div").removeClass("show").addClass("hidden");
		$("#sent-div").removeClass("show").addClass("hidden");
		$("#friend-div").removeClass("hidden").addClass("show");
		$("#send-mess-btn").removeClass("btn-primary").addClass("btn-secondary");
		$("#inbox-btn").removeClass("btn-primary").addClass("btn-secondary");
		$("#friend-list-btn").removeClass("btn-secondary").addClass("btn-primary");
	});


});
