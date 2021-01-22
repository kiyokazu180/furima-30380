const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("number"),
      sec: formData.get("sec"),
      month: formData.get("month"),
      year: `20${formData.get("year")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("order_number").removeAttribute("name");
      document.getElementById("order_sec").removeAttribute("name");
      document.getElementById("order_month").removeAttribute("name");
      document.getElementById("order_year").removeAttribute("name");

      document.getElementById("charge-form").submit();

    });
  });
};

window.addEventListener("load", pay);