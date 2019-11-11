import org.openmrs.util.OpenmrsUtil;

public class driver2
{

	public static void main(String args[])
	{

		try{
			if(args.length>0)
				System.out.println(OpenmrsUtil.containsOnlyDigits(args[0]));
			else
				System.out.println(OpenmrsUtil.containsOnlyDigits(null));
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	}

}
