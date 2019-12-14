install.packages("xts")

library(xts)

# View the structure of ex_matrix
str(ex_matrix)

# Extract the 3rd observation of the 2nd column of ex_matrix
ex_matrix[3, 2]

# Extract the 3rd observation of the 2nd column of core 
core[3, 2]

# Create the object data using 5 random numbers
data<-rnorm(5)

# Create dates as a Date class object starting from 2016-01-01
dates <- seq(as.Date("2016-01-01"), length = 5, by = "days")
View(dates)

# Use xts() to create smith
smith <- xts(x = data, order.by = dates)
View(smith)

# Create bday (1899-05-08) using a POSIXct date class object
bday <- as.POSIXct("1899-05-08")

# Create hayek and add a new attribute called born
hayek <- xts(x = data, order.by = dates, born = bday)
View(hayek)

# Deconstructing xts
# Now that you can create xts objects, your next task is to examine an xts object from the inside.
# 
# At the core of both xts and zoo is a simple R matrix with a few additional attributes. The most important of these attributes is the index. The index holds all the information we need for xts to treat our data as a time series.
# 
# When working with time series, it will sometimes be necessary to separate your time series into its core data and index attributes for additional analysis and manipulation. The core data is the matrix portion of xts. You can separate this from the xts object using coredata(). The index portion of the xts object is available using the index() function. Note that both of these functions are methods from the zoo class, which xts extends.
# 
# In this exercise you will use these built-in functions to extract both the internal matrix data and internal index from your sample xts object. You will use the hayek time series you created in the last exercise to practice these new functions.

# Extract the core data of hayek
hayek_core<-coredata(hayek)

# View the class of hayek_core
class(hayek_core)

# Extract the index of hayek
hayek_index<-index(hayek)

# View the class of hayek_index
class(hayek_index)

# Create dates
dates <- as.Date("2016-01-01") + 0:4

# Create ts_a
ts_a <- xts(x = 1:5, order.by = dates)

# Create ts_b
ts_b <- xts(x = 1:5, order.by = as.POSIXct("2016-01-01")+ 0:4)

# Extract the rows of ts_a using the index of ts_b
ts_a[index(ts_b)]

# Extract the rows of ts_b using the index of ts_a
ts_b[index(ts_a)]

# Converting xts objects
# It is often necessary to convert between classes when working with time series data in R. Conversion can be required for many reasons, but typically you'll be looking to use a function that may not be time series aware or you may want to use a particular aspect of xts with something that doesn't necessarily need to be a full time series.
# 
# Luckily, it is quite easy to convert back and forth using the standard as.* style functionality provided in R (for example, as.POSIXct() or as.matrix()).
# 
# xts provides methods to convert all of the major objects you are likely to come across. Suitable native R types like matrix, data.frame, and ts are supported, as well as contributed ones such as timeSeries, fts and of course zoo. as.xts() is the workhorse function to do the conversions to xts, and similar functions will provide the reverse behavior.
# 
# To get a feel for moving data between classes, let's try a few examples using the Australian population ts object from R named austres.

data("austres")
View(austres)
class(austres)
str(austres)

# Convert austres to an xts object called au
au <- as.xts(austres)

# Then convert your xts object (au) into a matrix am
am <- as.matrix(au)

# Inspect the head of am
head(am)

# Convert the original austres into a matrix am2
am2<- as.matrix(austres)

# Inspect the head of am2
head(am2)
















