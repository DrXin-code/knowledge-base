# This is a sample Python script.
from src.TreeDrawer import createPlot
from src.utils import *
from src.InfoEnhance import calcGain
from src.Gini import calcGiniGain

config = {  # 配置文件, 配置当前估值函数
    "valuecalc":  # calcGiniGain
        calcGain
}


def build(datas, tests, dp, maxdp):  # 根据训练集datas建树, 根据测试集tests剪枝 dp为当前深度,maxdp为树的最大深度
    if isSame(datas) or dp == maxdp:  # 如果训练集全部类型相同,或已经达到最大深度, 返回一个叶节点
        return "type: " + str(maxType(datas))
    divider = None
    fv = -1e100
    for attr in range(0, 4):  # 遍历4种属性
        vs = list({x["value"][attr] for x in datas})  # 获取训练集所有该属性的值并去重
        vs.sort()  # 从小到大排序
        for i in range(len(vs) - 1):
            cv = (vs[i] + vs[i + 1]) / 2  # 取相邻两个值的中间值
            gv = config["valuecalc"](datas, lambda x: x["value"][attr] < cv)  # 分类器使用以中间值为中点的二分, 使用config中配置的估值函数
            if gv > fv:  # 如果此时分类结果更优, 更新分类结果
                divider = (attr, cv)
                fv = gv
    assert divider is not None
    lis = divide(datas, lambda x: x["value"][divider[0]] < divider[1])  # 将训练集按目前最优结果进行分类
    assert len(lis) == 2

    tlis = divide(tests, lambda x: x["value"][divider[0]] < divider[1])  # 将测试集按目前最优结果进行分类

    tp = maxType(datas)  # 在当前数据集中数量最多的类型
    tpl = maxType(lis[0])  # 在当前划分下左子树最多的类型
    tpr = maxType(lis[1])  # 在当前划分下右子树最多的类型
    if len([v for v in tests if v["type"] == tp]) >= len([v for v in tlis[0] if v["type"] == tpl]) + len(
            [v for v in tlis[1] if v["type"] == tpr]):  # 如果将测试集都归为当前最多类型的正确率高于归为左右子树各自最多的类型, 则将此节点标记为叶节点
        return "type: " + str(tp)

    dic = dict()
    ans = {"attr: " + str(divider[0]): dic}  # 根据当前选择分类的属性建立一个节点
    dic["attr[{}] >= {}".format(divider[0], divider[1])] = build(lis[0], tlis[0], dp + 1, maxdp)  # 递归建立左子树
    dic["attr[{}] < {}".format(divider[0], divider[1])] = build(lis[1], tlis[1], dp + 1, maxdp)  # 递归建立右子树
    return ans


def search(data, tree):  # 在当前决策树tree中搜索data的类型
    if type(tree).__name__ != "dict":  # 如果树到了叶节点, 返回此树的类型
        return int(tree.split(' ')[-1])
    assert len(tree) == 1
    dic = list(tree.values())[0]
    for k, v in dic.items():
        s = k.replace("attr", 'data["value"]')  # type: str #根据树边上的字节流获取分类器

        if eval(s):  # 如果通过该边上的分类器, 递归进入子树搜索
            return search(data, v)
    pass


if __name__ == '__main__':
    datas = read("./data/traindata.txt")
    test = read("./data/testdata.txt")
    tree = build(datas, test, 1, 100)
    createPlot(tree)
    cnt = 0

    for x in test:
        if search(x, tree) != x["type"]:
            cnt += 1
    print(1 - cnt / len(test))
