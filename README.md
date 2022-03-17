# UESTC-Thesis-Latex-Template
UESTC Thesis Latex Template

使用方式参考广为流传版本 https://github.com/tinoryj/ThesisUESTC
适配了2022年新标准的参考文献格式

## 更新日志
* 2022.3.17：新版cls模板提供了分类号、密级、UDC号的设置功能，使用方法如下所示(在main.tex中\begin{document}之前加入，与作者等信息等同)：
  ![UDC](pic/UDCID.png)

  * UDC编号查询：https://udcsummary.info/php/index.php?lang=chi&pr=Y
* 修正英文封面中学号和姓名顺序错误的问题（对调）
* 修正“答辩委员会主席”后下划线长度不足的问题
* 增加专业硕士专用封面：
  * 使用\MakeCoverProMaster指令替换\makecover即可
  * 新增\ProfessionalDegreeArea{}用于设置“专业学位领域”，如下所示：
  ![UDC](pic/promaster.png)
