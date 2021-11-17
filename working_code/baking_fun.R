
desserts = data.frame(dessert = c("pound_cake","pancakes","meringue","choux_pastry","pie","fritter", "cookie","custard","biscuit", "crepe","muffin"),
           flour = c(2,1,2,0,1,3,2,3,3,0.5,2), sugar = c(1,0,2,0,0,0,1,0,0,0,0),
           eggs = c(1,1,1,2,0,1,0,2,0,1,1), fat = c(1,0.5,0,1,2,0,2,0,1,0,1),
           liquid = c(0,2,0,2,1,2,0,1,2,1,2))

library(vegan)
desord = metaMDS(desserts[,-1])
plot(desord)

dessert_data = data.frame(NMDS1 = desord$points[,1], NMDS2= desord$points[,2],
                          dessert = desserts$dessert)

ingredient_data =as.data.frame(scores(desord, "species"))
ingredient_data$ingredient=row.names(ingredient_data)

ggplot(dessert_data, aes(x=NMDS1, y=NMDS2))+
  #geom_point(aes(col=dessert))+
  #geom_point(data=ingredient_data,aes(x=NMDS1, y=NMDS2), shape="X", col="red")+
  theme_bw(base_size=14)+
  geom_text(data=ingredient_data, aes(label=ingredient))+
  geom_text(aes(label=dessert, col=dessert))

