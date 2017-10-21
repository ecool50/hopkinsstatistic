# Hopkins statistic
R function to calculate the Hopkins statistic of clustering tendency (H).

See this blog entry for why to calculate the Hopkins statistic: https://www.r-bloggers.com/assessing-clustering-tendency-a-vital-issue-unsupervised-machine-learning/

However, this blog (and the origial one this one is derived from) contain a mismatch between the equation for H and the implementation in the packages "clustertend" and "factoextra". The equation says that the H shouldncrease with the clustering tendency, but the clusterdata implementation does the opposite. 

The function provided here implements H as per the equation which is also defined in the Wikipedia: https://en.wikipedia.org/wiki/Hopkins_statistic.

It also uses the FNN package providing a much faster implementation compared to both "clustertend" and "factoextra".
