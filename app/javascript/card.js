const pay = () => {
  Payjp.setPublicKey("pk_test_6f61e183a609a86f22f816c7");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_log[number]"),
      exp_month: formData.get("order_log[exp_month]"),
      exp_year: `20${formData.get("order_log[exp_year]")}`,
      cvc: formData.get("order_log[cvc]")
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token)
      }
    });
    
  });
};

window.addEventListener("load", pay);
