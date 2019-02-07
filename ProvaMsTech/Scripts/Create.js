$(document).ready(function () {
    $('#btnSalvar').click(function () {
        var Customers = {
            CompanyName: document.getElementById('txtCompanyName').value,
            ContactName: document.getElementById('txtContactName').value,
            ContactTitle: document.getElementById('txtContactTitle').value,
            Address: document.getElementById('txtAddress').value,
            City: document.getElementById('txtCity').value,
            Region: document.getElementById('txtRegion').value,
            PostalCode: document.getElementById('txtPostalCode').value,
            Country: document.getElementById('txtCountry').value,
            Phone: document.getElementById('txtPhone').value,
            Fax: document.getElementById('txtFax').value,
            Email: document.getElementById('txtEmail').value
        }
    $.ajax({
        url: 'http://localhost:61706/Customers/Save',
        type: 'POST',
        data: JSON.stringify(Customers),
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function () {
        },
        error: function () {
        }
    })
    });
});