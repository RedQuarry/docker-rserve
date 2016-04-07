#Install Rserve
install.packages('Rserve', repos='http://cran.r-project.org')
library('Rserve')
#Start Rserve
Rserve(debug = false, 6311, args = '--no-save')
