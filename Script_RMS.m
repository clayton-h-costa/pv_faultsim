VS1n=[]; 
VS2n=[];
IS1n=[]; 
IS2n=[];

tamm=(size(Control,1)-1)/(Batch+1);

for vtam=1:Batch
    VS1n(vtam)=rms(V1(1+tamm*vtam:tamm*(vtam+1)));
    VS2n(vtam)=rms(V2(1+tamm*vtam:tamm*(vtam+1)));
    VP1n(vtam)=rms(V3(1+tamm*vtam:tamm*(vtam+1)));
    IS1n(vtam)=rms(I1(1+tamm*vtam:tamm*(vtam+1)));
    IS2n(vtam)=rms(I2(1+tamm*vtam:tamm*(vtam+1)));  
    IP1n(vtam)=rms(I3(1+tamm*vtam:tamm*(vtam+1)));  
end

if Case==1
    VS1_Normal(i,:)=VS1n;
    VS2_Normal(i,:)=VS2n;
    IS1_Normal(i,:)=IS1n;
    IS2_Normal(i,:)=IS2n;
    VP1_Normal(i,:)=VP1n;
    IP1_Normal(i,:)=IP1n;
    G_Normal(i,:)=G_in;
    T_Normal(i,:)=T_in;
    save('Normal','VS1_Normal','VS2_Normal','IS1_Normal','IS2_Normal','VP1_Normal','IP1_Normal','G_Normal','T_Normal','-append')   
end

if Case==2
    VS1_Short(i,:)=VS1n;
    VS2_Short(i,:)=VS2n;
    IS1_Short(i,:)=IS1n;
    IS2_Short(i,:)=IS2n;
    VP1_Short(i,:)=VP1n;
    IP1_Short(i,:)=IP1n;
    G_Short(i,:)=G_in;
    T_Short(i,:)=T_in;
    save('Short','VS1_Short','VS2_Short','IS1_Short','IS2_Short','VP1_Short','IP1_Short','G_Short','T_Short','-append')

end

if Case==3
    VS1_Degrad(i,:)=VS1n;
    VS2_Degrad(i,:)=VS2n;
    IS1_Degrad(i,:)=IS1n;
    IS2_Degrad(i,:)=IS2n;
    VP1_Degrad(i,:)=VP1n;
    IP1_Degrad(i,:)=IP1n;
    G_Degrad(i,:)=G_in;
    T_Degrad(i,:)=T_in;
    save('Degrad','VS1_Degrad','VS2_Degrad','IS1_Degrad','IS2_Degrad','VP1_Degrad','IP1_Degrad','G_Degrad','T_Degrad','-append')   	
end

if Case==4
    VS1_OpenCircuit(i,:)=VS1n;
    VS2_OpenCircuit(i,:)=VS2n;
    IS1_OpenCircuit(i,:)=IS1n;
    IS2_OpenCircuit(i,:)=IS2n;
    VP1_OpenCircuit(i,:)=VP1n;
    IP1_OpenCircuit(i,:)=IP1n;
    G_OpenCircuit(i,:)=G_in;
    T_OpenCircuit(i,:)=T_in;
    save('OpenCircuit','VS1_OpenCircuit','VS2_OpenCircuit','IS1_OpenCircuit','IS2_OpenCircuit','VP1_OpenCircuit','IP1_OpenCircuit','G_OpenCircuit','T_OpenCircuit','-append')  
end

if Case==5
    VS1_Shadow(i,:)=VS1n;
    VS2_Shadow(i,:)=VS2n;
    IS1_Shadow(i,:)=IS1n;
    IS2_Shadow(i,:)=IS2n;
    VP1_Shadow(i,:)=VP1n;
    IP1_Shadow(i,:)=IP1n;
    G_Shadow(i,:)=G_in;
    T_Shadow(i,:)=T_in;
    save('Shadow','VS1_Shadow','VS2_Shadow','IS1_Shadow','IS2_Shadow','VP1_Shadow','IP1_Shadow','G_Shadow','T_Shadow','-append') 
end

if Case==6
    VS1_MPPT(i,:)=VS1n;
    VS2_MPPT(i,:)=VS2n;
    IS1_MPPT(i,:)=IS1n;
    IS2_MPPT(i,:)=IS2n;
    VP1_MPPT(i,:)=VP1n;
    IP1_MPPT(i,:)=IP1n;
    G_MPPT(i,:)=G_in;
    T_MPPT(i,:)=T_in;
    save('MPPT','VS1_MPPT','VS2_MPPT','IS1_MPPT','IS2_MPPT','VP1_MPPT','IP1_MPPT','G_MPPT','T_MPPT','-append')  
end

clear VS1 VS2 IS1 IS2 VP1 IP1 tamm vtam
