const recommendedPrice = () => {
  const formDiv = document.getElementById('watch_price_new')
  const displayForm = document.getElementById('watch_price')


  formDiv.addEventListener("change", (event) => {
    const hello = event.target.value
    console.log(hello)
    console.log(displayForm)
    displayForm.value = hello * 0.01
  })
}

export { recommendedPrice };
