import org.openmrs.util.OpenmrsUtil;

public class methodDriver1 {
	
	public static void main(String args[]) {
		
		System.out.println("Hello World!");
		
		System.out.print("Your input is: ");
	
		for (int i = 0; i < args.length; i++) {
			
			System.out.print(args[i] + " ");
			
		}

		System.out.println();
		System.out.print("Your output is: ");

		long input;
		int output;

		if(args.length>=1)
		{			
			input = Long.parseLong(args[0]);
			output = OpenmrsUtil.convertToInteger(input);
			System.out.print(output);
		}

		System.out.println();

	}
	
}
