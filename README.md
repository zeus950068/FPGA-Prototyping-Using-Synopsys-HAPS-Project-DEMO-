# 1. Introduce
這是一個rtl code，功能為偵測輸入值的錯誤。  
以此code為例，當輸入值出現連續的'1' '0' '1'就使輸出為1。  
透過條件的變化即可達到偵錯功能，進而偵錯出哪部分的輸入有異常。

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
這份專題是使用protocompiler100去完成，基本的flow如下:  
1.撰寫RTL  
2.Compile RTL並生成schematic圖(gate level層次)  
3.對合成後電路圖進行partition，以達到面積最佳化  
4.接著便可產生各項report，包含timing、area等資訊  

這堂課我收穫很多，之前雖然已接觸過RTL，但從未把合成後的電路透過軟體燒錄到FPGA，從partition開始都是新知識，但因本電路很小，沒必要分成兩個block，故此專題只有FB1_uA。  
在partition .pcf檔案的TCL command我花最多力氣去研究，特別是assign port的部分，讓我學到如何將RTL CODE上面的port指定到bin pin。  
在決定題目的過程，我嘗試了許多自己寫過的RTL，包含ALU、除法器、還有一個比較大的電路(類似分數調整器及排名)，但都因output port數量過多導致partition的時候會失敗，另外我不太清楚為何我的工作站帳號無法完成launch vivado，但用其他同學的帳號，一模一樣的電路卻可完成，這點應該就不是在執行PROTOCOMPILER的過程有技術問題了，純粹是權限問題。  
最後，感謝老師及助教本學期的細心指導。  

