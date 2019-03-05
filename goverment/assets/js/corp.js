function displayContact(reg_id){
	$.ajax({
		url:  site_url("ajax/ajax/getContact"),
		method: "POST",
		data: {
			"reg_id"	: 	reg_id,
			"type"		: 	"corp",
		},
		success			: 	function(response){
			//console.log(response);
			var res = JSON.parse(response);
			$("#website").html(res['website']);
			$("#email").html(res['email']);
			$("#mobile").html(res['mobile']);
			$("#phone").html(res['phone']);
			$("#corp_name").html(res['corp_name']);
			$("#corp_id").html(res['reg_id']);
		}
	});
}