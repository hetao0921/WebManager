import java.util.Iterator;

public class TestFor {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int a=0;
		for (int i = 0; i < 10; i++) {
			int count = 0;
			System.out.println("i:" + i);
			while (true) {
				System.out.println("while i:" + i);
				if (count < 5) {
					System.out.println(" i++:" + i);
					if(i==3){
					break;
					}else{
						System.out.println("count i:" + i);
						count=count+1;
						System.out.println("count++== i:" + count);
						try {
							Thread.sleep(1000);
						} catch (InterruptedException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}else{
					break;
				}
			}
		}

	}

}
