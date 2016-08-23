       $(document).ready(function() {


        // Datepicker appears when startdate input box is selected  
        $('#sdate').datepicker({  
              daysOfWeekDisabled: [0, 6],            
              format: "yyyy-mm-dd",
            }).on('changeDate', function (e) {
            $(this).datepicker('hide');
        });


        // Datepicker appears when enddate input box is selected  
        $('#edate').datepicker({   
              daysOfWeekDisabled: '0,6',           
              format: "yyyy-mm-dd",
            }).on('changeDate', function (e) {
            $(this).datepicker('hide');
        });

          $('#search').click(function(){

               $('.headers').empty();
               $('.tableDetails').empty();
               $('.headers').append("<th scope='col'><center>Desk Number</center></th>");
              var startdate = $('#sdate').val();
              var enddate = $('#edate').val();
              var location = "Edinburgh";

              var start = new Date(startdate);
              var end = new Date(enddate);

              for(var d = start; d <= end; d.setDate(d.getDate() +1)){
                $('.headers').append("<th scope='col'><center>" + formatDate(d) + "</center></th>")
                console.log(formatDate(d));
              }

              $.getJSON("http://ukl5cg6195g1q:8080/booking/checkSingleAvailability", {location:location, startDate: startdate, endDate: enddate}).success(function(result) {

                  $.each(result, function(key,val){
                    $('.tableDetails').append("<tr id='desk"+ key +"'><th scope='row'><center>"+ val.deskId +"</center></th></tr>");

                    start = new Date(startdate);

                    for(var d = start; d <= end; d.setDate(d.getDate() +1)){
                      if(contains (formatDate(d),val.dates)){

                        $('#desk'+ key).append("<td style='text-align:center'><label class='btn btn-success'><input type='radio' name='"+ formatDate(d) +"'</label></td>");

                      }else{
                  $('#desk'+ key).append("<td style='text-align:center'><label class='btn btn-default'><input type='radio' name='"+ formatDate(d) +"' disabled='true'></label></td>");
                      }
                  }       
    
                  })
                  $('.book').append("<center><button type='button' class='btn btn-primary' id='book'>Book Hot Desk</button></center>");
                


                 }).fail(function(d, status, error) {
                 alert("\nError: No Dates Selected");
             });
              
          });

          function formatDate(date){
            var year = date.getFullYear();
            var day = formatDayMonth(date.getDate());
            var month = formatDayMonth((date.getMonth() + 1));
            return year + "-" + month + "-" + day;
          }

          function formatDayMonth(dayMonth){
            if(dayMonth < 10){
              return 0 + "" + dayMonth;
            }else{
              return dayMonth;
            }
          }

          function contains(value, list){
            var isContained = false;
            for(var i = 0; i < list.length; i++ ){
              if(list[i] == value){
               return true;
              }
            }
            return false;
          }

});