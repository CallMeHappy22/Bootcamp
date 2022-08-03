function checkInput(){
    var name = document.getElementsByTagName('input')[0].value;
    var email = document.getElementsByTagName('input')[1].value;
    var content = document.getElementsByTagName('textarea')[0].value;
    var uni = document.getElementById('uni').value;
    var mess = "Dung de trong\n";
    if(name == ""){
        mess += "ten ";
    }
    if(email == ""){
        mess += "email ";
    }
    if(content== ""){
        mess += "noi dung";
    }
    if(name == "" || mess == "" || content == ""){
        alert(mess);
        return;
    }
    var myWindow = window.open("", "", "width=300,height=300");
    myWindow.document.write("<h1> Ten cua ban: "+name+"</h1>");
    myWindow.document.write("<h2> Email cua ban: "+email+"</h2>");
    myWindow.document.write("<p> Noi dung cua ban: "+content+"</p>");
    myWindow.document.write("<p> Don vi dao tao ban chon: "+content+"</p>");

}