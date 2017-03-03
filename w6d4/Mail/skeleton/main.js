const Router = require("./router.js");
const Inbox = require("./Inbox.js");

document.addEventListener("DOMContentLoaded", () => {

  document.querySelectorAll(".sidebar-nav li").forEach( (li) => {
    li.addEventListener("click", (e) => {
      const trgt = e.target;
      let newLocation = trgt.innerText.toLowerCase();
      window.location.hash = newLocation;
    });
  });


  const cntn = document.querySelector(".content");
  const rtr = new Router(cntn, routes);
  rtr.start();
});

const routes = {
  inbox: Inbox
};
