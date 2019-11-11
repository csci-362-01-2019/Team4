import org.openmrs.util.OpenmrsUtil;

public class driver4
{

	public static void main(String args[])
	{
		try{

			String myArray[];
			if(args.length>1)
			{
				myArray = new String[args.length - 1];
				for(int i = 1; i < args.length; i++)
					myArray[i-1] = args[i];
			}
			else
			{
				myArray = new String[1];
			}


				System.out.println(OpenmrsUtil.isStringInArray(args[0], myArray));
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	}

}
