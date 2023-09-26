/**
 * 
 */

 class Answer{
	 
	 answerAdd(answer = {qid:1, content:'', img:''}, callback) {
		 let url = 'ajaxansweradd.do';
		 let payload ='qid='+answer.qid+'&content='+answer.content+'&img='+answer.img;
		 fetch(url, {
			 method:'POST',
			 headers : {'Content-Type': 'application/x-www-form-urlencoded'},
			 body : payload
		 })
		 .then(resolve=>resolve.json())
		 .then(result=>callback(result));
	 
	}
	
	answerRemove(aid, callback) {
		fetch('ajaxanswerdel.do?aid='+aid)
		.then(resolve=>resolve.json())
		.then(result=>callback(result));
	}
	
	answerUpdate(answer = {qid:1, content:'', img:''}, callback) {
		let url = 'ajaxanswerupdate.do';
		let payload ='qid='+answer.qid+'&content='+answer.content+'&img='+answer.img;
		fetch(url, {
			 method:'POST',
			 headers : {'Content-Type': 'application/x-www-form-urlencoded'},
			 body : payload
		 })
		 .then(resolve=>resolve.json())
		 .then(result=>callback(result));
	}
	 
 }