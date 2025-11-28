import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

class Phone{
	private String name;
	private String tel;
	private String address;
	public Phone(String name, String tel, String address) {
		this.name = name;
		this.tel = tel;
		this.address = address;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return name + "의 번호와 주소는 "
				 +tel + ", "
				 +address + " 입니다.";
	}
}


public class PhoneManager {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		Map<String, Phone> map = new HashMap<>();
		System.out.print("인원수 >>");
		int count = sc.nextInt();
		for(int i=0; i<count; i++) {
			System.out.print("이름과 전화번호(번호는 연속적으로 입력), 주소 >>");
			String name = sc.next();
			map.put(name, new Phone(name, sc.next(), sc.next()));
		}
		System.out.println("저장되었습니다...");
		while(true) {
			System.out.print("검색할 이름 >>");
			String name = sc.next();
			if(name.equals("exit")) break;
			if(map.containsKey(name)) {
				System.out.println(map.get(name));
			}else {
				System.out.println(name + " 은(는) 없습니다.");
			}
		}
		System.out.println("프로그램을 종료합니다...");
//		인원수 >> 3
//		이름과 전화번호(번호는 연속적으로 입력), 주소 >> 김인수 111-1111 서울
//		이름과 전화번호(번호는 연속적으로 입력), 주소 >> 조수미 222-2222 부산
//		이름과 전화번호(번호는 연속적으로 입력), 주소 >> 한원선 333-3333 경기도
//		저장되었습니다...
//
//		검색할 이름 >> 한원선
//		한원선의 번호와 주소는 333-3333, 경기도 입니다.
//		검색할 이름 >> 박인수
//		박인수 은(는) 없습니다.
//		검색할 이름 >> exit
//		프로그램을 종료합니다...
	}

}





