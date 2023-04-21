# 1. Introduce
這是一個全加器的RTL code。  
此專題的目的是將RTL code透過protocompiler software燒錄至FPGA內部。  


# 2.Block Diagram

![block diagram](https://user-images.githubusercontent.com/74593052/233564440-9284ff68-6a1f-4ce9-8687-9f1bbddc52ea.png)


# 3.The Schematic of FPGA_A

Whole circuit schematic:
![schematic](https://user-images.githubusercontent.com/74593052/233564869-06e5f1a9-0722-4f5e-95fa-d723d9ff7772.png)

FB1_uA_Schematic:
![FB1_uA_Schematic](https://user-images.githubusercontent.com/74593052/233564511-e7358663-2d49-44b8-ab75-b566e19837fe.png)

FB1_uB_Schematic:
![FB1_uB_Schematic](https://user-images.githubusercontent.com/74593052/233564703-7e0e2e64-1309-4fc2-b9f5-74cbdefcb756.png)


# 4.Timing Report

FB1_uA:
![timing_summary](https://user-images.githubusercontent.com/74593052/233564991-c02ec78f-ab8b-4cce-b666-1de149525ec8.png)
timing summary

FB1_uA: timing summary_min
![timing_summary_min](https://user-images.githubusercontent.com/74593052/233565124-d5947692-34f6-4fb8-aa2c-e27eac4e20be.png)

FB1_uB:
![timing_summary](https://user-images.githubusercontent.com/74593052/233565222-85fd2835-1fec-4e72-93d2-28c0bfc304df.png)

FB1_uB: timing summary_min
![timing_summary_min](https://user-images.githubusercontent.com/74593052/233565318-4f9ab8c8-f81a-4779-8745-bb25ef35e427.png)


# 5.Conclusion
這份專題是使用protocompiler100去完成，基本的flow如下:  
1.撰寫RTL  
2.Compile RTL並生成schematic圖(gate level層次)  
3.對合成後電路圖進行partition，以達到面積最佳化  
4.接著便可產生各項report，包含timing、area等資訊  

這堂課我收穫很多，之前雖然已接觸過RTL，但從未把合成後的電路透過軟體燒錄到FPGA，從partition開始都是新知識。  
在partition .pcf檔案的TCL command我花最多力氣去研究，特別是assign port的部分，讓我學到如何將RTL CODE上面的port指定到bin pin。  
在決定題目的過程，我嘗試了許多自己寫過的RTL，包含ALU、除法器、還有一個比較大的電路(類似分數調整器及排名)，但都因output port數量過多導致partition的時候會失敗，另外我不太清楚為何我的工作站帳號無法完成launch vivado，但用其他同學的帳號，一模一樣的電路卻可完成，這點應該就不是在執行PROTOCOMPILER的過程有技術問題了，純粹是權限問題。  
最後，感謝老師及助教本學期的細心指導。  

