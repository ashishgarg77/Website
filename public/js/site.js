function runajax(url, mydata, type, responseid, returntype, fn) {
    //notify('Please wait...',2);
    //$('.calc-loader').show();
    $.ajax({
        type: type,
        url: url,
        data: mydata,
        success: function (res) {

            if (typeof fn === 'function') {
                fn(res);
               // $('.calc-loader').hide();
                //hideNotify();
            }
            else {
                //$('.calc-loader').hide();
                if (returntype == 'json') {
                    var json = JSON.parse(res);
                    if (typeof json.msg != 'undefined') {
                        alert(json.msg);
                    }
                }
            }
        }
    });
}

function asynRunajax(url, mydata, type, responseid, returntype, fn) {
    //notify('Please wait...',2);
    $('.calc-loader').show();
    $.ajax({
        type: type,
        url: url,
        data: mydata,
        async:false,
        success: function (res) {

            if (typeof fn === 'function') {
                fn(res);
                $('.calc-loader').hide();
                //hideNotify();
            }
            else {
                $('.calc-loader').hide();
                if (returntype == 'json') {
                    var json = JSON.parse(res);
                    if (typeof json.msg != 'undefined') {
                        alert(json.msg);
                    }
                }
            }
        }
    });
}
$('#subscribedbtn').click(function(){


url = $('#subscribed').attr('action');
data= $('#subscribed').serialize();

//console.log(other_store);
runajax(url, data, 'post', '', 'json', function(res) {
    if (res.status == 'success') {
        
       // window.location.href = '<?php echo url("/login"); ?>';
    }
    else {
       
       
    }
});
})


