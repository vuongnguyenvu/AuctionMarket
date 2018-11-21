$(document).ready(function(){
    var currentPrice = $("#defaultNumber").text();
//    var currentPrice = 133456;
//    var result = currentPrice.toLocaleString();
    $("#defaultNumber").text(parseInt(currentPrice).toLocaleString());
});


