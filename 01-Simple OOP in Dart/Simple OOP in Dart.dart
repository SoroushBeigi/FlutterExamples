class Person{
 late String firstName;
 late String lastName ;
 Person(this.firstName,this.lastName);
  
  printName(){
    print(firstName + " "+ lastName);
  }
  
}

void main(){
  var p = new Person("Soroush","Beigi");
  p.printName();
}