$(function() {
	$('.dataTable').dataTable({
		/*"sScrollY": 200,/* fixar altura */
		"iDisplayLength": 25,
		"bJQueryUI" : true,
		"sPaginationType": "full_numbers",/**/
		"oLanguage" : {
			"sLengthMenu" : "Mostrar _MENU_ registros por página.",
			"sZeroRecords" : "Nada encontrado - desculpe",
			"sInfo" : "Mostrando _START_ até _END_ dos _TOTAL_ registros",
			"sInfoEmpty" : "Mostrando 0 até 0 de 0 registros",
			"sInfoFiltered" : "(filtrado de _MAX_ registros totais)",
			"sSearch" : "Procurar:"
		}
	});
});

