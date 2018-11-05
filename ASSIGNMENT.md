# Project 6: Ruby on Rails Project

SEE THE COMPLETE ASSIGNMENT DESCRIPTION ON THE COURSE WEB PAGE. This is only a summary!

## Individual Assignment (Ruby on Rails Tutorial)

Complete chapters 2, 3, 5, and 6 of the textbook ("Ruby On Rails Tutorial"), Third Edition. Ideally, you would try the main bits of chapters 7 and 8 too, if time permits. You must also study all of the lecture notes on MVC and Rails presented in class.

Everyone in the group **MUST** complete this part of the project **BEFORE** starting the final project. Collaboration is permitted and encouraged! You do not need to submit anything for this part of the project, but completing it as soon as possible is highly recommended as it will help in completing the second part (i.e. the final project, below).

## Final Project (Group Assignment)
<ul>
<li>Your team must meet face-to-face each week with all team members present on the agreed upon day and time your team members indicated to me in your Project #1 submission. </li>
<li>Your team should have additional face-to-face meetings. You should also determine additional channels of communication with team members since you will need to integrate your work with others. </li>
<li> Your team should plan and allocate time to integrate your work well before the deadline. I suggest that the team work with the overall project manager to set team deadlines early so that all team members know the status of everyone's work. Create a schedule that all team members can agree to adhere to and work to achieve towards. </li>
<li>Use your team's private repository on Github to help manage the development of your team's solution. We will provide this private repository for your team in our GitHub organization called cse3901-osu-2018au.</li>
</ul>
Your team will design, develop, and document a web application using Ruby on Rails for the project idea that was approved by the instructor.

Choose project managers playing the same roles as we defined in previous projects, i.e. overall, documentation, and testing.

**ALL team members are required to write Ruby/Rails code** that is submitted in the final solution. **All team members are required to write some portion of the controller** where the workload here is divided evenly. Your solution must have a strong model component with a database that contains multiple tables and relationships between them.

Your solution **must be equally partitioned** between the team members (you will indicate this partitioning in your well documented code and readme file - see below). Your final grade will be based on how well you equally partition this work.

In addition, you should use as many technologies and frameworks as you like to help you develop your web application. Though, remember that your solution must be a Rails implementation. You may find that you want to use some of the technologies and frameworks you learned about in the Tech Task 1 talks. Clearly state in your readme file about all of the technologies and frameworks in your Final Project presentation as this will greatly help with receiving a high score on this assignment.

You must test and document your solution well. I suggest using a Ruby testing framework such as JUnit or RSpec.

## Grading
<ul><li>68% Implementation</li>
Your work (well <strong>documented</strong> and <strong>tested</strong> source code) will be retrieved by the graders from your team's Git repository on Github under the course's organization cse3901-osu-2018au. All team member's work must eventually be merged into a final committed version in the private repository.

Use this link to view <a href="GradingGuidelines.pdf">guidelines</a> when your group is formulating its solution. Though, this is notthe finalized grading template that the graders will use.

<li>10% Presentation</li>
Your presentation should describethe features from an end-user perspective, but should focus on the technical details of thedesign of your application from an implementer'sperspective (database schemas, architecture, etc).

<li>10% Balanced work load</li>
Graders will determine the work load balance of your group work by using Git and Github repository analytics and documentation.In order to receive the full 10% of this portion of your grade, your team must show to the graders that work was equally balanced between the team members. Thus, your team must make a conscious effort to show Git and Github activity by all team members.In addition, your team must clearly document individual contributions in your documentation (see below) throughout thedevelopment of your solution. Activity that indicates only one or two members submitting work will result in a reduction in points.

<pre><code>If team members develop source code in a <a href="http://en.wikipedia.org/wiki/Pair_programming">Pair Programming</a> scenario
then documentation must clearly indicate only contributions from team member(s) who <em>substantially</em> contributed to the source
code. Making minor changes to code or suggestions while watching someone else write code does not count as <em>substantial</em>
contributions and this team member should not be indicated as a contributor. If one team member contributed more than the other team
member in the pair, then your documentation must clearly indicate this. Thus, if a team membersimply watched the other team member
program or contributed very little, then do not indicate this team member as acontributor to the source code in your
documentation.</pre></code>

<li>5% Documentation</li>
Your team must document your solution well. Ensure that documentation is consistent across all source code.

<pre><code>At the top of each file you must indicate which team member created the file and the date of creation. Whenever a team member
edits a file to add functionality or perform debugging that team member must add their name at the top of the file and indicate the date
of their changes and a single line description of their changes. The top of the file must also contain a short paragraph that provides
an overall description of the contents of the file, e.g. what problem you are solving.</pre></code>

<pre><code>Each module (e.g. Ruby function) must indicate the name of the team member that created that function and the date. Each team
member that edits the module must add their name to the list of authors and indicate the date of their changes and as well as a single
line description of their changes. In addition, each module must have at least a single line comment that describes the functionality of
the module.</pre></code>

Use single line commenting where appropriate but not excessive.

<li>5% Testing</li>
At a minimum, your team must provide the graders with a description of your test plan and indicate what does and does not work. It would be very helpful if you provide test cases to the graders as well for both <a href="http://en.wikipedia.org/wiki/Unit_testing">Unit</a> and <a href="http://en.wikipedia.org/wiki/Integration_testing">Integration</a> testing (also see lecture notes).

<li>2% <em>readme</em> file (see below)</li>Provide a readme text file that 1) states your team name and members, 2) chosen managers, 3) describes the organization and structure of your code, 4) describes how the graders will execute your application, and 5) clearly indicates which team member contributed to each part of the solution (<em>only indicate here work that made it to the finalsubmission</em>). Clearly indicate which team members performed testing and to which portions of the solutions. Providing a short or uninformative readmefile will result in considerable point reduction.
</ul>
<hr />

## Submission
<em>Individual submission</em>: Download a peer evaluation form from yourCarmen account, print out the form, and fill out with a pen. Complete this form individually only, i.e. not as a group.Submit this form during the Final Exam. Please staple, if needed! 

<em>Group submission</em>: The graders will retrieve your work (<em>readme</em> plus your solution) from your team's Github private repository provided for you under the course's organization cse3901-osu-2018au. All team member's work must eventually be merged into a final committed version in Git. The <em>readme</em>  contains the names of each project manager and states what each team member <em>specifically</em> contributed to the final submission. <em>For the latter, only report on contributions that made it into to the final solution</em>. Clearly indicate which team members performed testing and to which portions of the solutions. Also include any instructions to the grader as to how to execute the code.

You will submit your project by simplycreating a git <em>tag</em> called "submission" and then pushingthis new tag to your shared repository. (A tag is basicallyan immutable branch.)

That is:
<pre><code>$ git tag -a submission -m "completed project"
$ git push origin submission</code></pre><p>
<strong><em>IMPORTANT</em></strong>: Your repository must include a <em>README</em>text file containing the name of each project manager and adescription of each team member's <em>specific</em> contributionsto the final submission. Clearly indicate each team member'scontributions to development, testing, documentation, etc.Also include instructions for the grader as to how toexecute your program.
