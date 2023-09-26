/**
 * 
 */

class PackageCourse {

    courseAdd(packagecourse = {pid:1, cid:1}, callback) {
        let url = 'ajaxpackagecourseadd.do';
        let payload = 'pid='+packagecourse.pid+'&cid='+packagecourse.cid;
        fetch(url, {
            method:'POST',
            headers : {'Content-Type': 'application/x-www-form-urlencoded'},
            body : payload
        })
        .then(resolve=>resolve.json())
        .then(result=>callback(result));
    }

    courseRemove(packagecourse = {pid:1, cid:1}, callback) {
        fetch('ajaxpackagecoursedel.do?pid='+packagecourse.pid+'&cid='+packagecourse.cid)
		.then(resolve=>resolve.json())
		.then(result=>callback(result));
    }




}