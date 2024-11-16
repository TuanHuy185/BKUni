// Send GET request to backend API
fetch('http://localhost:8090/api/v1/Supplier/getAllSupplier')
 .then(response => response.json())
 .then(data => {
    const supplierBody = document.getElementById('supplierBody');
    const suppliers = data.data;

    // Clear the table body before inserting new data
    supplierBody.innerHTML = '';

    suppliers.forEach(supplier => {
      const row = document.createElement('tr');

      // Create table cells for each column
      row.innerHTML = `
        <td>${supplier.supplierID}</td>
        <td>${supplier.supplierName}</td>
        <td>${supplier.email}</td>
        <td>${supplier.zipcode}</td>
        <td>${supplier.phoneNo}</td>
      `;

      supplierBody.appendChild(row);
    });
  })
 .catch(error => console.error('Error:', error));
