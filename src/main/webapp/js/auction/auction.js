$(document).ready(function(){
    var currentPrice = $("#spanCurrentPrice").text();
//    var currentPrice = 133456;
//    var result = currentPrice.toLocaleString();
    $("#defaultNumber").text(parseInt(currentPrice).toLocaleString());
});


