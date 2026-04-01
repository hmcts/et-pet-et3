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

    document.querySelector(".pdf-failure").classList.add("hidden");
    let successLink = document.querySelector(".pdf-success");
    successLink.classList.remove("hidden");
    successLink.style.pointerEvents = "auto";
  } catch (error) {
    document.querySelector(".pdf-success").classList.add("hidden");
    let failureLink = document.querySelector(".pdf-failure");
    failureLink.classList.remove("hidden");
    failureLink.style.pointerEvents = "none";
    console.warn("Unable to find PDF, retrying " + url + " in 10 seconds");
    setTimeout(function () {
      checkLinkStatus();
    }, 10000);
  }
}
export default DisablePdfLink;
