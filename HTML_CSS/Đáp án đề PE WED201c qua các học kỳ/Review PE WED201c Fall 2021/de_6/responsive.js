function show() {
    var para = document.getElementById('para2');
    if (para.style.display == "none") {
        para.style.display = "block";
        document.getElementById('para3').innerHTML = "Show less";
    } else {
        para.style.display = "none";
        document.getElementById('para3').innerHTML = "Show all";
    }
}

function Enroll() {
    var txt = document.getElementsByTagName('input');
    if (txt[0].value.trim() == "" || txt[1].value.trim() == "" ||
        txt[2].value.trim() == "" || txt[3].value.trim() == "") {
        alert("please fill all fields");
        return;
    }
    if (txt[2].value != txt[3].value) {
        alert("password/repassword is invalid");
        return;
    }
    if (txt[5].checked || txt[6].checked || txt[7].checked) {
        var address = prompt("input address");
        alert(address);
    } else {
        var option = confirm("would you like to choose option");
        if (option == 1) {

        } else {
            alert("start learning web201c");
        }
    }

}