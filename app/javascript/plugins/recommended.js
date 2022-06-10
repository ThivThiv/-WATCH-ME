const recommendedPrice = () => {
  const formDiv = document.getElementById('watch_price_new')
  const displayForm = document.getElementById('watch_price')

  if(formDiv) {
    formDiv.addEventListener("change", (event) => {
      const hello = event.target.value
      console.log(hello)
      console.log(displayForm)
      displayForm.value = Math.floor(hello * 0.009765544876) // Algorithm de fou
    })
  }
}

export { recommendedPrice };
