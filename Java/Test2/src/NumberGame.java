import java.util.Scanner;

public class NumberGame {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		System.out.println("=== 숫자맞추기 게임을 시작합니다. ===");
		System.out.println("컴퓨터가 숫자를 생각했습니다.");
		int computer = (int)(Math.random()*100 + 1);
//		if(computer%2 == 0) {
//			System.out.println("힌트는 짝수입니다.");
//		}else {
//			System.out.println("힌트는 홀수입니다.");
//		}
		String str = computer%2 == 0 ? "짝수" : "홀수" ;
		System.out.println("힌트는 "+str+"입니다.");
		int count = 0;
		while(true) {
			System.out.print("1~100 사이의 값을 입력 >>");
			int player = sc.nextInt();
			count++;
			if(player == computer) {
				break;
			}else if(player > computer) {
				System.out.println("더 작은 수입니다.");
			}else {
				System.out.println("더 큰 수입니다.");
			}
		}
		System.out.println(count+"회 만에 맞췄습니다.");
		System.out.println("=== 게임을 종료합니다. ===");
//		=== 숫자맞추기 게임을 시작합니다. ===
//		컴퓨터가 숫자를 생각했습니다.
//		힌트는 홀수입니다.
//		1~100 사이의 값을 입력 >> 5
//		더 큰 수입니다.
//		1~100 사이의 값을 입력 >> 77
//		더 작은 수입니다.
//		1~100 사이의 값을 입력 >> 27
//		3회 만에 맞췄습니다.
//		=== 게임을 종료합니다. ===
	}

}
