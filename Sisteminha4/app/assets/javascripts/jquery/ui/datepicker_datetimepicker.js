$(function() {
	var marcadoresDataHora = new Array(
		'#amostra_data', 
		'#fechamento_diario_vagao_data', 
		'#composicao_de_vagao_entrada_plataforma', 
		'#composicao_de_vagao_inicio_descarga', 
		'#composicao_de_vagao_final_descarga', 
		'#composicao_de_vagao_saida_plataforma', 
		'#solicitacao_data_hora',
		'#amostras_navio_data',
		'#data_inicial',
		'#data_final'
		);
	var marcadoresData = new Array(
		'#nota_vt_data', 
		'#vistoria_data'
		);
	EscolherDataHora(marcadoresDataHora);
	EscolherData(marcadoresData);
});
function EscolherDataHora(marcadores) {
	for( i = 0; i < marcadores.length; i++) {
		$(marcadores[i]).datetimepicker({
			showAnim : "drop",
			changeMonth : true,
			changeYear : true,
			addSliderAccess : true,
			sliderAccessArgs : {
				touchonly : false
			}
		});
	}
};

function EscolherData(marcadores) {
	for( i = 0; i < marcadores.length; i++) {
		$(marcadores[i]).datepicker({
			showAnim : "drop",
			changeMonth : true,
			changeYear : true,
			showButtonPanel : true
		});
	}
};
