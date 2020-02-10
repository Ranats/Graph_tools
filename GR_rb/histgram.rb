require 'gr/plot'
require "histogram"

sd = "6.425729531	5.035871325	0	10.40240357	3.714835124	7.955501241	0	5.146843693	9.011104261	7.354590403	9.310746479	4.290687591	4.7	4.337049688	2.773084925	4.098780306	0	10.50523679	0	6.049793385	5.386093204	4.915282291	2.913760457	4.749736835	3.853569774	4.92341345	8.333066662	0	0	0	6.372597587	0	3.822302971	8.993886813	3.469870315	6.331666447	2.785677655	4.075536774	5.717516944	6.131883887	8.371977066	3.3	10.37737925	6.403905059	3.689173349	5.16139516	7.77431669	5.107837116	8.836854644	0	3.57211422	4.261455151	3.852272057	11.54296322	7.997499609	5.015974482	2.578759392	7.66093989	9.035485598	6.708949247	5.272570531	7.972452571	6.542170894	8.158431222	3.44818793	4.862098312	14.30524379".split(" ").reject{|x| x == "#DIV/0!" or x == 0}.map(&:to_f)
cv = "0.578894552	0.493712875	#DIV/0!	0.240240267	0.371483512	0.607290171	#DIV/0!	0.519883201	0.474268645	0.561419115	0.212089897	0.366725435	0.516483516	0.421072785	0.454604086	0.512347538	#DIV/0!	0.188265892	#DIV/0!	0.465368722	0.424101827	0.43886449	0.422284124	0.539742822	0.592856888	0.512855568	0.718367816	#DIV/0!	#DIV/0!	#DIV/0!	0.465153109	#DIV/0!	0.300968738	0.470884126	0.642568577	0.523278219	0.339716787	0.491028527	0.472522061	0.360699052	0.347384941	0.417721519	0.279713726	0.331808552	0.396685306	0.486924072	0.191485633	0.395956366	0.133689178	#DIV/0!	0.364501451	0.546340404	0.409816176	0.233663223	0.196017147	0.425082583	0.271448357	0.584804572	0.199019507	0.105321024	0.659071316	0.293104874	0.594742809	0.304419075	0.378921751	0.45868852	0.091465753".split(" ").reject{|x| x == "#DIV/0!" or x == 0}.map(&:to_f)
p sd
p cv

GR.histogram(sd, nbins: 10, ymax: 15)
GR.savefig("hist_sd.png")
GR.histogram(cv, nbins: 10, ymax: 15)
GR.savefig("hist_cv.png")
