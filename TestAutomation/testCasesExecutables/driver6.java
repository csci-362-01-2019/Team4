import org.openmrs.util.OpenmrsUtil;

public class driver6
{
	public static void main(String[] args)
	{
		if(args.length>=2)
		{		
			String[] arr = new String[args.length-1];
			for(int i = 0; i < arr.length; i++)
			{
				arr[i]=args[i+1];
			}

			try
			{
				System.out.println(OpenmrsUtil.isStringInArray(args[0], arr));
			}

			catch(Exception e)
			{
				System.out.println(e.getMessage());
			}
		}
		else
		{
			System.out.println(false);
		}

	}

}
