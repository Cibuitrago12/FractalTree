private double fractionLength = .8; 
private int smallestBranch = 30; 
private double branchAngle = .4; 
public void setup() 
{   
	size(1000,1000);    
	noLoop(); 
	background(200);
} 
public void draw() 
{   
	stroke(0);   
	drawBranches(500,900,300, (float)(3*Math.PI/2));  
} 

public void drawBranches(float x,float y, float branchLength, float angle) 
{   
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;
	branchLength*= fractionLength;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(y+branchLength*Math.sin(angle1));
	int endX2 = (int)(x-branchLength*Math.cos(angle1));
	int endY2 = (int)(y+branchLength*Math.sin(angle1));
    strokeWeight(3);

	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);
	if(branchLength >= smallestBranch){
		drawBranches((float)endX1, (float)endY1, branchLength, (float)angle1);
		drawBranches((float)endX2, (float)endY2, branchLength, (float)angle2);
	} 
} 
