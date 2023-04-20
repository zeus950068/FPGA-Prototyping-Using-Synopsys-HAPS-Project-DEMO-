# 1. Introduce
這是一個rtl code，功能為偵測輸入值的錯誤。  以此code為例，當輸入值出現連續的'1' '0' '1'就使輸出為1。  透過條件的變化即可達到偵錯功能，進而偵錯出哪部分的輸入有異常。

# 2.Block Diagram

![Block Diagram](https://user-images.githubusercontent.com/74593052/233316652-e82ebc04-98d3-45fd-9d16-cd59bf5b9c2c.png)

# 3.The Schematic of FPGA_A

![schematics of FPGA_A](https://user-images.githubusercontent.com/74593052/233316992-8d1f08f1-abea-45ae-9556-27c428c194dc.png)

# 4.Timing Report

FB1_uA: timing summary

![timing summary_FB1_uA](https://user-images.githubusercontent.com/74593052/233317431-7815bccd-6198-4a22-8f97-4c9910d1c4b8.png)

FB1_uA: timing summary_min

![timing summary min_FB1_uA](https://user-images.githubusercontent.com/74593052/233317488-917248b5-b556-4175-a6bf-0baf4a424ad6.png)

FB1_uB: timing summary

![timing summary_FB1_uB](https://user-images.githubusercontent.com/74593052/233317550-9d35d32c-cd7c-4ada-9932-fada56a5b686.png)

FB1_uB: timing summary_min

![timing summary min_FB1_uB](https://user-images.githubusercontent.com/74593052/233317631-4ffdb237-94ff-48ac-bcce-f263b6befbda.png)

# 5.Conclusion
這份專題是使用protocompiler100去完成，基本上的flow為撰寫RTL
