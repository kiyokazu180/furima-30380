window.addEventListener('load', put)
function put(){
  const put_price = document.getElementById("item-price")
  const put_tax = document.getElementById("add-tax-price")
  const put_profit = document.getElementById("profit")
  put_price.addEventListener('input', function(){
    const price = document.getElementById("item-price").value;
    put_tax.innerHTML = price*0.1;
    put_profit.innerHTML= price*0.9;
  })
}
  