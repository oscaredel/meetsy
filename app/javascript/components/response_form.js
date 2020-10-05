const responseForm = () => {
  const response_button = document.querySelector(".radio_buttons");
  response_button.addEventListener("click", (event) => {
    document.querySelector(".response-form-inputs").classList.remove('d-none');
  });
};

export { responseForm };
