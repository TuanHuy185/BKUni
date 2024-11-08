const baseUrl = "http://localhost:8090";

document.addEventListener('DOMContentLoaded', () => {
    document
        .getElementById('loginForm')
        .addEventListener('submit', function (event) {
            // prevent default behavior of submit
            event.preventDefault();
    
            const uname = document.getElementById("username");
            const pwd = document.getElementById("password");

            const reqJson = {
                username: uname.value,
                password: pwd.value,
            };
            
            fetch(
                `${baseUrl}/api/v1/User/login`,  // Use the correct endpoint
                {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify(reqJson),
                    credentials: 'include' // Ensure that cookies are sent with the request
                }
            )
            .then(response => response.json())
            .then(data => {
                if (data.status === "OK") {
                    console.log('Login successful:', data);
                    // Redirect to the home page
                    window.location.href = "/home";
                } else if (data.status === "ERROR") {
                    // Redirect to login page with error
                    window.location.href = "/login?error=true";
                    console.error('Error:', data.message);
                }
            })
            .catch(error => {
                // Handle the error appropriately
                window.location.href = "/login?except=true";
                console.error('Error:', error);
            });
        });
});
