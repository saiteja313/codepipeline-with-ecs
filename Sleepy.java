public class Sleepy
{
    public static void main(final String[] array) {
        System.out.println("I am so tired!");
        System.out.flush();
        try {
            while (true) {
                Thread.sleep(1000L);
            }
        }
        catch (InterruptedException ex) {
            ex.printStackTrace();
        }
    }
}
