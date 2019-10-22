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
		String output;

		try
		{
			input = Long.parseLong(args[0]);
			output = "" + OpenmrsUtil.convertToInteger(input);
		}
		catch(Exception e)
		{
			output = e.getMessage();
		}

		System.out.println(output);

	}
	
}
