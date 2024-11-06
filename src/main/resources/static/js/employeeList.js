// Send GET request to backend API
fetch('http://localhost:8090/api/v1/Employee/getAllEmployee')
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
        <td><button onclick="location.href='/employeeList/updateInfor/${employee.employeeID}'">Chỉnh Sửa</button></td>
      `;

      employeeBody.appendChild(row);
    });
  })
 .catch(error => console.error('Error:', error));
 

 
 function searchEmployees() {
    // prevent default behavior of submit
    //event.preventDefault();
    const employeeBody = document.getElementById('employeeBody');
    
    // delete all current child
    while (employeeBody.firstChild) {
      employeeBody.removeChild(employeeBody.firstChild);
    }


    const employeeKey = document.getElementById('searchBox').value;

    if(employeeKey) {
      fetch(`http://localhost:8090/api/v1/Employee/searchBody`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ value: employeeKey })
      })
      .then(response => response.json())
      .then(data => {
        // update searched employee list by updateTableContent func
        updateTableContent(data.data);
      })
      .catch(error => console.error('Error:', error));
    }
};

// func to update Table
function updateTableContent(employees) {
  const employeeBody = document.getElementById('employeeBody');
  // delete all current child
  while (employeeBody.firstChild) {
    employeeBody.removeChild(employeeBody.firstChild);
  }

  employees.forEach(employee => {
    // Tạo hàng bảng mới và thêm nội dung
    const row = document.createElement('tr');
    row.innerHTML = `
      <td>${employee.employeeID}</td>
      <td>${employee.lastName} ${employee.middleName} ${employee.firstName}</td>
      <td>${employee.cccd}</td>
      <td>${employee.phoneNo}</td>
      <td>${employee.email}</td>
      <td>${employee.supervisorID}</td>
      <td>${employee.salary}</td>
      <td>${employee.branchID}</td>
      <td><button onclick="location.href='/employeeList/updateInfor/${employee.employeeID}'">Chỉnh Sửa</button></td>
    `;

    employeeBody.appendChild(row);
  });
}

function searchProductLot(branchID) {
   // prevent default behavior of submit
    //event.preventDefault();
    const employeeBody = document.getElementById('employeeBody');
    
    // delete all current child
    while (employeeBody.firstChild) {
      employeeBody.removeChild(employeeBody.firstChild);
    }

    fetch(`http://localhost:8090/api/v1/Employee/branch/${branchID}`)
    .then(response => response.json())
    .then(data => {
      // update searched employee list by updateTableContent func
      updateTableContent(data.data);
    })
    .catch(error => console.error('Error:', error));
    
    function updateTableContent(employees) {
      const employeeBody = document.getElementById('employeeBody');
      // delete all current child
      while (employeeBody.firstChild) {
        employeeBody.removeChild(employeeBody.firstChild);
      }
    
      employees.forEach(employee => {
        // Tạo hàng bảng mới và thêm nội dung
        const row = document.createElement('tr');
        row.innerHTML = `
          <td>${employee.employeeID}</td>
          <td>${employee.lastName} ${employee.middleName} ${employee.firstName}</td>
          <td>${employee.cccd}</td>
          <td>${employee.phoneNo}</td>
          <td>${employee.email}</td>
          <td>${employee.supervisorID}</td>
          <td>${employee.salary}</td>
          <td>${employee.branchID}</td>
          <td><button onclick="location.href='/employeeList/updateInfor/${employee.employeeID}'">Chỉnh Sửa</button></td>
        `;
    
        employeeBody.appendChild(row);
      });
    }
    
    const branchContent = document.getElementById('branchContent');
    branchContent.textContent = `Chi nhánh ${branchID}`;
};

/* SORT FUNC */
let employeeID_key = false;
function sortByEmployeeID(){
  const employeeBody = document.getElementById('employeeBody');
    
  // delete all current child
  while (employeeBody.firstChild) {
    employeeBody.removeChild(employeeBody.firstChild);
  }

  const sortType = employeeID_key == true ?"ASC" : "DESC";
  employeeID_key =  employeeID_key ? false : true;

  fetch(`http://localhost:8090/api/v1/Employee/sort/employeeID/${sortType}`)
  .then(response => response.json())
  .then(data => {
    // update searched employee list by updateTableContent func
    updateTableContent(data.data);
  })
  .catch(error => console.error('Error:', error));

}
let supervisorID_key = false;
function sortBySupervisorID(){
  const employeeBody = document.getElementById('employeeBody');
    
  // delete all current child
  while (employeeBody.firstChild) {
    employeeBody.removeChild(employeeBody.firstChild);
  }

  const sortType = supervisorID_key == true ?"ASC" : "DESC";
  supervisorID_key = supervisorID_key ? false : true;

  fetch(`http://localhost:8090/api/v1/Employee/sort/supervisorID/${sortType}`)
  .then(response => response.json())
  .then(data => {
    // update searched employee list by updateTableContent func
    updateTableContent(data.data);
  })
  .catch(error => console.error('Error:', error));
}

let branchID_key = false;
function sortByBranchID(){
  const employeeBody = document.getElementById('employeeBody');
    
  // delete all current child
  while (employeeBody.firstChild) {
    employeeBody.removeChild(employeeBody.firstChild);
  }

  const sortType = branchID_key == true ?"ASC" : "DESC";
  branchID_key = branchID_key ? false : true;

  fetch(`http://localhost:8090/api/v1/Employee/sort/branchID/${sortType}`)
  .then(response => response.json())
  .then(data => {
    // update searched employee list by updateTableContent func
    updateTableContent(data.data);
  })
  .catch(error => console.error('Error:', error));
}


/* EMPLOYEE TYPE METHOD */
function callManager(){
  const employeeBody = document.getElementById('employeeBody');
    
  // delete all current child
  while (employeeBody.firstChild) {
    employeeBody.removeChild(employeeBody.firstChild);
  }

  fetch(`http://localhost:8090/api/v1/Employee/employeeType/manager`)
  .then(response => response.json())
  .then(data => {
    // update searched employee list by updateTableContent func
    updateTableContent(data.data);
  })
  .catch(error => console.error('Error:', error));

  const empTypeContent = document.getElementById('empTypeContent');
    empTypeContent.textContent = `Quản lí`;
}

function callCashier(){
  const employeeBody = document.getElementById('employeeBody');
    
  // delete all current child
  while (employeeBody.firstChild) {
    employeeBody.removeChild(employeeBody.firstChild);
  }

  fetch(`http://localhost:8090/api/v1/Employee/employeeType/cashier`)
  .then(response => response.json())
  .then(data => {
    // update searched employee list by updateTableContent func
    updateTableContent(data.data);
  })
  .catch(error => console.error('Error:', error));

  const empTypeContent = document.getElementById('empTypeContent');
    empTypeContent.textContent = `Thu ngân`;
}

function callSupervisor(){
  const employeeBody = document.getElementById('employeeBody');
    
  // delete all current child
  while (employeeBody.firstChild) {
    employeeBody.removeChild(employeeBody.firstChild);
  }

  fetch(`http://localhost:8090/api/v1/Employee/employeeType/supervisor`)
  .then(response => response.json())
  .then(data => {
    // update searched employee list by updateTableContent func
    updateTableContent(data.data);
  })
  .catch(error => console.error('Error:', error));

  const empTypeContent = document.getElementById('empTypeContent');
    empTypeContent.textContent = `Giám sát`;
}

function callNormalEmployee(){
  const employeeBody = document.getElementById('employeeBody');
    
  // delete all current child
  while (employeeBody.firstChild) {
    employeeBody.removeChild(employeeBody.firstChild);
  }

  fetch(`http://localhost:8090/api/v1/Employee/employeeType/normalEmployee`)
  .then(response => response.json())
  .then(data => {
    // update searched employee list by updateTableContent func
    updateTableContent(data.data);
  })
  .catch(error => console.error('Error:', error));

  const empTypeContent = document.getElementById('empTypeContent');
    empTypeContent.textContent = `Nhân viên khác`;
}