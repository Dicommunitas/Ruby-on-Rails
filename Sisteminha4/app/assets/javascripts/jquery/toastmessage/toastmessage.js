function showSuccessToast(texto) {
	$().toastmessage('showSuccessToast', texto);
}

function showStickySuccessToast(texto) {
	$().toastmessage('showToast', {
		text : texto,
		sticky : true,
		position : 'top-right',
		type : 'success',
		closeText : '',
		close : function() {
			console.log("toast is closed ...");
		}
	});

}

function showStickyErrorToast(texto) {
	$().toastmessage('showToast', {
		text : texto,
		sticky : true,
		position : 'top-right',
		type : 'error',
		closeText : '',
		close : function() {
			console.log("toast is closed ...");
		}
	});
}

$(function() {
	$("erro").each(function(e) {
		var texto = $(this).attr("title");
		showStickyErrorToast(texto);
	});
});

$(function() {
	$("sucesso").each(function(e) {
		var texto = $(this).attr("title");
		showSuccessToast(texto);
	});
});