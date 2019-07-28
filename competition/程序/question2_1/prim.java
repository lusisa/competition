
import java.util.*;
public class prim {
	static int MIN = Integer.MIN_VALUE;
	public static void main(String[] args) {
		double[][] map = new double[][] {
				{ 0,     11.03, MIN,    MIN,    85.42, 62.38, 46.78, 51.72, 49.31,76.4,   94.86,  49.32 },
				{ 11.03, 0,     14.97,  MIN,    30.98,22.63,16.97,18.76,MIN,27.71,        34.41,  MIN },
				{ MIN,   14.97, 0,      235.69, 463.72,338.66,127,70.2,66.93,103.69,      128.75, MIN },
				{ MIN,   MIN,   235.69, 0,      487.93,356.34,133.63,295.46,140.86,218.21,270.94, 140.85},
				{ 85.42, 30.98, 463.72, 487.93, 0,701.08,525.81,290.65,277.13,214.66,     266.53, 138.56},
				{ 62.38, 22.63, 338.66, 356.34, 701.08,0,384,212.26,202.39,156.77,        194.65, 101.19},
				{ 46.78, 16.97, 127,    133.63, 525.81,384,0,159.2,303.58,235.15,         291.97, 75.89},
				{ 51.72, 18.76, 70.2,   295.46, 290.65,212.26,159.2,0,335.62,259.97,      322.79, 83.9},
				{ 49.31, MIN,   66.93,  140.86, 277.13,202.39,303.58,335.62,0,247.87,     615.53, 80},
				{ 76.4,  27.71, 103.69, 218.21, 214.66,156.77,235.15,259.97,247.87,0,     476.79, 123.94},
				{ 94.86, 34.41, 128.75, 270.94, 266.53,194.65,291.97,322.79,615.53,476.79,0,      307.77},
				{ 49.32, MIN,   MIN,    140.85, 138.56,101.19,75.89,83.9,80,123.94,       307.77, 0},};
		prim(map, map.length);
	}
	
	 public static void prim(double[][] graph, int n){
	        
	        char[] c = new char[]{'W','L','K','G','C','c','X','w','Z','S','B','H'};        
	        double[] lowcost = new double[n];  //到新集合的最小权 
	        int[] mid= new int[n];//存取前驱结点
            List<Character> list=new ArrayList<Character>();//用来存储加入结点的顺序
            List<Double> list1=new ArrayList<Double>();
            List<Double> listAll=new ArrayList<Double>();
            List<Double> list16=new ArrayList<Double>();
            List<Double> list33=new ArrayList<Double>();
	        int i, j, minid ;
	        double min,sum=0;
	        //初始化辅助数组
	        for(i=1;i<n;i++)
	        {
	        	lowcost[i]=graph[0][i];
	        	mid[i]=0;
	        }
	        list.add(c[0]);
            //一共需要加入n-1个点
	        for(i=1;i<n;i++)
	        {
	        	 min=MIN;
	        	 minid=0;
	        	 //每次找到距离集合最近的点
	        	 for(j=1;j<n;j++)
	        	 {
	        		 if(lowcost[j]!=0&&lowcost[j]>min)
	        		 {
	        			 min=lowcost[j];
	        			 minid=j;
	        		 }
	        	 }
	        	 
	        	 if(minid==0) return;
	        	 list.add(c[minid]);
	        	 lowcost[minid]=0;
	        	 list1.add(min);
	        	 sum+=min;
	        	 System.out.println(c[mid[minid]] + "到" + c[minid] + " 权值：" + min);
	        	 //加入该点后，更新其它点到集合的距离
	        	 for(j=1;j<n;j++)
	        	 {
	        		 if(lowcost[j]!=0&&lowcost[j]<graph[minid][j])
	        		 {
	        			 lowcost[j]=graph[minid][j];
	        			 mid[j]=minid;
	        		 }
	        	 }
	        }
	        System.out.println("sum:" + sum);
	        //System.out.println(list);
	        //System.out.println(list1);
	       
	        for (int m = 0; m < graph.length; m++) {
				for (int p = 0; p < graph[m].length; p++) {
					listAll.add(graph[m][p]);
				}
			}
	        //System.out.println(listAll);
	        Collections.sort(listAll,Collections.reverseOrder());
	        //System.out.println(listAll);
	        int q1=5;
	        int q2=22;
	        double sum16=sum;
	        double sum33=sum;
	        for(int o=0;o<listAll.size();o++){
	        	double result=listAll.get(o);
	        	if(!list1.contains(result) && !list16.contains(result) && q1>0)
	        		{list16.add(result);
	        		sum16=sum16+result;
	        		q1--;}
	        	if(!list1.contains(result) && !list33.contains(result) && q2>0)
        		{list33.add(result);
        		sum33=sum33+result;q2--;}
	        	if(q1==0 && q2==0) break;
	        }
	        System.out.println("16条剩下的路径权值为:"+list16);
	        System.out.println("sum16:"+sum16);
	        System.out.println("33条剩下的路径权值为:"+list33);
	        System.out.println("sum33:"+sum33);
	    } 
	 

}
