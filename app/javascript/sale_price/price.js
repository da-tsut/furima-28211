window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      console.log(inputValue);
      const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = Math.floor(0.1 * inputValue)
      
      const addTaxDog = document.getElementById("profit");
      addTaxDog.innerHTML = Math.floor(0.9 * inputValue)
})
});