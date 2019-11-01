import org.openmrs.util.OpenmrsUtil;

public class driver1 {
	
	public static void main(String args[]) 
	{

		long input;
		String output;

		try                                                //checks if the input isn't a number or bigger than a long
		{
			input = Long.parseLong(args[0]);
		}
		catch(NumberFormatException e)
		{
			System.out.println("Number Format Exception");
			return;
		}


		try
		{
			output = "" + OpenmrsUtil.convertToInteger(input);
		}
		catch(Exception e)
		{
			output = e.getMessage();
		}

		System.out.println(output);

	}
	
}
