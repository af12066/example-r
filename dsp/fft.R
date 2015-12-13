Fs <- 100 # サンプリング周波数
sampling <- 1024 # FFTサンプルポイント数
samplingPoint <- 0:(sampling-1) # サンプルポイント数のベクトル
t <- samplingPoint / Fs # 時間軸
f <- samplingPoint * Fs / sampling # 周波数軸

wave1 <- sin(2 * pi * 1 * t) # 波形（1Hz）
wave2 <- 2 * sin(2 * pi * 5 * t) # 波形（5Hz，振幅2倍）

wave <- wave1 + wave2 # 波形の合成

wave.powerspec <- abs(fft(wave))^2 # パワースペクトル生成

plot(f, wave.powerspec, xlim = c(0, Fs/2), type = 'l') # 標本化定理に従ってパワースペクトルをプロット