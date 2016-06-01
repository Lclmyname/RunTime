# RunTime
iOS 学习 RunTime 项目集

# CLRunTime
前言：
刚进公司，原先项目都是用字典传递参数，直到前段时间才想起还有Model类的玩意儿，瞬间感觉自己low逼了，这么重要的东西居然可以忘记！于是决定将原有项目和以后的项目加入Model类，在需要用到字典的地方使用字典，因此引起了Boss的怀疑，Model可靠吗？控制台po dictionary可以看到所有数据详情，但是po model只是一个地址，还要每次都要mode.property才可以看到这个属性的详细信息，于是升起了封装一个model父类，通过调用方法打印所有属性和属性对应的值。
今天，终于完成了。

通过RunTime获取Model的所有属性，并且将Model所有属性的值和属性制成一个类似字典的打印输出

使用方法：
1.生成一个Model类，继承自RunTimeModel
2.调用[model getDictionary]方法，一键打印所有属性数据
