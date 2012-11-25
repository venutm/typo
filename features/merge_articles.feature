Feature: merge ralated post
As an administrator
So that I can simplify and organise the content in my site
I want to merge posts that have a similar content
Background:
Given the blog is set up

Given the following contents exist:
| type | title | author | body | id | published |
|Article|Dummy One|admin|One AAA|3|t|
|Article|Dummy Two|dummy_user|Two BBB|4|t|
Scenario: Merge option shown when editing an article if admin user
Given I am logged into the admin panel
And I am on the content page
Given I follow "Dummy One"
Then I should be at "Dummy One" of the edit page
And I should see "One AAA"
And I should see "Merge Articles"

Scenario: Merge option not shown when editing an article if non admin user
Given I am logged as normal user
Given I am on the content page
And I follow "Dummy Two"


Scenario: The merged article should contain the text of the two merged articles.
Given I am logged into the admin panel
And I am on the content page
When I follow "Dummy One"
And I fill in "merge_with" with "4"
And I press "Merge With This Article"
Then I should be on the content page
When I follow "Dummy One"
Then I should see "One AAATwo BBB"
