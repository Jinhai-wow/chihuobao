
function showList(str){
    var array = str.slice(2,-2).split("], [");
    var arrayOne = [];
    for(var i=0;i<array.length;i++){
        arrayOne.push(array[i].split(","))
    }
    var div = document.createElement("div");
    var page = "<div>"
    for(var i=0;i < arrayOne.length;i++){
        page += "<div>";
        for(var j=0;j < arrayOne[i].length;j++){
            page += "<span>"+ arrayOne[i][j]+"</span>";
        }
        page += "</div>";
    }
    page += "</div>"
    div.innerHTML = "<div>"+ page +"</div>"
    document.querySelectorAll("body")[0].appendChild(div);
}
