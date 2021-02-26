

#initialize a new project environment
renv::init()

#install packages in the project environment
renv::install('ggplot2')

#save state of the project library to the lockfile (called renv.lock)
renv::snapshot()

library('ggplot2')
renv::snapshot()

ggplot(diamonds, aes(x = carat, y = price))
