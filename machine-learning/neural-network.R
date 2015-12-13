library(nnet)

L <- nrow(iris)
iris.train <- seq.int(1, L, by=2) # 学習データをIrisの奇数番目のデータ
iris.test <- setdiff(1:L, iris.train) # テストデータをIrisの偶数番目のデータ

nnet.result <- nnet(Species~.-Sepal.Length-Sepal.Width, data = iris, size=10, linout=FALSE, decay = 0.001) # Petalのみ学習させる．Speciesはfactor型．
nnet.pred <- predict(nnet.result, iris[iris.test,], type = "class") # クラス分類にはtype必須
table(iris[iris.test,5], nnet.pred) # 結果をテーブル表示
