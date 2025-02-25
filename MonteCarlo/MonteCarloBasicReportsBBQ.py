###############################################################################
#
# File: MonteCarloBasicReportsBBQ.py
#
# Description:
# A basic Monte Carlo simulation in python.
#
# The example is about a person having to write two reports (A and B), which
# takes between 1 and 5 hours for report A and between 2 and 6 hours for report
# B. You start with two uniform distributions (all events have equal probability
# of happening) between the minimum and maximum times. Then, these uniform
# distributions are randomly sampled "sims" times (here 1000000 times). This
# gives two distributions for A and B. A and B are then summed, as you need to
# write both reports. The summed duration is then plotted as a histrogram.
# In the example, the question is asked what the probability is that the writer
# is finished before 9 hours after starting writing the two reports. This
# probability is calculated by summing up all the events of set "duration"
# smaller than 9 hours and dividing the sum by the total number of samples
# "sims". This probability, that the writer will need more than 9 hours to
# write, is then printed at the end.
#
# Source: "A Simple Solution for Really Hard Problems: Monte Carlo Simulation"
#         https://youtu.be/slbZ-SLpIgg
#
# Date: 25 February 2025
#
# -----------------------------------------------------------------------------

import numpy as np

# matplotlib on OpenSUSE 15.6 Leap does not show the plot out of the box.
# A fix that worked from stackoverflow (note: place before pyplot!):
# "there was another post on this here, with a great answer from
# ImportanceofBeingErnest, suggesting to to use 
# import matplotlib; matplotlib.use("TkAgg") before import matplotlib.pyplot as
# plt. You find more on backends on the matplotlib site. You still may have to
# install the appropriate python-to-toolkit packages, eg. python-tkinter and
# python3-tk, or try an already installed backend. For example, qt5agg, provides
# an option to configure some graph parameters interactively.
# Source: https://stackoverflow.com/questions/52417791/
#         plot-doesnt-show-up-in-python-on-opensuse
import matplotlib; matplotlib.use("TkAgg")
import matplotlib.pyplot as plt

# Set a big number of random samples
sims = 1000000

# Randomly sample "sims" times the uniform distributions between the minimum
# value and the maximum value.
A = np.random.uniform(1, 5, sims)
B = np.random.uniform(2, 6, sims)

# As you are writing two reports, sum the durations up
duration = A + B

# Create a plot of the histogram, with density distrubution set to True
plt.figure(figsize = (3, 1.5))
plt.hist(duration, density = True)

# Create a red vertical line to show what is left and right of the deadline
# of 9 hours
plt.axvline(9, color = 'r')
plt.show()

# Calculate the probability that the writer needs more than 9 hours by summing
# up all the events of set "duration" that smaller than 9 hours and then divide
# this sum by the total number of samples ("sims"). Finally, print out this
# probability.
print((duration > 9).sum()/sims)


# ----------------------------------------------------------------- End-of-file
