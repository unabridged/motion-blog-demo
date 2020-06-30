# Steps I Took

1. Install Rails `rails new .`
    * Committed `Setup rails`
2. Add motion to project `bundle add motion` `yarn add @unabridged/motion`
3. Add view_components library
4. Run motion install generator
5. Add `require 'view_component/engine'` to `config/application.rb`
    * Committed `Add motion to project`
6. Create a blog post controller, model, and migration `rails g scaffold Post title:string content:text`
7. Add an root route of `posts#index`
    * Committed `Create post`
8. Create comment model `rails g model Comment name:string body:text post:references`
9. Add `has_many :comments` to Post model
10. Add name and body validations to Comment model
11. Run migration `rails db:migrate`
    * Committed `Create comment`
12. Create motion comment form component `rails g motion:component CommentForm post`
13. Create comment form view
14. Add view to posts show page
15. Create comment controller
16. Add nested comment route
    * Committed `Add Comments`
17. Create motion comment list component `rails g motion:component CommentList post`
18. Create comment list view
19. Add view to posts show page
20. Add broadcast after create
21. Add stream_for to component
    * Committed `Finish`