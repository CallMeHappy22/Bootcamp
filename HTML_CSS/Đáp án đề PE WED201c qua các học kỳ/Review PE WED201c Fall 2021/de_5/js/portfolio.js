function changeImg(img) {
    var imgLink = img.src;
    document.getElementById('bigImg').style.backgroundImage = 'url(' + imgLink + ')';
}

function check() {
    var arr = document.getElementsByTagName('input');
    var mail = arr[0].value;
    var check1 = arr[1].checked;
    var check2 = arr[2].checked;
    var check3 = arr[3].checked;
    var content = document.getElementsByTagName('textarea')[0].value;
    if (mail == "") {
        alert("email must not be empty");
        return;
    }
    if (check1 == false && check2 == false && check3 == false) {
        alert("please check radio button");
        return;
    }
    if (!content.startsWith('hello')) {
        alert("content must startwith hello");
        return;
    }
    alert("mess sent");

}