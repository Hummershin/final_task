window.addEventListener("DOMContentLoaded", () => {
  const path = location.pathname
  const pathRegex = /^(?=.*item)(?=.*edit)/
  if (path === "/items/new" || pathRegex.test(path)) {
    const priceInput = document.getElementById("item_price");
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    priceInput.addEventListener("input", () => {
      const inputValue = document.getElementById("item_price").value;
      addTaxDom.innerHTML = Math.floor(inputValue * 0.1).toLocaleString();
      profitDom.innerHTML = Math.floor(inputValue * 0.9).toLocaleString();
    })
  }
});