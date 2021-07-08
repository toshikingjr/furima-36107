window.addEventListener('load', () => {
  const itemPrice = document.getElementById("item-price")
  const priceTax = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  itemPrice.addEventListener("input", () => {
    const inputValue = itemPrice.value; 
    priceTax.innerHTML = Math.floor(inputValue * 0.1);
    profit.innerHTML = Math.floor(inputValue - inputValue * 0.1)
  });
});