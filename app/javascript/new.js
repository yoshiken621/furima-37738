function calculate(){
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  itemPrice.addEventListener('input', () => {
    const priceInput = itemPrice.value;
    const tax = (priceInput * 0.1);
    addTaxPrice.innerHTML = Math.floor(tax);
    profit.innerHTML = Math.floor(priceInput - tax);
  });
};

window.addEventListener('load', calculate);