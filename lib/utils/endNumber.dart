int calculateRemainingTime(int endTime) {
  // 获取当前时间的毫秒时间戳
  int currentTime = DateTime.now().millisecondsSinceEpoch;

  // 计算剩余时间（单位：毫秒）
  int remainingMilliseconds = endTime - currentTime;

  // 如果当前时间已经超过结束时间，返回0
  if (remainingMilliseconds <= 0) {
    return 0; // 时间已结束
  }

  return remainingMilliseconds;
}
