$(document).ready(function() {
    var accounts = []
    $.ajax('http://127.0.0.1:5500/js/accounts.json')
    .done((data) => {
        accounts = data
        data.forEach((account) => {
            $("#tbAccount").append(`
                <tr>
                    <td>${account.accountNo}</td>
                    <td>${account.customerName}</td>
                    <td>${account.typeOfAccount}</td>
                </tr>
            `)
            accounts.push(account)
        })
    })
    .fail((xhr, text, exception) => {
        alert(JSON.stringify(xhr))
    })

    $("#frmBank").submit((event) => {
        event.preventDefault()
        //check data exist
        if(accounts.filter(account => account.accountNo === $("#accountNo").val()).length > 0)
            return alert('Account No Existed!')
        $.ajax({
            url: 'http://localhost:8080/bankapi/NewAccountServlet',
            data: {
                accountNo: $("#accountNo").val(),
                customerName: $("#customerName").val(),
                accountType: $("#typeOfAccount").val()
            },
            processData: false,
            contentType: false,
            type: 'POST',
        }).done((data) => {
            $("#tbAccount").append(`
                <tr>
                    <td>${$("#accountNo").val()}</td>
                    <td>${$("#customerName").val()}</td>
                    <td>${$("#typeOfAccount").val()}</td>
                </tr>
            `)
            accounts.push({
                accountNo: $("#accountNo").val(),
                customerName: $("#customerName").val(),
                accountType: $("#typeOfAccount").val()
            })
        }).fail((xhr, text, exception) => {
            alert(JSON.stringify(xhr))
        })
    })
})