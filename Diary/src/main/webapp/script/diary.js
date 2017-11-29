
function search(){
	var keyword = document.getElementById('keyword').value;
	var option = document.getElementById('option').value;
	location.href="/search.do?option="+option+"&keyword="+keyword;
}