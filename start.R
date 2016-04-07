#Install Rserve
install.packages('Rserve', repos='http://cran.r-project.org')
library('Rserve')
#Start Rserve
Rserve(debug = TRUE, 6311, args = NULL, config.file = "Rserv.conf")
