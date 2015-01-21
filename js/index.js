var cfcLoc = "http://http://dev.subaruadfund.com/cfcs/subaruPOP.cfc";
$(document).on('pageinit', '#login', function(){ 
	$(document).on('click', '#submit', function() { 
		// catch the form's submit event
		if($('#userName').val().length > 0 && $('#userPassword').val().length > 0) {
			// Send data to server through the Ajax call
			// action is functionality we want to call and outputJSON is our data
			$.ajax({
				url: cfcLoc,
				data: { action : 'getUser', 
						formData : $('#check-user').serialize() 
				},
				type: 'post',                  
				async: 'true',
				dataType: 'json',
				beforeSend: function() {
					// This callback function will trigger before data is sent
					$.mobile.loading("show"); // This will show ajax spinner
				},
				complete: function() {
					// This callback function will trigger on data sent/received complete
					 $.mobile.loading("hide"); // This will hide ajax spinner
				},
				success: function (result) {
					//var jsonData = $.parseJSON(result);
					if(result.STATUS) {
						$.mobile.changePage("#second");                        
					} else {
						alert('Logon unsuccessful!');
					}
				},
				error: function (request,error) {
					// This callback function will trigger on unsuccessful action               
					alert('Network error has occurred please try again!');
				}
			});                  
		} else {
			alert('Please fill User ID and Password!');
		}          
		return false; // cancel original event to prevent form submitting
	});   
});