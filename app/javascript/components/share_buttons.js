const shareNative = () => {
  if(navigator.share !== undefined) {
    var shareBtn = document.querySelector('.share-native-btn');
    shareBtn.addEventListener('click', clickEvent => {
      clickEvent.preventDefault();
      navigator.share({text: "Meetsy invite. Come join me!", url: window.location.href})
        .then(() => console.log('Successful share'),
         error => console.log('Error sharing:', error));
    });
  }
}

function copyLink() {
  var copyText = document.querySelector("#copy-link-txt");
  var copyLinkBtn = document.querySelector(".copy-link-btn")
  copyLinkBtn.addEventListener('click', clickEvent => {
    copyText.select();
    copyText.setSelectionRange(0, 99999)
    document.execCommand("copy");
    window.getSelection().removeAllRanges();
    copyLinkBtn.innerHTML = "<i class='fas fa-clipboard-check'></i>";
  });
}



export { shareNative, copyLink };
