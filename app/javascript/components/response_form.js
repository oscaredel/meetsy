const responseForm = () => {
  const response_buttons = document.querySelectorAll(".collection_radio_buttons");
  response_buttons.forEach((button) => {
    button.addEventListener("click", (event) => {
    document.querySelector(".response-form-inputs").classList.remove('d-none');
    });
  });
};

export { responseForm };
