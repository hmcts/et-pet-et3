import axios from "axios";

function DisablePdfLink() {
  checkLinkStatus();
}

function checkLinkStatus() {
  let url = document.querySelector('.pdf-success').getAttribute('href');
  axios.head(url)
    .then((response) => {
      document.querySelector('.pdf-failure').classList.add('hidden')
      document.querySelector('.pdf-success').classList.remove('hidden')

    })
    .catch((error) => {
      document.querySelector('.pdf-success').classList.add('hidden')
      document.querySelector('.pdf-failure').classList.remove('hidden')
      console.warn("Unable to find PDF, retrying " + url + " in 10 seconds");
      setTimeout(function() { checkLinkStatus() }, 10000);
    })
}
export default DisablePdfLink
