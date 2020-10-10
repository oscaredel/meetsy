const shareNative = () => {
  if(navigator.share !== undefined) {
    var shareBtn = document.querySelector('.share-native-btn');
    shareBtn.addEventListener('click', clickEvent => {
      clickEvent.preventDefault();
      navigator.share({title: document.title, text: window.location.href, url: window.location.href})
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
    copyLinkBtn.innerHTML= "copied"
  });
}



export { shareNative, copyLink };
