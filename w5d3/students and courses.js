function Student(fname, lname) {
  this.fname= fname;
  this.lname = lname;
  this.courses = [];
}

Student.prototype.name = function () {
  return `${this.fname} ${this.lname}`;
};

Student.prototype.enroll = function (course) {
  if (!this.hasConflict(course)) {

    this.courses.push(course);
    course.addStudent(this);
  }else {
    console.error('you can\'t add this course');
  }
};

Student.prototype.courseLoad = function () {
  let myLoad = {};
  for (let i = 0; i < this.courses.length; i++) {
    if (this.courses[i].department in myLoad) {
       myLoad[this.courses[i].department] += this.courses[i].credits;
    }else {
      myLoad[this.courses[i].department] =this.courses[i].credits ;
    }
  }
  return myLoad;
};

Student.prototype.hasConflict = function (newCourse) {
  let value = false;
  this.courses.forEach(el => {
    if (el.confilctsWith(newCourse)) {
      value = true;
    }
  });
  return value;
};

function Course(name, department, credits, period) {
  this.name = name;
  this.department = department;
  this.credits = credits;
  this.students= [];
  this.period = period;
}

Course.prototype.students = function () {
  return this.students;
};

Course.prototype.confilctsWith = function (otherCourse) {
  if (this.period[0] === otherCourse.period[0]) {
    let myDays = this.period[1];
    for (let i = 0; i < otherCourse.period[1].length; i++) {
      if (myDays.includes(otherCourse.period[1][i])) { return true; }
    }
  }
  return false;
};

Course.prototype.addStudent = function (student) {
  this.students.push(student.name());
};

let c1 = new Course('cs101', 'cs', 3, [3, [1, 3, 5]]);
let c2 = new Course('css102', 'cs', 1, [3, [2, 3, 4]]);
let c3 = new Course('css103', 'cs', 4, [2, [2, 3, 4]]);
let c4 = new Course('css103', 'cs', 4, [3, [2, 4]]);



let s1= new Student('bob', 'booby');
let s2= new Student('Tiger', 'Woods');


s1.enroll(c1);
s1.enroll(c2);
s2.enroll(c1);
s2.enroll(c2);
