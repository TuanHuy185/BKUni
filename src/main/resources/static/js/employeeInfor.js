// Send GET request to backend API
const employeeID = document.getElementById('employeeID').textContent;

//render data for navbar row
fetch(`http://localhost:8090/api/v1/Employee/${employeeID}`)
.then(response => response.json())
.then(data => {
  const employeeBody = document.getElementById('employeeBody');
  const employees = data.data;

  // Clear the table body before inserting new data
  employeeBody.innerHTML = '';

  employees.forEach(employee => {
    const row = document.createElement('tr');

    // Create table cells for each column
    row.innerHTML = `
      <td>${employee.employeeID}</td>
      <td>${employee.lastName} ${employee.middleName} ${employee.firstName}</td>
      <td>${employee.cccd}</td>
      <td>${employee.phoneNo}</td>
      <td>${employee.email}</td>
      <td>${employee.supervisorID}</td>
      <td>${employee.salary}</td>
      <td>${employee.branchID}</td>
      <td><button onclick="deleteEmployee()">Xóa</button></td>
    `;
    employeeBody.appendChild(row);

    const Lname = document.getElementById("Lname");
    const Mname = document.getElementById("Mname");
    const Fname = document.getElementById("Fname");
    const empID = document.getElementById("empID");
    const supID = document.getElementById("supID");
    const BrID = document.getElementById("brID");
    const mycccd = document.getElementById("mycccd");
    const mysdt = document.getElementById("mysdt");
    const myemail = document.getElementById("myemail");
    const mysalary = document.getElementById("mysalary");
    Lname.value = employee.lastName;
    Mname.value = employee.middleName;
    Fname.value = employee.firstName;
    empID.value = employee.employeeID;
    supID.value = employee.supervisorID;
    BrID.value = employee.branchID;
    mycccd.value = employee.cccd;
    mysdt.value = employee.phoneNo;
    myemail.value = employee.email;
    mysalary.value = employee.salary;
    
  });
 })
.catch(error => console.error('Error:', error));

// send request to update infor
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
              `http://localhost:8090/api/v1/Employee/updateEmployee`,
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


function deleteEmployee(){
    fetch(`http://localhost:8090/api/v1/Employee/deleteById/${employeeID}`)
    .then((response) => {
        return response.json(); // Parse the response as JSON (if applicable)
    })
    .then((responseData) => {
        // Use the parsed response data (responseData)
        console.log('Response:', responseData);
        const status = document.getElementById('postStatus');
        const message = document.getElementById('postMessage');
        const postSecondElement = document.getElementById('postSecond');
        status.textContent = responseData.status;
        message.textContent = responseData.message;
        
        // Show the BE messages
        status.style.display = 'block';
        message.style.display = 'block';
        
        if(responseData.status == "OK"){
            postSecondElement.style.display = 'block';

            // Set a timeout to redirect to /employee after 5 seconds
            const timeoutId = setTimeout(() => {
                window.location.href = '/employeeList';
            }, 5000);

            // Update the #postSecond element to display the postSecond
            let remainingSeconds = 5;

            const postSecondInterval = setInterval(() => {
            postSecondElement.textContent = `Auto Back! (${remainingSeconds}s)`;
            remainingSeconds--;

            if (remainingSeconds < 0) {
                clearInterval(postSecondInterval);
                postSecondElement.textContent = '...';
            }
            }, 1000);
        }

    })
    .catch(error => console.error('Error:', error));
}