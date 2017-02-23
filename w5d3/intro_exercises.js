Array.prototype.myUniq = function() {
  let return_array = [];
  this.forEach( el => { if (!return_array.includes(el)) { return_array.push(el);}}
  );
  return return_array;
};

console.log([1,3,5,4,4,4,4,4,7].myUniq());

function twoSum(array) {
  let result = [];
  for (let i = 0; i < array.length -1; i++) {
    for (let j = i+1; j < array.length; j++) {
      if ( array[i] + array[j] === 0) { result.push([i, j]);}
    }
  }

  return result;
}

function myTranspose(array) {
  let result = [];
  for (let i = 0; i < array.length; i++) {
    let subresult = [];
    for (let j = 0; j < array[0].length; j++) {
      subresult.push(array[i][j]);
    }
    result.push(subresult);
  }
  return result;
}

function myEach(array, jsProc) {
  for (let i = 0; i < array.length; i++) {
    jsProc(array[i]);
  }
}

function myMap(array, jsProc) {
  let result = [];
  myEach(array, el => result.push(jsProc(el)));
  return result;
}

 // console.log(my_map([1,3,5], el =>  el * 2));


function myInject(array, jsProc) {
  let result = array.shift();
  myEach(array, el => {result = jsProc(result, el);});

  return result;
}

 // console.log(myInject([1,3,5], (el1,el2) => {return el1 + el2}));


function bubbleSort(array) {
  for (let i = 0; i < array.length; i++) {
    for (let j = 0; j < array.length - 1; j++) {
      if (array[j] > array[j+1]){
        let temp = array[j +1];
        array[j + 1] = array[j];
        array[j]= temp;
      }
    }
  }
  return array;
}

// console.log(bubbleSort([1,4,3,5,7,4]));


function substrings(string) {
  let result = [];
  for (let i = 0; i < string.length; i++) {
    for (let j = i + 1; j < string.length + 1; j++) {
      result.push(string.slice(i,[j]));
    }
  }

  return result;
}
// console.log(substrings("cats"));


function fibonacci(n) {
  if (n < 1) { return []; }
  if (n === 1) { return [1]; }
  if (n === 2) { return [1, 1]; }
  let result = fibonacci(n-1);
  let num = result.length;
  result[num] = result[num-1] + result[num-2];
  return result;
}

function binarySearch(array, target) {
  if (array.length === 0) { return null; }
  let mid = Math.floor(array.length / 2);
  if (array[mid] === target) { return mid; }
  switch (array[mid] > target) {
    case true:
      let left = array.slice(0, [mid]);
      let result = binarySearch(left, target);
      return (result === null ? null : result);
    default:
      let right = array.slice(mid+1, array.length);
      let right_result = binarySearch(right, target);
      return (right_result === null ? null : right_result + mid + 1);
  }
}

function mergeSort (array){
  if (array.length <= 1 ) {return array;}
  let mid = Math.floor(array.length/2);
  let left = array.slice(0,mid);
  let right = array.slice(mid,array.length);
  let left_sorted = mergeSort(left);
  let right_sorted = mergeSort(right);
  return merge(left_sorted, right_sorted);
}

function merge(left, right){
  let result = [];
  while (left.length > 0 && right.length > 0) {
    switch (left[0] < right[0]) {
      case true:
        result.push(left.shift());
        break;
      default:
        result.push(right.shift());
    }
  }
  return ((left.length > 0) ? result.concat(left): result.concat(right));
}

function Cat(name, owner) {
  this.name = name;
  this.owner = owner;
}

Cat.prototype.cuteStatement = function () {
  return `Everyone loves ${this.name}`;
};

Cat.prototype.meow = function () {
  return `meow`;
};

let cat = new Cat('mewsy', 'best owner');
let cat1 = new Cat('meow', 'other owner');

cat.meow = function () {
  return `not meow`;
};


console.log(cat.meow());
console.log(cat1.meow());
