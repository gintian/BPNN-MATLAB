%����ѵ���������뼯
clc,clear
num=24;%��Ӧ24������
len=9;%��9������
data=xlsread('data_new');
data=data(2:len+1,:);

%����ѵ�������Լ�
x_train=[data(1:len-2,:).'];
x_test=[data(len-1,:).'];
y_train=[data(2:len-1,:).'];
test=[data(len,:).'];

%����BP������
%��������
net=newff(minmax(x_train),[7,24],{'tansig','purelin'},'trainlm');%������Ԫ�������������Ԫ����,��1������Ϊ������������뷶Χ
%����ѵ������
net.trainParam.epochs = 100;
%�����������
net.trainParam.goal=0.001;
%ѵ������
[net,tr]=train(net,x_train,y_train);
%��ѵ�����Ͳ��Լ��ϵı���
y_train_predict=sim(net,x_train);
Predict=sim(net,x_test);
%��ͼ �ֱ��ڲ��Լ���
x=0:1:23;
plot(x,Predict,x,test);
grid on
xlabel('ʱ��'),ylabel('�õ���')%����
legend('Ԥ��ֵ','��ʵֵ');
rmse=(sum((Predict-test).^2)/24)^0.5
mae=sum(abs(Predict-test))/24
mape=sum(abs(Predict-test)./test)/24*100

