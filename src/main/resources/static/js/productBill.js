fetch('http://localhost:8090/api/v1/Bill-ProductLot/callAllBill')
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
      <td>${productBill.productTypeID}</td>
      <td>${productBill.productLotID}</td>
      <td>${productBill.quantityInBill}</td>
      <td>${productBill.salePrice}</td>
    `;

    productBillBody.appendChild(row);
  });
 })
.catch(error => console.error('Error:', error));