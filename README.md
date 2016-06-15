## ResuMix

ResuMix is my attempt at making resume writing more efficient and less tedious… maybe even a bit fun!

I noticed that most of the times I need to adapt my resume for the job posting I am applying for. So I thought, why not make each part of a resume a snippet, and mix and match to fit my needs.

### To get Resumix running on development mode:

You will need a standard secrets.yml file (not included) with the 2 following keys added:

* linkedin_api_key: (your own Linkedin api keys)
* linkedin_api_secret: (your own Linkedin api keys)

After this run ```Bundle``` and ```rake db:create```.

#### Current features:

* Sign up and Log in via Linkedin (recommended) and with regular email.
* Create, edit, delete of snippets.
* Option to scrape Language, Summary and Skill details from Linkedin.
* Option to save and to export resumes as pdf.
* 3 basic resume templates (fairly simple template system: edit the css file inside pdf-templates for design changes. For content changes edit show.html.erb).


### Technical Mumble Bumble:
* Built on Ruby on Rails (rails 4.2.6).
* Javascript for multiple visual elements.
* Ajax (To avoid reloads on the snippet toolbox and resume pages).
* Drag and drop built using the awesome jquery ui library.
* Wiked_pdf (gem) is used to generate the pdfs.

For this MVP I have decided to use single table inheritance (STI) for the snippets model paired with the HSTORE datatype for each property of a snippet. This was a self imposed challenge to learn more about these newer data types that enable relational databases to work similar to document oriented databases. (Best of both worlds!)

### Whats next?
Next steps for the app are to improve the design of the resumes, add tests and ability to edit a saved resume. After this the app will be deployed to a VPS for people to use and hopefully collect feedback on where to go next.

If you have any suggestions for this app, if you would like to contribute to it, or if you would like to share feedback, please get in touch on my github bio details!
