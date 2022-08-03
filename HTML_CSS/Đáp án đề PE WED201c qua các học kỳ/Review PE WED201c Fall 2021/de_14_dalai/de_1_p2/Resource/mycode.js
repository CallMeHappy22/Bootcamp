function checkForm(){
    var name = document.getElementsByTagName('input')[0].value;
    var phone = document.getElementsByTagName('input')[1].value;
    var email = document.getElementsByTagName('input')[2].value;
    if(name === ''){
        alert('username is invalid');
        return;
    }
    if(phone === ''){
        alert('phone is invalid');
        return;
    }
    alert('Welcome '+name+',\nWe will respond to you as soon as possible');
}