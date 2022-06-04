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
        List<List<EntityModel>> list = EBofactory.getotherEbimpl().getList("15875195553","yes" +
                "","","","","","all");
        System.out.println(list);
    }
}
