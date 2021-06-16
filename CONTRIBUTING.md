
#		HOW TO CONTRIBUTE

Contributions from other developers are welcomed whether they are new 
feature related or documentation related.

Please fork repository, make your changes and create a pull request. 
If the change is a major change to the way the script(s) work, a 
language translation OR you want to add a feature that would involve 
significant work, please open a DISCUSSION post to discuss how the 
implementation would work.   


## NEW FEATURE PULL REQUESTS 

Please add sufficient description to the comments of the pull request 
to describe the additional feature(s) added.

For each feature added the documentation will need to be amended as 
needed including the README.md file, the man pages in docs/* and where 
necessary the other documentation files in the root directory of the 
repo.


## DOCUMENTATION PULL REQUESTS

Please run the aspell(1) spelling checker and the diction(1) grammar 
checker on any documentation changed.

	$ aspell -c <filename>

	$ diction -s <filename> 


## BUGS

Known bugs should have a corresponding ISSUE created. 

Pull requests should not have any known bugs before the pull request 
is created. EXCEPTION: if there is a feature yet-to-be-implemented, 
please (1) mention this in the pull request comments, and (2) raise an 
issue of type BUG once pull request is accepted.


## FEATURE ROADMAP

Please see the file ROADMAP for a list of features currently being 
considered by the author for inclusion. This list is NOT exhaustive 
and contributors should feel free to propose and code for additional 
features not on the ROADMAP.

-
ian
