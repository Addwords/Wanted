package first.common.util;

import java.util.Date;

public class TimeDistance {
	private static class TIME_MAXIMUM
    {
        public static final int SEC = 60;
        public static final int MIN = 60;
        public static final int HOUR = 24;
        public static final int DAY = 30;
        public static final int MONTH = 12;
    }

    public static String calculateTime(Date date)
    {

        long curTime = System.currentTimeMillis();
        long regTime = date.getTime();
        long diffTime = (curTime - regTime) / 1000;

        String msg = null;

        if (diffTime < TIME_MAXIMUM.SEC)
        {
            // sec
            msg = diffTime + " seconds ago";
        }
        else if ((diffTime /= TIME_MAXIMUM.SEC) < TIME_MAXIMUM.MIN)
        {
            // min
            msg = diffTime + " minutes ago";
        }
        else if ((diffTime /= TIME_MAXIMUM.MIN) < TIME_MAXIMUM.HOUR)
        {
            // hour
            msg = (diffTime ) + " hours ago";
        }
        else if ((diffTime /= TIME_MAXIMUM.HOUR) < TIME_MAXIMUM.DAY)
        {
            // day
            msg = (diffTime ) + " days ago";
        }
        else if ((diffTime /= TIME_MAXIMUM.DAY) < TIME_MAXIMUM.MONTH)
        {
            // day
            msg = (diffTime ) + " months ago";
        }
        else
        {
            msg = (diffTime) + " years ago";
        }
        
        return msg;
    }

}
