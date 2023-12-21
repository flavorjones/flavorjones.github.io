Reveal.addEventListener('ready', function( event ) {
  var css = `
.controls {
  margin-bottom: 2em ! important;
}

div.footer {
  margin: 5px ;
  position: absolute;
  bottom: 0%;
  font-size: 75%;
  font-family: "Ubuntu";
  opacity: 0.8;
  text-shadow: 0 0 .25em #000;
}

div.footer.left {
  left: 0%;
}

div.footer.right {
  right: 0%;
}
`;

  var head = document.querySelector("head");
  var style = head.appendChild(document.createElement("style"));
  style.appendChild(document.createTextNode(css));

  var reveal = document.body.querySelector(".reveal");
  var footer = reveal.appendChild(document.createElement("div"));
  footer.innerHTML = `
<div class='footer left'>@flavorjones</div>
<div class='footer right'>code climate summit 2019</div>
  `;

} );
