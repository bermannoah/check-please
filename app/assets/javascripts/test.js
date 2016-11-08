
  $(document).ready(function() {
     $("select#select_id").bind("change",function() {
       if ($(this).val() == "one"){
        $("div#myform").show();
        $("div#myform2").hide();
        $("div#myform3").hide();
      }

       else if ($(this).val() == "two"){
         $("div#myform").hide();
         $("div#myform2").show();
         $("div#myform3").hide();
       }
       else
       {
       $("div#myform").hide();
       $("div#myform2").hide();
       $("div#myform3").show();
     }
     })
 })
