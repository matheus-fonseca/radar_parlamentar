# Exemplo 1.
#
# Faz análise por parlamentar e plota nuvem de pontos das PC1 e PC2
# coloridos por partido.
#
# Rodar apenas apos ter feito:
# > source("radar.R")
# para carregar as funcoes.

r <- radarpca(rcdados, lop = 0, minvotes = 11,scale=FALSE,center=FALSE)
xx <- r$pca$x[,1]
yy <- r$pca$x[,2]
partido <- factor(r$rcobject$legis.data)
num.partidos <- length(levels(partido))
paleta <- colorRampPalette(c("darkblue","blue","yellow","green","darkmagenta","cyan","red","black","aquamarine"),space = "Lab")(num.partidos)
cor <- paleta[as.integer(partido)]

#symbols(xx,yy,circles=rep(1,length(xx)),inches=0.05,fg=cor)
#legend("topright",levels(partido),col=paleta[1:22],pch=19)

#plot(r$pca$x[,1],r$pca$x[,2]) # gráfico em preto e branco

# por partido:
#rr <- pca(por.partido(rcdados))
#plotar(rr)

# para fazer um wnominate basta utilizar o objeto rcdados:
#
#   wn <- wnominate(rcdados,polarity=c(1,1))
#
# e para ver os resultados, use summary ou plot:
#
#   summary(wn)
#   plot(wn)
#
# note que não é possível fazer o wnominate em dados agregados
# por partido, pois neste caso as votações não são "sim" ou "não",
# e sim um valor numérico que resume o voto médio do partido.
