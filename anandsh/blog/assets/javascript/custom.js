function ShowSearchBar(idName){
	var searchInput = _id(idName);
	searchInput.classList.remove('hidden');
	searchInput.classList.add('show');
}

function HideSearchBar(idName){
	var searchInput = _id(idName);
	searchInput.classList.remove('show');
	searchInput.classList.add('hidden');
}



