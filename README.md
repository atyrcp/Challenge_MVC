# Challenge_MVC
just an app connecting with unsplash API, main purpose is to practice on MVC design pattern

am i in the readme mode? i think i am

a new challenge, using MVC design pattern to rewrite my app, the original one is to connect unsplash API, and load some images or photographers name to display on the tableview


Changes(updated: Oct,22,2018):

1.rename my files properly<br/>
2.seperate the files to view, model controller and services<br/>
3.clean the code inside of viewcontroller, URLrequest is no longer handled by it<br/>
4.make services file a singleton class, cause i put URLSession here<br/>
5.rearranged the tableviewCell logic, controller should have no idea about how a cell displays, the cell should figure it out by itself<br/>
6.viewcontroller is now dealing with tableview delegate and collectionview delegate at the same time<br/>
7.instead of adding a black subview as background to display the image on click, its now passing to a new controller called FullScreenViewController and managed by a collectionview<br/>
