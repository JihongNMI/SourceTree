import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;

public class Q3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		Map<String, Integer> map = new HashMap<>();
		System.out.println("<< 통장 관리 프로그램입니다. >>");
		while(true) {
			System.out.print("이름과 금액 입력>>");
			String name = sc.next();
			if(name.equals("exit")) break;
			int money = sc.nextInt();
//			중복 데이터 확인 후 기존 데이터를 수정
			if(map.containsKey(name)) {
				money += map.get(name);
			}
			map.put(name, money);
//			맵을 반복하여 데이터 출력하는 방식
			for(String key : map.keySet()) {
				System.out.print("("+key+">"+map.get(key)+")");
			}
			System.out.println();
		}
		System.out.println("프로그램을 종료합니다...");
//		<< 통장 관리 프로그램입니다. >>
//		이름과 금액 입력>> 홍길동 45000
//		(홍길동>45000원) 
//		이름과 금액 입력>> 김철수 2800
//		(홍길동>45000원)(김철수>2800원)
//		이름과 금액 입력>> 홍길동 500
//		(홍길동>45500원)(김철수>2800원)
//		이름과 금액 입력>> 김철수 1800
//		(홍길동>45500원)(김철수>4600원)
//		이름과 금액 입력>> exit
//		프로그램을 종료합니다...
	}

}
