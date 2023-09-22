/**
 * 
 */
console.log("admin/js/SubCourse.js");

 class SubCourse {

	 showInfo() {
		 console.log("실행됨");
	 }

	 subcourseAdd(subcourse = {cId:1, scName:1, scLink:'test',scTime:1}, callback) {
		let url = 'ajaxsubcourseadd.do';
		let payload ='cid='+subcourse.cId+'&name='+subcourse.scName+'&link='+subcourse.scLink+'&time='+subcourse.scTime;
		fetch(url, {
			method :'POST',
			headers : {'Content-Type': 'application/x-www-form-urlencoded'},
			body : payload
		})
		.then(resolve=>resolve.json())
		.then(result=>callback(result));
	 }

	 delSub(sid , callback) {
		fetch('ajaxsubcoursedel.do?sid='+sid)
		.then(resolve=>resolve.json())
		.then(result=>callback(result));
	 }

 }