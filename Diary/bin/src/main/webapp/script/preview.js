var upload = document.getElementById('picture');
    holder = document.getElementById('holder');

upload.onchange = function (e) {
  e.preventDefault();

  var file = upload.files[0],
      reader = new FileReader();
  reader.onload = function (event) {
	  $('#oldpic').remove();
    var img = new Image();
    img.src = event.target.result;
   
    if (img.width > 300) { // holder width
      img.width = 300;
    }
    holder.innerHTML = '';
    holder.appendChild(img);
  };
  reader.readAsDataURL(file);

  return false;
};

function addpicture(picture,hold){
	var upload = document.getElementById(picture);
    var holder = document.getElementById(hold);

upload.onchange = function (e) {
	$('.'+hold).remove();
  e.preventDefault();

  var file = upload.files[0],
      reader = new FileReader();
  reader.onload = function (event) {
    var img = new Image();
    img.src = event.target.result;
   
    if (img.width > 300) { // holder width
      img.width = 300;
    }
    holder.innerHTML = '';
    holder.appendChild(img);
  };
  reader.readAsDataURL(file);

  return false;
};
}