class Solution {
}
public class Q1 {
	public static int solution(String ineq, String eq, int n, int m) {
        boolean answer = false;
        if(ineq.equals(">") && eq.equals("=")){
            answer = n >= m;
        }else if(ineq.equals(">") && eq.equals("!")){
            answer = n > m;
        }else if(ineq.equals("<") && eq.equals("=")){
            answer = n <= m;
        }else if(ineq.equals("<") && eq.equals("!")){
            answer = n < m;
        }
        
        return answer ? 1 : 0;
    }
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println(solution("<", "=", 20, 50));
		
	}

}
