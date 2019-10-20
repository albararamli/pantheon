import os
x=['1','2','5','10','20','50','100','200','500','1000','2000','5000','10000']

for i in x:
    print(i)
    os.system("echo '"+str(i)+"'> ./list.txt")
    ########################################################################
    '''folder="results"
    os.system("mv /home/arramli/aaa-last/pensieve/real_exp/"+folder+"/ /home/arramli/aaa-last/pensieve/real_exp/"+folder+"_"+str(i)+"/")
    os.system("mkdir -p /home/arramli/aaa-last/pensieve/real_exp/"+folder+"/")

    folder="fig"
    os.system("mv /home/arramli/aaa-last/pensieve/real_exp/"+folder+"/ /home/arramli/aaa-last/pensieve/real_exp/"+folder+"_"+str(i)+"/")
    os.system("mkdir -p /home/arramli/aaa-last/pensieve/real_exp/"+folder+"/")'''
    ########################################################################



