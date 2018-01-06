
interface Area{
	final static  float PI=3.14f;
	float compute (float x,float y);
}
class Rectangle implements Area{
	public float compute(float x,float y)
	{
	return (x*y);	
	}
}

class Circle implements Area{
	public float compute(float x,float y){
		return(PI*x*x);
	}
}

 class  Test {
	 public static void main(String args[]){
		 
		 Rectangle r1=new Rectangle();
		 Circle c1=new Circle();
		 Area a1;
		 a1=r1;
		 System.out.println("Area of the rectangle=" +a1.compute(10, 20));
		 a1=c1;
		 System.out.println("Area of the circle=" +a1.compute(12, 0));
	 }

}
