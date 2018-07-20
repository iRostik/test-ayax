var durl = 'data.php',
makeOpts = function(rows){
    return $.map(rows, function(v, i){
        return '<option value="'+ v.id +'">'+ v.name + '</option>';
    }).join('');
};

$(function(){
    $.getJSON(durl, {table: 'a_region'}, function(data){
        $('#a_region').append(makeOpts(data.rows));
    });
    $('#a_region').change(function(){
        var idregion = $(this).val();
        var fltCity = {
            groupOp: "AND",
            rules: [
                {field: "idregion", op: "eq", data: idregion}
            ]
        },
        queryParameters = {
            table: 'a_city',
            filters: JSON.stringify(fltCity)
        };
        if (idregion) $.getJSON(durl, queryParameters, function(data){
            $('#a_city').html('<option value="">Выбрать...</option>' + makeOpts(data.rows))
            .trigger('change')
            .closest('.data-sel').show();
        });
    });
    
    $('#a_city').change(function(){
        var idcity = $(this).val();
        $('#a_depart').val(null).trigger('change')
        .closest('.data-sel').show();
    });
    
    $('#a_depart').select2({
        ajax: {
            url: durl,
            dataType: 'json',
            delay: 250,
            data: function (params) {
                var fltDepart = {
                    groupOp: "AND",
                    rules: [
                        {field: "idcity", op: "eq", data: $('#a_city').val()},
                        {field: "name", op: "bw", data: params.term}
                    ]
                },
                queryParameters = {
                    table: 'a_depart',
                    filters: JSON.stringify(fltDepart)
                };
                return queryParameters;
            },
            processResults: function (data, params) {
              return {
                results: $.map(data.rows, function(v, i){
                    return {id: v.id, text: v.name};
                })
              };
            }
        },
        language: "ru",
        minimumInputLength: 1,
        placeholder: 'Поиск по району'
    });
});