package POJO;

import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Storage implements Cloneable{
    private final static Logger LOGGER = Logger.getLogger("POJO.Storage");

    private BoxStack [] stacks;
    private final int NUM_STACKS = 5;

    public Storage() {
        this.stacks = new BoxStack[NUM_STACKS];
        for(int i=0; i<NUM_STACKS; i++)
            this.stacks[i] = new BoxStack(i);
    }

    public Storage(int numStacks, int numBoxPerStack) {
        this.stacks = new BoxStack[ (numStacks<=0) ? NUM_STACKS : numStacks];
        for(int i=0; i<NUM_STACKS; i++)
            this.stacks[i] = new BoxStack(i, numBoxPerStack);
    }

    private Storage(BoxStack [] boxStack){
        this.stacks = boxStack;
    }

    @Override
    public Object clone(){
        BoxStack [] newBoxStack = new BoxStack[NUM_STACKS];
        for(int i =0; i<this.stacks.length; i++){
            newBoxStack[i] = (BoxStack) this.stacks[i].clone();
        }
        return new Storage(newBoxStack);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Storage)) return false;

        Storage storage = (Storage) o;

        for(int i=0; i<this.getStacks().length; i++){
            if(!this.getStacks()[i].equals(storage.getStacks()[i]))
                return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        return Arrays.hashCode(getStacks());
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();

        for(BoxStack bs : stacks)
            sb.append("\n\t").append(bs.toString());

        return sb.toString();
    }

    public BoxStack[] getStacks() {
        return stacks;
    }
}
