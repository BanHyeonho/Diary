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
   
    
    img.width=400;
    img.htight=300;
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
   
    img.width=400;
    img.htight=300;
    holder.innerHTML = '';
    holder.appendChild(img);
  };
  reader.readAsDataURL(file);

  return false;
};
}
