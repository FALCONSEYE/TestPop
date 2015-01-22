$(document).on('pageinit', '#login', function(){ 

	$(document).on('click', '#submit', function() { 

		if($('#userName').val().length > 0 && $('#userPassword').val().length > 0) {
			// Send data to server through the Ajax call
			// action is functionality we want to call and outputJSON is our data
			$.ajax({
				url: "second.cfm",
				data: { action : 'getUser', 
						formData : $('#loginForm').serialize() 
				},
				type: 'post',                  
				async: 'true',
				dataType: 'jsonp',
				contentType: "application/json",
				beforeSend: function() {
					// This callback function will trigger before data is sent
					$.mobile.loading("show"); // This will show ajax spinner
				},
				complete: function() {
					// This callback function will trigger on data sent/received complete
					 $.mobile.loading("hide"); // This will hide ajax spinner
				},
				success: function (result) {
					if(result.SUCCESS) {
						// $.mobile.changePage("#second");
						$("#second").pagecontainer("change");                        
					} else {
						alert('Logon unsuccessful!');
					}
				},
				error: function(xhr,ajaxOptions,thrownError) {
					alert('Network error has occurred please try again!');
					alert(xhr.status);
					alert(thrownError);
				}
			});                  
		} else {
			alert('Please fill User ID and Password!');
		}  
		        
		return false; // cancel original event to prevent form submitting
		
	});   
	
});