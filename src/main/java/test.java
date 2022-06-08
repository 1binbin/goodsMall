import com.business.EBofactory;
import com.entity.GoodsModel;

import java.util.List;

/**
 * @Author hongxiaobin
 * @Time 2022/6/8-19:53
 */
public class test {
    public static void main(String[] args) {
        List<GoodsModel> list1 = EBofactory.getgoodsebiempl().getGoodsAll();
        System.out.println(list1.toString());
    }
}
