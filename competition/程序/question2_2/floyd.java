public class floyd {
	
	public static void main(String[] args) {
		int MIN = 0;
		
		char[] Nodes = new char[]{'W','L','K','G','C','c','X','w','Z','S','B','H'};
        double matrix[][] = {
                 /*A*//*B*//*C*//*D*/
          /*A*/ { 0,     11.03, MIN,    MIN,    85.42, 62.38, 46.78, 51.72, 49.31,76.4,   94.86,  49.32 },
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
        	
        double[] dist = new double[Nodes.length];
        
        Floyd floyd = new Floyd(Nodes, matrix);
        floyd.floyd(11, dist);
	}
	
	public static class Floyd {
		
		private final int MIN = Integer.MIN_VALUE;
		
		double[][] Matrix;
		char[] Nodes;
		
		public  Floyd(char[] Nodes, double[][] Matrix){
			this.Nodes = Nodes;
			this.Matrix = Matrix;
		}
		
		/**
		 * floyd算法
		 * 
		 * 参数说明：
		 * @param node  起点
		 * @param distance 长度数组，distance[i]表示从起点到i点的最短路径
		 */
		public  void floyd(int node, double[] distance){
			
			 boolean[] flag = new boolean[Nodes.length];
			
			//初始化
			for(int i=0; i<Nodes.length; i++){
				flag[i] = false;
				distance[i] = Matrix[node][i];
			}
			
			//对顶点node本身进行初始化
			flag[node] = true;
			distance[node] = 0;
			
			//遍历Nodes.length - 1次，每次找出一个顶点点最短路径
			int k = 0;
			for(int i=1; i<Nodes.length; i++){
				double min = MIN;
				
				//寻找最短路径
				for(int j=0; j<Nodes.length; j++){
					if(flag[j] == false && distance[j] > min){
						k = j;
						min = distance[j];
					}
				}
				flag[k] = true;
				
				//更新Matrix点值
				for(int j=0; j<Nodes.length; j++){
					double len = Matrix[k][j] == MIN ? MIN : min + Matrix[k][j];
					if(flag[j] == false && len > distance[j]){
						distance[j] = len;
					}
				}
			}
			System.out.printf("Floyd(%c): \n", Nodes[node]);
			double d=0;
			for (int i=0; i < Nodes.length; i++) 
	            {System.out.printf("shortest(%c, %c)=%f\n", Nodes[node], Nodes[i], distance[i]);
	            d=d+distance[i];
	            }
			System.out.println(d);
		}
		
	 
	}

}

