const responseForm = () => {
  // expand response form if attendence button is checked
  const response_buttons = document.querySelectorAll(".radio_buttons");
  response_buttons.forEach((button) => {
    // if button is clicked
    button.addEventListener("change", (event) => {
      document.querySelector(".response-form-inputs").classList.remove('d-none');
    });

    // if button is already checked but validations failed
    if (button.checked == true){
      document.querySelector(".response-form-inputs").classList.remove('d-none');
    };
  });
};

export { responseForm };
