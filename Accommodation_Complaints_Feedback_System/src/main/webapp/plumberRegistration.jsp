<%@ include file="/includes/header.jsp" %>
<div class="container-fluid bg">
		<div class="row">
            <div class="col-md-2 col-sm-4 col-xs-12"></div>
			<div class="col-md-2 col-sm-4 col-xs-12"></div>
				<!-- Form Start -->
            <form class="form-container" method="post" action="/plumberRegister" name="plumber_registration_form" id="plumber_registration_form" onsubmit="return validateForm()">
                <h1>Plumber Registration Form</h1>
                <div class="form-group">
                    <label for="staffNo">Staff Number:</label>
                    <input type="text" class="form-control" id="staffNo" name="staffNo" placeholder="Staff Number">
                </div>
                <div class="form-group">
                    <label for="fname">First Name:</label>
                    <input type="text" class="form-control" id="fname" name="fname" placeholder="First Name">
                </div>
                <div class="form-group">
                    <label for="lname">Last Name:</label>
                    <input type="text" class="form-control" id="lname" name="lname" placeholder="Last Name">
                </div>
                <div class="form-group">
                    <label for="uname">Username:</label>
                    <input type="text" class="form-control" id="uname" name="uname" placeholder="Username">
                </div>
                <div class="form-group">
                    <label for="phoneNumber">Phone Number:</label>
                    <input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="Phone Number">
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                </div>
                <div class="form-group">
                    <label for="confirmPassword">Confirm Password</label>
                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" onkeyup='check();'> <span id='message'></span>
                </div>
                  <button type="submit" class="btn btn-success btn-block">Submit</button>
                <br>
                <button type="button" class="btn btn-danger btn-block" onClick="window.location.href='adminUI.jsp'">Back</button>
            </form>
				<!-- Form End-->
            <script>
                function validateForm()                                    
                    { 
                		var staffNo = document.forms["plumber_registration_form"]["staffNo"];
                        var fname = document.forms["plumber_registration_form"]["fname"];               
                        var lname = document.forms["plumber_registration_form"]["lname"];
                        var uname = document.forms["plumber_registration_form"]["uname"];
                        var phoneNumber = document.forms["plumber_registration_form"]["phoneNumber"];
                        var password = document.forms["plumber_registration_form"]["password"];
                        var confirmPassword = document.forms["plumber_registration_form"]["confirmPassword"];
                        
                        if (staffNo.value == "")                                  
                        { 
                            window.alert("Please enter your Staff Number."); 
                            staffNo.focus(); 
                            return false; 
                        } 

                        if (fname.value == "")                                  
                        { 
                            window.alert("Please enter your First Name."); 
                            fname.focus(); 
                            return false; 
                        } 

                        if (lname.value == "")                                  
                        { 
                            window.alert("Please enter your Last Name."); 
                            lname.focus(); 
                            return false; 
                        } 

                        if (uname.value == "")                                  
                        { 
                            window.alert("Please enter your Username."); 
                            uname.focus(); 
                            return false; 
                        } 
                        
                        if (phoneNumber.value == "")                                  
                        { 
                            window.alert("Please enter your Phone Number."); 
                            phoneNumber.focus(); 
                            return false; 
                        } 
                        
                        if (password.value == "")                        
                        { 
                            window.alert("Please enter your Password."); 
                            password.focus(); 
                            return false; 
                        } 
                        
                        if (confirmPassword.value == "")                        
                        { 
                            window.alert("Please confirm your Password."); 
                            confirmPassword.focus(); 
                            return false; 
                        } 
                        
                        if (confirmPassword.value == password)                        
                        { 
                            window.alert("Your current password does not match with your current password."); 
                            confirmPassword.focus(); 
                            return false; 
                        } 


                        return true; 
                    }

                var check = function() {
                      if (document.getElementById('password').value ==
                        document.getElementById('confirmPassword').value) {
                        document.getElementById('message').style.color = 'green';
                        document.getElementById('message').innerHTML = 'matching';
                      } else {
                        document.getElementById('message').style.color = 'red';
                        document.getElementById('message').innerHTML = 'not matching';
                      }
                    }
	       </script>
		</div>
	</div>
<%@ include file="/includes/footer.jsp" %>