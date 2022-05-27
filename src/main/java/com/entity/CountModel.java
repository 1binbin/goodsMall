package com.entity;

/**
 * @Author hongxiaobin
 * @Time 2022/5/27-9:19
 */
public class CountModel {
    private int allCount;

    public CountModel() {
    }

    public CountModel(int allCount) {
        this.allCount = allCount;
    }

    public int getAllCount() {
        return allCount;
    }

    public void setAllCount(int allCount) {
        this.allCount = allCount;
    }
}
