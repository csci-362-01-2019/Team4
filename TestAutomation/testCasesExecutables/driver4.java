import org.openmrs.util.OpenmrsUtil;

public class driver4
{

	public static void main(String args[])
	{

		if(args.length>1)
			System.out.println(OpenmrsUtil.isStringInArray(args[0], args[1]));

	}

}
