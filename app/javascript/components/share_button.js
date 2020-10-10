const shareNative = () => {
  navigator.share({title: document.title, text: window.location.href, url: window.location.href})
            .then(() => console.log('Successful share'),
             error => console.log('Error sharing:', error));

  if(navigator.share !== undefined) {
      document.addEventListener('DOMContentLoaded', e => {
        var shareBtn = document.querySelector('share-native');
        shareBtn.addEventListener('click', clickEvent => {
          clickEvent.preventDefault();
          navigator.share({title: document.title, text: window.location.href, url: window.location.href})
            .then(() => console.log('Successful share'),
             error => console.log('Error sharing:', error));
        });
      });
  }
}
