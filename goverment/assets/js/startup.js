function displayContact(reg_id){
	$.ajax({
		url:  site_url("ajax/ajax/getContact"),
		method: "POST",
		data: {
			"reg_id"	: 	reg_id,
			"type"		: 	"startup",
		},
		success			: 	function(response){
			//console.log(response);
			var res = JSON.parse(response);
			$("#website").html(res['website']);
			$("#email").html(res['email']);
			$("#mobile").html(res['mobile']);
			$("#phone").html(res['phone']);
			$("#startup_name").html(res['startup_name']);
			$("#startup_id").html(res['reg_id']);
		}
	});
}