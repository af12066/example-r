library(wavelets)

Fs <- 100 # サンプリング周波数
sampling <- 1024 # Waveletサンプルポイント数
samplingPoint <- 0:(sampling-1) # サンプルポイント数のベクトル
t <- samplingPoint / Fs # 時間軸

wave1 <- sin(2 * pi * 1 * t) # 波形（1Hz）
wave2 <- rnorm(t) / 10 # 波形2（わずかにランダムノイズ）

wave <- wave1 + wave2

wdec <- dwt(wave,  filter = "d4", n.levels = 4)

# ウェーブレットの種類...
# d     : Daubechies (2,4,6,8,10,12,14,16,18,20)
# la    : Least Asymetric (8,10,12,14,16,18,20)
# bl    : Best Localized (14,18,20)
# c     : Coiflet (6,12,18,24,30)

plot(wdec)
