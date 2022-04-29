import axios from "axios";

function DisablePdfLink() {
  checkLinkStatus();
}

function checkLinkStatus() {
  let url = document.querySelector('.pdf-success').getAttribute('href');
  axios.head(url)
    .then((response) => {
      document.querySelector('.pdf-failure').classList.add('hidden')
      let successLink = document.querySelector('.pdf-success');
      successLink.classList.remove('hidden')
      successLink.style.pointerEvents = 'auto'


    })
    .catch((error) => {
      document.querySelector('.pdf-success').classList.add('hidden')
      let failureLink = document.querySelector('.pdf-failure');
      failureLink.classList.remove('hidden')
      failureLink.style.pointerEvents = 'none'
      console.warn("Unable to find PDF, retrying " + url + " in 10 seconds");
      setTimeout(function() { checkLinkStatus() }, 10000);
    })
}
export default DisablePdfLink
