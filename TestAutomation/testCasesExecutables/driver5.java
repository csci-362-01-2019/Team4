import org.openmrs.util.OpenmrsUtil;

public class driver5
{
	public static void main(String[] args)
	{
		String input = "";
		for(int i = 0; i < args.length; i++)
			input += args[i];
		try
		{
			System.out.println(OpenmrsUtil.containsUpperAndLowerCase(input));
		}

		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}

	}

}