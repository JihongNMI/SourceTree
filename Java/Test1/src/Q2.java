import java.util.Scanner;

public class Q2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		while(true) {
			String str = sc.nextLine();
			if(str.equals("exit")) {
				break;
			}
			System.out.println("어절 개수는 " + str.split(", ").length);
		}
		System.out.println("종료합니다...");
//		apple, orange, banana, strawberry
//		어절 개수는 4
//		사과, 오렌지, 바나나
//		어절 개수는 3
//		exit
//		종료합니다...
	}

}
