


# install.packages("xts")

library(xts)
library(datasets)

xts1 <- xts(x=1:10, order.by = Sys.Date()-1:10)
data <- rnorm(5)
dates <- seq(as.Date("2017-05-01"), length=5, by="days")
class(dates)
xts2 <- xts(x=data, order.by = dates)



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

# Create dat by reading tmp_file
dat<-read.csv(tmp_file)

# Convert dat into xts
xts(dat, order.by = as.Date(rownames(dat), "%m/%d/%Y"))

# Read tmp_file using read.zoo
dat_zoo <- read.zoo(tmp_file, index.column = 0, sep = ",", format = "%m/%d/%Y")

# Convert dat_zoo to xts
dat_xts <- as.xts(dat_zoo)

# Exporting xts objects
# Now that you can read raw data into xts and zoo objects, it is only natural that you learn how to reverse the process.
# 
# There are two main use cases for exporting xts objects. First, you may require an object to persist across sessions for use in later analysis. In this case, it is almost always best to use saveRDS() and readRDS() to serialize single R objects.
# 
# Alternatively, you may find yourself needing to share the results of your analysis with others, often expecting the data to be consumed by processes unaware of both R and xts. Most of us would prefer not to think of this horrible fate for our data, but the real world mandates that we at least understand how this works.
# 
# One of the best ways to write an xts object from R is to use the zoo function write.zoo(). In this exercise you'll take your temporary data and write it to disk using write.zoo()

# Convert sunspots to xts using as.xts().
sunspots_xts <- as.xts(sunspots) 

# Get the temporary file name
tmp <- tempfile()

# Write the xts object using zoo to tmp 
write.zoo(sunspots_xts, sep = ",", file = tmp)

# Read the tmp file. FUN = as.yearmon converts strings such as Jan 1749 into a proper time class
sun <- read.zoo(tmp, sep = ",", FUN = as.yearmon)

# Convert sun into xts. Save this as sun_xts
sun_xts<-as.xts(sun) 

# The ISO-8601 standard
# The ISO-8601 standard is the internationally recognized and accepted way to represent dates and times. The standard allows for a common format to not only describe dates, but also to represent ranges and repeating intervals.
# 
# xts makes use of this standard for all extract and replace operations. This makes code both easy to write and easy to maintain. It also makes for very concise expression of date ranges and intervals.
# 
# For xts to work correctly, it is very important to follow the standard exactly. Details can be found in xts subset and .parseISO8601 documentation.
# 
# Which is a valid ISO-8601 string acceptable by xts?
#Not quite! Xts uses a forward slash (/) to denote ranges, so this can't be used as a separator between date columns.

# One of the most powerful aspects of working with time series in xts is the ability to quickly and efficiently specify dates and time ranges for subsetting.
# 
# Date ranges can be extracted from xts objects by simply specifying the period(s) you want using special character strings in your subset.

A["20090825"]       ## Aug 25, 2009
A["201203/201212"]  ## Mar to Dec 2012
A["/201601"]        ## Up to and including January 2016

# Select all of 2016 from x
x_2016 <- x["2016"]

# Select January 1, 2016 to March 22, 2016
jan_march <- x["20160101/2016-03-22"]

# Verify that jan_march contains 82 rows
82 == length(jan_march)

#For this exercise you will create a simple but very common query. Extract a range of dates using the ISO-8601 feature of xts. After successfully extracting a full year, you will then create a subset of your new object with specific start and end dates using this same notation.

# The most common time series data "in the wild" is daily. On occasion, you may find yourself working with intraday data, which contains both dates and times. In this case it is sometimes necessary to view only a subset of time for each day over multiple days. Using xts, you can slice days easily by using special notation in the i = argument to the single bracket extraction (i.e. [i, j]).
# 
# As you learned in the previous exercise, the trick to this is to not specify explicit dates, but rather to use the special T/T notation designed for intraday repeating intervals.

#In this exercise, you will extract recurring morning hours from the time series irreg, which holds irregular data from the month of January 2010. Remember, you can always use the R console to experiment with irreg or to view the help pages with ?xts

# Extract all data from irreg between 8AM and 10AM
morn_2010 <- irreg["T08:00/T10:00"]

# Extract the observations in morn_2010 for January 13th, 2010
morn_2010["2010-01-13"]

# Subset x using the vector dates
x[dates]

# Subset x using dates as POSIXct
x[ as.POSIXct(dates)]

# Update and replace elements
# Replacing values in xts objects is just as easy as extracting them. You can use either ISO-8601 strings, date objects, logicals, or integers to locate the rows you want to replace. One reason you may want to do this would be to replace known intervals or observations with NA, say due to a malfunctioning sensor on a particular day or a set of outliers given a holiday.
# 
# For individual observations located sporadically throughout your data dates, integers or logical vectors are a great choice. For continuous blocks of time, ISO-8601 is the preferred method.
# 
# In this exercise, you'll continue using the vector dates from the previous exercise to modify your x object. Both are already loaded in your workspace.

# Replace the values in x contained in the dates vector with NA
x[dates] <- NA

# Replace all values in x for dates starting June 9, 2016 with 0
x["20160609/"] <- 0

# Verify that the value in x for June 11, 2016 is now indeed 0
x["2016-06-11"]

# Find the first or last period of time
# Sometimes you need to locate data by relative time. Something that is easier said than put into code. This is equivalent to requesting the head or tail of a series, but instead of using an absolute offset, you describe a relative position in time. A simple example would be something like the last 3 weeks of a series, or the first day of current month.
# 
# Without a time aware object, this gets quite complicated very quickly. Luckily, xts has the necessary prerequisites built in for you to use with very little learning required. Using the first() and last() functions it is actually quite easy!
#   
# For this exercise, you'll extract relative observations from a data set called temps, a time series of summer temperature data from Chicago, IL, USA.

# Create lastweek using the last 1 week of temps
lastweek <- last(temps, "1 week")

# Print the last 2 observations in lastweek
last(lastweek, n=2)

# Extract all but the first two days of lastweek
first(lastweek, "-2 days")

# Combining first and last
# Now that you have seen how to extract the first or last chunk of a time series using natural looking language, it is only a matter of time before you need to get a bit more complex.
# 
# In this exercise, you'll extract a very specific subset of observations by linking together multiple calls to first() and last().

# Last 3 days of first week
last(first(Temps, '1 week'), '3 days') 

# You will reconfigure the example above using the temps data from the previous exercise. The trick to using such a complex command is to work from the inside function, out.

# Extract the first three days of the second week of temps
first(last(first(temps, "2 weeks"), "1 week"), "3 days")

# Matrix arithmetic - add, subtract, multiply, and divide in time!
#   xts objects respect time. By design when you perform any binary operation using two xts objects, these objects are first aligned using the intersection of the indexes. This may be surprising when first encountered.
# 
# The reason for this is that you want to preserve the point-in-time aspect of your data, assuring that you don't introduce accidental look ahead (or look behind!) bias into your calculations.
# 
# What this means in practice is that you will sometimes be tasked with handling this behavior if you want to preserve the dimensions of your data.
# 
# Your options include:
# 
# Use coredata() or as.numeric() (drop one to a matrix or vector).
# Manually shift index values - i.e. use lag().
# Reindex your data (before or after the calculation).
# In this exercise, you'll look at the normal behavior, as well as an example using the first option. For now you will use two small objects a and b. Examine these objects in the console before you start.

# Add a and b
a+b

# Add a with the numeric value of b
a+as.numeric(b)

# Math with non-overlapping indexes
# The previous exercise illustrated the ins and outs of doing basic math with xts objects. At this point you are aware that xts respects time and will only return the intersection of times when doing various mathematical operations.
# 
# We alluded to another way to handle this behavior in the last exercise. Namely, re-indexing your data before an operation. This makes it possible to preserve the dimensions of your data by leveraging the same mechanism that xts uses internally in its own Ops method (the code dispatched when you call + or similar).
# 
# The third way involves modifying the two series you want by assuring you have some union of dates - the dates you require in your final output. To do this you will need a few functions that won't be dealt with in depth until Chapter 3, but are very useful here.
# 
# merge(b, index(a))
# Don't worry if you aren't yet familiar with merge(). This exercise may be easier if you just follow along with the instructions.

# Add a to b, and fill all missing rows of b with 0
a + merge(b, index(a), fill = 0)

# Add a to b and fill NAs with the last observation
a + merge(b, index(a), fill = na.locf)

# Perform an inner join of a and b
merge(a, b, join = "inner")

# Perform a left-join of a and b, fill missing values with 0
merge(a, b, join = "left", fill = 0)

load("temps")

# Fill missing values in temps using the last observation
temps_last<-na.locf(temps) 

# Fill missing values in temps using the next observation
temps_next<-na.locf(temps, fromLast = TRUE) 

data(AirPassengers)
View(AirPassengers)
class(AirPassengers)

# Interpolate NAs using linear approximation
na.approx(AirPass) 

# Create a leading object called lead_x
lead_x <- lag(x, k = -1)

# Create a lagging object called lag_x
lag_x <- lag(x, k = 1)

# Merge your three series together and assign to z
z<-merge(lead_x, x, lag_x)


