Technology stack
----------------
S/N	Technology	Version
1	Java		1.8
2	Spring boot	2.1.7.RELEASE
3	Spring MVC	5.1.9.RELEASE
4	Hibernate	5.3.10.Final
5	Maven		3.1.0
6	H2 Database	1.4.199
7	Jquery		3.3.1
8	Jquery UI	1.12.1

How to Run:
-----------
Steps:
1)Clone this repsitory and import as Maven project into your eclipse IDE.
2)Open "StudentApplication.java" class in eclipse IDE editor -> right click -> Run As -> Java Application
3)Default port is 8080

Url's:
-----
Listing: http://localhost:8080/studentlist/
Update: http://localhost:8080/studentlist/edit/{id}
Create: http://localhost:8080/studentlist/studentform/
Delete: http://localhost:8080/studentlist/delete/{id}

Note: This application uses In-memory database (H2) , so if you would like to use Mysql DB please use attached sql script.

Thanks

