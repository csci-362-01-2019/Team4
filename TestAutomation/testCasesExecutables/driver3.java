import org.openmrs.util.OpenmrsUtil;

public class driver3
{

	public static void main(String args[])
	{
		String output;
		try{

		if(args.length>0)
			System.out.println(OpenmrsUtil.containsDigit(args[0]));
		else
			System.out.println(OpenmrsUtil.containsDigit(null));

		}
		catch(Exception e){
			output = e.getMessage();
			System.out.println(output);
		}
	}

}
