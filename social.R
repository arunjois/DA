library(igraph)
g <- graph(c("A","B","B","C","C","D","D","E","A"),directed = F)
plot(g,vertices.color="green",vertices.size =25,edge.color="red")
g[]
ng <- graph(c(1,2,2,3,3,1),directed = F)
plot(g,vertices.color="green",vertices.size=25,edge.color="red")

degree(g,mode = 'all')
degree(g,mode = 'in')
degree(g,mode = 'out')

closeness(g,mode = 'all',weights = NA)
betweenness(g,directed = F, weights = NA)
edge.betweenness(g,directed = T, weights = NA)

cliques(g, min = NULL, max = NULL)
clique.number(g)
clique_num(g)

transitivity(ng)

components(ng, mode = c("weak","strong"))
clusters(ng, mode = c("weak","strong"))
plot(ng)

neighborhood.size(ng)
cohesive.blocks(ng)
