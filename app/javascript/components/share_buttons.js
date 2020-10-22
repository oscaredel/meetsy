const shareNative = () => {
  if(navigator.share !== undefined) {
    var shareBtn = document.querySelector('.share-native-btn');
    shareBtn.addEventListener('click', clickEvent => {
      clickEvent.preventDefault();
      navigator.share({text: "Hey✌️, RSVP at my Meetsy.me space!", url: window.location.href})
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

function showQRCode() {
  var showQRCodeBtn = document.querySelector(".show-qrcode-btn")
  showQRCodeBtn.addEventListener('click', clickEvent => {
    var QRCode = document.getElementById("qrcode");
    if (QRCode.style.display === "block") {
      QRCode.style.display = "none";
    } else {
      QRCode.style.display = "block";
    }
  });
}


export { shareNative, copyLink, showQRCode };
