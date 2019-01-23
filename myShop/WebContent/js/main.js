
		function nullCheck() {
			var infor = document.getElementsByClassName("information");
			var check=0;
			for (var i = 0; i < infor.length; i++) {
				if(infor[i].value===""){
					check++;
				}
			}
				if(check!=0){
					alert("빈칸을 채워주세요");
				}else{
					location.href="insert.jsp?id="+infor[0].value+"&title="+infor[1].value+"&explanation="+infor[2].value+"&price="+infor[3].value;
				}
		}
