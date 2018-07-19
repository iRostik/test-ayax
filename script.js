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
                if (idregion) $.getJSON(durl, {table: 'a_city', pname: 'idregion', pvalue: idregion}, function(data){
                    $('#a_city').html('<option value="">Выбрать...</option>' + makeOpts(data.rows))
                    .closest('.data-sel').show();
                });
            })
            
            $('#a_city').change(function(){
                var idcity = $(this).val();
                if (idcity) $.getJSON(durl, {table: 'a_depart', pname: 'idcity', pvalue: idcity}, function(data){
                    $('#a_depart').html(makeOpts(data.rows))
                    .closest('.data-sel').show();
                });
            });
        });