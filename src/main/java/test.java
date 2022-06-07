import com.business.EBofactory;
import com.entity.EntityModel;
import com.entity.ShoppingcartModel;

import java.util.HashMap;
import java.util.List;

/**
 * @Author hongxiaobin
 * @Time 2022/5/27-9:23
 */
public class test {
    public static void main(String[] args) {
        boolean list = EBofactory.getgoodsebiempl().isPay("15875195553","131231241123",8);
        System.out.println(list);
    }
}
