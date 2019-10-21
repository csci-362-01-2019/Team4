import org.openmrs.util.OpenmrsUtil;

public class methodDriver1 {
	
	public static void main(String args[]) {
		
		System.out.println("Hello World!");
		
		
		if (args.length>=1) 
		{
			System.out.print("Your input is: ");
		
			for (int i = 0; i < args.length; i++) {
				
				System.out.print(args[i] + " ");
				
			}

			System.out.println();
			System.out.print("Your output is: ");

			int output;			

			output = OpenmrsUtil.convertToInteger(Long.parseLong(args[0]));
			System.out.println(output);
		
		}
		else
		{

			System.out.println("You did not provide an input");

		}		
	}
	
}
