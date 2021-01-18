//기본 이미지 사용 (프로필 이미지 삭제)
function delProfileImg() {
	axios.get('/user/delProfileImg.korea').then(function(res) {
		var basicProfileImg = '/res/img/basic_profile.jpg';22		
		if(res != null && res.status == 200) {
			if(res.data.result == 1) { //프로필 이미지 삭제가 완료 됨!!
				var img = document.querySelector('#profileImg');
				var container = document.querySelector('#delProfileBtnContainer');
				
				img.src = basicProfileImg;
				container.remove();
			}
		}		
	}).catch(function(err) {
		console.err('err 발생 : ' + err);
	})
}

function chkPw() {
	var frm = document.querySelector('#frm');
	if(frm.current_pw.value == '') {
		alert('기존 비밀번호를 작성해 주세요.');
		frm.current_pw.focus();
		return false;
	} else if(frm.user_pw.value == '') {
		alert('변경 비밀번호를 작성해 주세요.');
		frm.user_pw.focus();
		return false;
	} else if(frm.user_pw.value != frm.chk_user_pw.value) {
		alert('변경/확인 비밀번호를 확인해 주세요.');
		frm.user_pw.focus();
		return false;
	}
}











