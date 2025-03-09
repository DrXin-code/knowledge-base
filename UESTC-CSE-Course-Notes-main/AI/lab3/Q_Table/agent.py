import random

import numpy as np


class QLearning(object):

    def __init__(self, state_dim, action_dim, cfg):
        self.action_dim = action_dim  # dimension of acgtion
        self.lr = cfg.lr  # learning rate
        self.gamma = cfg.gamma  # 衰减系数
        self.epsilon = 0
        self.sample_count = 0
        self.Q_table = np.zeros((state_dim, action_dim))  # Q表格
        self.beta = 0.1  # 一定概率随机选择一个行为
        self.update_dic = {"qlearning": self.q_update, "sarsa": self.s_update}  # 更新Q_Table的方法列表
        self.sta ="qlearning"  # 当前选择的更新方法 #"sarsa

        self.last_action = 0  # 使用sarsa时保存的上次决策

    def choose_action(self, state):  # 训练时的一次决策
        ####################### 智能体的决策函数，需要完成Q表格方法（需要完成）#######################
        self.sample_count += 1
        if random.random() < self.beta:
            return np.random.choice(self.action_dim)
        if self.sta == "sarsa":
            return self.last_action
        return self.predict(state)

    def predict(self, state):  # 训练完成后根据Q_Table结果的预测行为
        mx = max(self.Q_table[state])
        action = np.random.choice([i for i in range(self.action_dim) if self.Q_table[state][i] == mx])
        # action = np.random.choice(self.action_dim)  # 随机探索选取一个动作
        return action

    def q_update(self, state, action, reward, next_state, done):  # Q_Learning方法更新Q_Table
        self.Q_table[state][action] = self.Q_table[state][action] + self.lr * max(
            [self.Q_table[next_state][x] * self.gamma + reward - self.Q_table[state][action] for x in
             range(self.action_dim)])
        pass

    def s_update(self, state, action, reward, next_state, done):  # sarsa方法更新Q_Table
        a = self.predict(next_state)
        self.Q_table[state][action] = self.Q_table[state][action] + self.lr * (
                self.Q_table[next_state][a] * self.gamma + reward - self.Q_table[state][action])
        self.last_action = a
        pass

    def update(self, state, action, reward, next_state, done):
        self.update_dic[self.sta](state, action, reward, next_state, done)

    def save(self, path):
        np.save(path + "Q_table.npy", self.Q_table)

    def load(self, path):
        self.Q_table = np.load(path + "Q_table.npy")
