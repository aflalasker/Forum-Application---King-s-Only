# Team Pistachio

* * *

### Team Members

<table>

<tbody>

<tr>

<th>Student Name</th>

<th>Student Number</th>

</tr>

<tr>

<td>Mohamed Aflal Mohamed Jafferdeen Mohamed Asker</td>

<td>1641631</td>

</tr>

<tr>

<td>Alin Fulga</td>

<td>1635032</td>

</tr>

<tr>

<td>Jakub Uher</td>

<td>1543054</td>

</tr>

<tr>

<td>Hinshelwood Jack</td>

<td>1515150</td>

</tr>

<tr>

<td>Dhairya Mehta</td>

<td>1647392</td>

</tr>

</tbody>

</table>

* * *

<section>

### Brief Overview of the Application

This a web based **Forum** Application developed using the **Rails** framework. The Application is deployed in the **Heroku server**, and can be found using this **link: wwwwwwwwww**

The Application has **Two Categories,** a space for the Staff to add posts and space for the Students to add Posts. The Staffs have the rights to **Create, Edit, and Delete** Posts throughout the Forum, including the Students Space. On the other hand, the students can only add Posts in the Students space, and **cannot** manipulate any Posts made by the Staff.

The Forum Application is linked to the **King's College London's Microsoft App**, this means the Students and Staff who use this service should be **registered** KCL users. Students and Staffs should use their KCL email address to sign-up to use the service, and then they can sign-in to the Forum application using the KCL email. Then the Students and Staff who sign-in to the forum can View, Add Posts, and add Comments to Posts. However, in-order to Edit a Post, you should be the owner of the Post.

We also added further functionality where a user can see the time a post has been submitted and also a voting system where a user can up-vote or down-vote on a post. 

</section>


<section>

##Gem dependencies used in our application

OmniAuth- A generalized Rack framework for multiple-provider authentication (used for microsoft authentication through King's login)

Rubocop- Automatic Ruby code style checking tool. Aims to enforce the community-driven Ruby Style Guide. (ensures all the code is conventional)

Tzinfo-data- TZInfo::Data contains data from the IANA Time Zone database packaged as Ruby modules for use with TZInfo.(used for microsoft authentication)

Factory Girl - factory_girl provides a framework and DSL for defining and using factories - less error-prone, more explicit, and all-around easier to work with than fixtures. (used for testing)

Capybara- Capybara is an integration testing tool for rack based web applications. It simulates how a user would interact with a website. (used for integration testing)

Minitest- minitest provides a complete suite of testing facilities supporting TDD, BDD, mocking, and benchmarking. (for unit testing)

rack_session_access-  Rack middleware that provides access to rack.session environment. (mock for integration testing)

rspec-rails- rspec-rails is a testing framework for Rails 3+. (needed to run rack_session_access)


</section>
