window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  if (priceInput != null) {
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      console.log(inputValue);
  
      const addTaxPrice = document.getElementById("add-tax-price");
      addTaxPrice.innerHTML = Math.floor(inputValue * 0.1);
  
      const profitPrice = document.getElementById("profit");
      const taxPrice = inputValue * 0.1;
      profitPrice.innerHTML = Math.floor(inputValue - taxPrice);
    });
  }
});