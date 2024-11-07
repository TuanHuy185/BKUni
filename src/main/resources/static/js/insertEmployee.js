document.addEventListener('DOMContentLoaded', () => {
document
    .getElementById('infoForm')
    .addEventListener('submit', function (event) {
        // prevent default behavior of submit
        event.preventDefault();

        //const formData = new FormData(event.target);

        const Lname = document.getElementById("Lname");
        const Mname = document.getElementById("Mname");
        const Fname = document.getElementById("Fname");
        const empID = document.getElementById("empID");
        const supID = document.getElementById("supID");
        const brID = document.getElementById("brID");
        const mycccd = document.getElementById("mycccd");
        const mysdt = document.getElementById("mysdt");
        const myemail = document.getElementById("myemail");
        const mysalary = document.getElementById("mysalary");

        const newEmployee = {
            employeeID: empID.value,
            lastName: Lname.value,
            middleName: Mname.value,
            firstName: Fname.value,
            cccd: mycccd.value,
            phoneNo: mysdt.value,
            email: myemail.value,
            salary: mysalary.value,
            supervisorID: supID.value || null,
            branchID: brID.value
        };
        
        console.log(newEmployee);

        fetch(
            `http://localhost:8090/api/v1/Employee/insertEmployee`,
            {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(newEmployee),
            }
        )
            .then((response) => {
                return response.json(); // Parse the response as JSON (if applicable)
            })
            .then((responseData) => {
                // Use the parsed response data (responseData)
                console.log('Response:', responseData);
                const status = document.getElementById('postStatus');
                const message = document.getElementById('postMessage');
                status.textContent = responseData.status;
                message.textContent = responseData.message;
                // You can handle the response data here (e.g., display success message)

                // Show the BE messages
                status.style.display = 'block';
                message.style.display = 'block';
            })
            .catch((error) => {
                // Handle errors
                console.error('Error:', error);
            });
    });
});