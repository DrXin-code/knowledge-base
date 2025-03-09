from src.utils import divide


def calcGini(datas):  # type:(list[dict])->float #计算此数据集的基尼指数
    cnt = {}
    for x in datas:
        if x["type"] not in cnt:
            cnt[x["type"]] = 0

        cnt[x["type"]] += 1
    ans = 1
    for v in cnt.values():
        ans -= (v / len(datas)) * (v / len(datas))

    return ans


def calcGiniGain(datas, divider):  # type:(list[dict],function)->float #计算分类器分类后的基尼指数
    lis = divide(datas, divider)
    return -sum([calcGini(x) * len(x) / len(datas) for x in lis])  # 因基尼指数需求最小值, 外部结果选取最大的, 此处进行取反

    pass
