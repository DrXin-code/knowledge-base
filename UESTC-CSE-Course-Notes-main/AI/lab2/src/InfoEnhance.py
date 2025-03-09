import math
from src.utils import divide


def calcEnt(datas):  # type:(list[dict])->float #计算数据集的信息熵
    cnt = {}
    for x in datas:
        if x["type"] not in cnt:
            cnt[x["type"]] = 0

        cnt[x["type"]] += 1
    ans = 0.0
    for v in cnt.values():
        ans -= v / len(datas) * math.log2(v / len(datas))

    return ans


def calcGain(datas, divider):  # type:(list[dict],function)->float #按照分类器divider分成多个数据集并计算信息增益
    lis = divide(datas, divider)
    return calcEnt(datas) - sum([len(x) / len(datas) * calcEnt(x) for x in lis])

    pass


if __name__ == "__main__":
    pass
