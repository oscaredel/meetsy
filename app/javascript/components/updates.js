const toggleComment = () => {
  // expand response form if attendence button is checked
  const commentBtn = document.querySelectorAll(".comment-btn");
  commentBtn.forEach( (button, index) => {
    // if button is clicked
    button.addEventListener("click", (event) => {
      var commentInput = document.querySelectorAll(".update-comment-input")[index];
      if (commentInput.style.display === "block") {
        commentInput.style.display = "none";
      } else {
        commentInput.style.display = "block";
      }
    });

  });
};

export { toggleComment };
