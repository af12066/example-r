library(signal)

Fs <- 500 # サンプリング周波数
sampling <- 512 # FFTサンプルポイント数
time <- seq(0, 20, 1/Fs) # 時間軸の生成
wave  <- numeric(length(time)) # 波形を格納するベクトル

count <- 1

for (i in time) {
    if (i < 5) { # 0-5秒は10Hzの波形
        f <- 10
    }
    if (5 <= i && i < 10) { # 5-10秒は25Hzの波形
        f <- 25
    }
    if (10 <= i && i < 15) { # 10-15秒は50Hzの波形
        f <- 50
    }
    if (15 <= i) { # 15-20sは100Hzの波形
        f <- 100
    }
    
    wave[count] <- cos(2 * pi * f * i)
    count <- count + 1
}

wave.spec <- specgram(wave, n = sampling, Fs = Fs, overlap = sampling/2, window = hamming(sampling)) # スペクトログラムの生成（オーバーラップはサンプルポイント数の半分，ハミング窓）
plot(wave.spec)
