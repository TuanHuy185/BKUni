fetch('http://localhost:8090/api/v1/Bill-ProductLot/CalcBillPrice')
.then(response => response.json())
.then(data => {
  const productBillBody = document.getElementById('productBillBody');
  const productBills = data.data;

  // Clear the table body before inserting new data
  productBillBody.innerHTML = '';

  productBills.forEach(productBill => {
    const row = document.createElement('tr');

    // Create table cells for each column
    row.innerHTML = `
      <td>${productBill.billID}</td>
      <td>${productBill.totalPrice}</td>
    `;

    productBillBody.appendChild(row);
  });
 })
.catch(error => console.error('Error:', error));