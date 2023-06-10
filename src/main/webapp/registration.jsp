<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up Form by Colorlib</title>

<link href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.33.1/sweetalert2.css" rel="stylesheet" type="text/css">

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.33.1/sweetalert2.js"></script>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>

	<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
	
	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>
					
						<form method="post" action="register" class="register-form"
							id="register-form">
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="name" id="name" placeholder="Your Name"  />
							</div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="email" id="email" placeholder="Your Email" />
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" id="pass" placeholder="Password" />
							</div>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_pass" id="re_pass"
									placeholder="Repeat your password" />
							</div>
							<div class="form-group">
								<label for="contact"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="text" name="contact" id="contact" 
									placeholder="Contact no" />
							</div>
							<div class="form-group">
								<input type="checkbox" name="agree-term" id="agree-term" 
									class="agree-term" /> <label for="agree-term"
									class="label-agree-term"><span><span></span></span>I
									agree all statements in <a href="#" class="term-service">Terms
										of service</a></label>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Register" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/signup-image.jpg" alt="sing up image">
						</figure>
						<a href="login.jsp" class="signup-image-link">I am already
							member</a>
					</div>
				</div>
			</div>
		</section>


	</div>
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
</body>
<script type="text/javascript">
var status1=document.getElementById("status").value;
console.log(status1);
	if(status1==="success"){
	//swal("Account","Created Successfully","success");
	/*swal("Good job!", "You clicked the button!", {
		icon : "success",
		buttons: {
			confirm: {
				className : 'btn btn-success'
			}
		},
	});*/
	Swal.fire({        
        type: 'success',
        title: 'Registered Successfully',
        showConfirmButton: false,
        timer: 1500
     })
	 /*   $(document).ready(function(){       
	        Swal.fire({        
	           type: 'success',
	           title: 'Your work has been done',
	           showConfirmButton: false,
	           timer: 1500
	        })
	    });*/
	}
	/*else if(status1==="failure"){
		//swal("Wrong","email or password","error");
	    $(document).ready(function(){       
	        Swal.fire({        
	           type: 'error',
	           title: 'something went wrong!',
	           showConfirmButton: false,
	           timer: 1500
	        })
	    });
	}*/
	if(status1==="invalidName"){
		$(document).ready(function(){       
	        Swal.fire({        
	           type: 'error',
	           title: 'Enter valid Name',
	           showConfirmButton: false,
	           timer: 1500
	        })
	    });
	}
if(status1==="invalidEmail"){
	$(document).ready(function(){       
        Swal.fire({        
           type: 'error',
           title: 'Enter valid Email',
           showConfirmButton: false,
           timer: 1500
        })
    });
	}
if(status1==="invalidPwd"){
	$(document).ready(function(){       
        Swal.fire({        
           type: 'error',
           title: 'Enter valid password',
           showConfirmButton: false,
           timer: 1500
        })
    });
}
if(status1==="invalidconfirmPwd"){
	$(document).ready(function(){       
        Swal.fire({        
           type: 'error',
           title: 'password Mismatch',
           showConfirmButton: false,
           timer: 1500
        })
    });
}
if(status1==="invalidMobile"){
	$(document).ready(function(){       
        Swal.fire({        
           type: 'error',
           title: 'Enter Mobile number',
           showConfirmButton: false,
           timer: 1500
        })
    });
}
if(status1==="invalidMobileLength"){
	$(document).ready(function(){       
        Swal.fire({        
           type: 'error',
           title: 'Enter 10 digit Mobile number',
           showConfirmButton: false,
           timer: 1500
        })
    });
}
	
</script>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>