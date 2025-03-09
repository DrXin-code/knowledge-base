def isSame(datas):  # 判断数据集是否属于同一类型
    st = set()
    for x in datas:
        st.add(x["type"])
    return len(st) == 1


def maxType(datas):  # 选择这一数据集里类型最多的那个类型
    cnt = {}
    for x in datas:
        if x["type"] not in cnt:
            cnt[x["type"]] = 0
        cnt[x["type"]] += 1
    lis = list(cnt.items())
    lis.sort(key=lambda x: x[1])
    return lis[-1][0]


def divide(datas, divider):  # 将数据集按照分类器分成多组 分类器目前只是二分分类
    grouped = {0: [], 1: []}
    for x in datas:
        assert divider(x) in grouped
        # grouped[divider(x)] = list()
        grouped[divider(x)].append(x)
    x = list(grouped.items())
    x.sort(key=lambda v: v[0])
    return [v[1] for v in x]


def read(filepath):  # 读取数据集
    with open(filepath, "r") as r:
        ans = []
        for l in r.readlines():
            lis = [x for x in l.split('\t') if len(x) > 0]
            assert len(lis) == 5
            ans.append({"type": int(lis[-1]), "value": [float(v) for v in lis[:4]]})
        return ans
    pass
