import org.openmrs.util.OpenmrsUtil;

public class methodDriver1 {
	
	public static void main(String args[]) 
	{

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
