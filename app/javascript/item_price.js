function consumer (){
  const itemPrice = document.getElementById("item-price")
  
  itemPrice.addEventListener('input',function(){
    const priceInput = itemPrice.value

    const taxPrice = document.getElementById("add-tax-price")
    taxPrice.innerHTML = Math.round(priceInput / 10)
    
    const profit = document.getElementById("profit")
    profit.innerHTML = Math.round(priceInput - (priceInput / 10))

  })

}

window.addEventListener('load', consumer)