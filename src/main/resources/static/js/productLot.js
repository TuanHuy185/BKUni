// Send GET request to backend API
fetch('http://localhost:8090/api/v1/ProductLot/getAllProductLot')
 .then(response => response.json())
 .then(data => {
    const productBody = document.getElementById('productBody');
    const productLots = data.data;

    // Clear the table body before inserting new data
    productBody.innerHTML = '';

    productLots.forEach(productLot => {
      const row = document.createElement('tr');

      // Create table cells for each column
      row.innerHTML = `
        <td>${productLot.productLotID}</td>
        <td>${productLot.productTypeID}</td>
        <td>${productLot.quantityInLot}</td>
        <td>${productLot.expireDate}</td>
      `;

      productBody.appendChild(row);
    });
  })
 .catch(error => console.error('Error:', error));

 function searchProductLot(){
  // delete on data in table
  const productBody = document.getElementById('productBody');
  while (productBody.firstChild) {
    productBody.removeChild(productBody.firstChild);
  }

  // get data is inserted
  const expiredDay = document.getElementById('expiredDay');
  const billID = document.getElementById('billID');

  // console.log("expiredDay: " + expiredDay);
  // console.log("billID: " + billID);

  // const today = new Date(); // Get current date
  // const dateString = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate(); // Convert to ISO date format (yyyy-MM-dd)


  //case 1: call /getExpiredLotsWithProductLotId/{productLotId}
  if(billID.value && expiredDay.value) {
    fetch(`http://localhost:8090/api/v1/ProductLot/getExpiredLotsWithProductLotId/${billID.value}?date=${expiredDay.value}`)
    .then(response => response.json())
    .then(data => {
      // update searched employee list by updateTableContent func
      updateTableContent(data.data);
    })
    .catch(error => console.error('Error:', error));
  }
  //case 2: call /getExpiredLots 
  else if(expiredDay.value) {
    fetch(`http://localhost:8090/api/v1/ProductLot/getExpiredLots?date=${expiredDay.value}`)
    .then(response => response.json())
    .then(data => {
      // update searched employee list by updateTableContent func
      updateTableContent(data.data);
    })
    .catch(error => console.error('Error:', error)); 
  }
  else {
    console.error("billID and expiredDay is null");
  }
}

function updateTableContent(productLots) {
  const productBody = document.getElementById('productBody');
  // delete all current child
  while (productBody.firstChild) {
    productBody.removeChild(productBody.firstChild);
  }

  productLots.forEach(productLot => {
    const row = document.createElement('tr');

    // Create table cells for each column
    row.innerHTML = `
      <td>${productLot.productLotID}</td>
      <td>${productLot.productTypeID}</td>
      <td>${productLot.quantityInLot}</td>
      <td>${productLot.expireDate}</td>
    `;

    productBody.appendChild(row);
  });
}