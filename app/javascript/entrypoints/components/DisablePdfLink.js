function DisablePdfLink() {
  checkLinkStatus();
}

async function checkLinkStatus() {
  let url = document.querySelector(".pdf-success")?.getAttribute("href");
  if (!url) {
    return;
  }
  try {
    let response = await fetch(url, { method: "HEAD" });
    if (!response.ok) {
      throw new Error(`HEAD failed with status ${response.status}`);
    }

    document.querySelector(".pdf-failure").classList.add("govuk-!-display-none");
    document.querySelector(".pdf-failure").classList.remove("govuk-!-display-block");
    let successLink = document.querySelector(".pdf-success");
    successLink.classList.remove("govuk-!-display-none");
    successLink.classList.add("govuk-!-display-block");
  } catch (error) {
    document.querySelector(".pdf-success").classList.add("govuk-!-display-none");
    document.querySelector(".pdf-success").classList.remove("govuk-!-display-block");
    let failureLink = document.querySelector(".pdf-failure");
    failureLink.classList.remove("govuk-!-display-none");
    failureLink.classList.add("govuk-!-display-block");
    console.warn("Unable to find PDF, retrying " + url + " in 10 seconds");
    setTimeout(function () {
      checkLinkStatus();
    }, 10000);
  }
}
export default DisablePdfLink;
