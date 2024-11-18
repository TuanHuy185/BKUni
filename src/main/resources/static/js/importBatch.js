// Send GET request to backend API
fetch('http://localhost:8090/api/v1/ImportProductBatch/getAllProductBatch')
 .then(response => response.json())
 .then(data => {
    const importBatchBody = document.getElementById('importBatchBody');
    const importBatchs = data.data;

    // Clear the table body before inserting new data
    importBatchBody.innerHTML = '';

    importBatchs.forEach(importBatch => {
      const row = document.createElement('tr');

      // Create table cells for each column
      row.innerHTML = `
        <td>${importBatch.branchID}</td>
        <td>${importBatch.batchDate}</td>
        <td>${importBatch.productTypeName}</td>
        <td>${importBatch.totalQuantity}</td>
        <td>${importBatch.total}</td>
      `;

      importBatchBody.appendChild(row);
    });
  })
 .catch(error => console.error('Error:', error));

 
 function searching() {
  // prevent default behavior of submit
  //event.preventDefault();
  const importBatchBody = document.getElementById('importBatchBody');
  
  // delete all current child
  while (importBatchBody.firstChild) {
    importBatchBody.removeChild(importBatchBody.firstChild);
  }


  const nameSuplier = document.getElementById('nameSuplier').value;
  const minPrice = document.getElementById('minPrice').value;
  //http://localhost:8090/api/v1/ImportProductBatch/getImportProductBatch?supplierName=Công ty Sữa Vinamilk&maxMoney=110.000
  if(nameSuplier && minPrice) {
    fetch(`http://localhost:8090/api/v1/ImportProductBatch/getImportProductBatch?supplierName=${nameSuplier}&maxMoney=${minPrice}`)
    .then(response => response.json())
    .then(data => {
      // update searched employee list by updateTableContent func
      updateTableContent(data.data);
    })
    .catch(error => console.error('Error:', error));
    
    function updateTableContent(importBatchs) {
      const importBatchBody = document.getElementById('importBatchBody');
      // delete all current child
      while (importBatchBody.firstChild) {
        importBatchBody.removeChild(importBatchBody.firstChild);
      }
    
      importBatchs.forEach(importBatch => {
        const row = document.createElement('tr');
  
        // Create table cells for each column
        row.innerHTML = `
          <td>${importBatch.branchID}</td>
          <td>${importBatch.batchDate}</td>
          <td>${importBatch.productTypeName}</td>
          <td>${importBatch.totalQuantity}</td>
          <td>${importBatch.total}</td>
        `;
  
        importBatchBody.appendChild(row);
      });
    }
  }
};