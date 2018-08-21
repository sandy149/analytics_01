#clustering 

marks1 <- sample(1.0:300.0,size = 30)
length(marks1)
plot(marks1)

k1 = kmeans(marks1 , centers = 2)
k1
plot(cbind( marks1, k1$cluster) , pch = 10, col = k1$cluster)
#plot(k1, pch = 10, col = k1$cluster)

marks2 = sample(1:900, size = 30)
newmarks = data.frame( marks1, marks2)
newmarks
k2 = kmeans( newmarks, centers = 3)
plot( k2)

