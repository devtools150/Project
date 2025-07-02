
## Who are we and what did we do? 
This project was carried out by Yaron Yaakov and Itamar Denkberg — students at Afeka College.
As part of our Development Tools course, we set up a website using Joomla — a popular content management system that allows us to build websites, blogs, and landing pages, similar to WordPress and Drupal.
To store the site’s content, we used a MySQL database.
We ran both parts of the system — the website and the database — using Docker services.

As part of the requirements, Itamar and I were asked to write scripts that perform setup, backup, restore, and cleanup for a Joomla site deployed in a Docker environment.
The scripts include creating a shared network infrastructure for running multiple containers (Joomla and MySQL), saving backup copies of the database and site files,
restoring the data if needed, and cleaning up resources at the end of the process.

## **Step-by-step tutorial:** 
1. Open Linux.
2. Open a terminal.
3. Type git clone https://github.com/devtools150/Project.git
4. Type cd Project
5. Type chmod +x setup.sh<br>
    chmod +x restore.sh<br>
    chmod +x backup.sh<br>
    chmod +x cleanup.sh<br>
6. Run ./setup.sh
7. Run ./restore.sh
8. Open the website's URL - http://localhost:8080
9. Admin panel: http://localhost:8080/administrator
   Username: demoadmin
   Password: secretpassword
10. You can log in as a member or get into the website for reading articles, as shown on the menu 
11. Run ./backup for backing up
12. Run ./cleanup.sh for cleaning
