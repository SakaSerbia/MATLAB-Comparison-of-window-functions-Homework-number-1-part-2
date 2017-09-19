%%%%%
% Stefan Tesanovic 2016/0675
%%%%%%

close all
clear all
clc

%%%%%
% Podesavanje programa
%%%%%%


h = msgbox({'Deo 2: Poredjenje prozorskih funkcija - Upustvo za koriscenje programa'
'______________________________________________ '
'U glavnom komandnom prozoru ce se pojavljivati pitanja na koja je potrebno da odgovorite sa Y/N gde Y ima znacenje da, a N ne. Mozete koristiti mala ili velika slova. U slucaju da ste uneli pogresan odgovor, program ce vam ponoviti pitanje i traziti ispravan unos.'
'Podesavanja se sastoje iz nekoliko segmenata:'
'______________________________________________ '
'Segment 1: Ukljucivanje interaktivnosti programa'
'______________________________________________ '
'Da li zelite da program bude interaktivan? Y/N'
'______________________________________________ '
'Segment 2: Odabir prozorske funkcije'
'______________________________________________ '
'Potrebno je odabrati neku od ponudjenih prozorskih funkcija ciji odbirci opadaju do nule na krajevima. '
'Prozorske funkcije koje su implementirane su:'
' 1. Hanova prozorska funkcija - hann(N).'
' 2. Trougaona prozorska funkcija - triang(N).'
' 3. Modifikovana Bartlett-Hann prozorska funkcija - barthannwin(N).'
' 4. Bartlett  prozorska funkcija - bartlett(N).'
' 5. Blekmanova  prozorska funkcija - blackman(N).'
' 6. Parzen (de la Vallée Poussin)  prozorska funkcija - parzenwin(N).'
'______________________________________________ '
'Segment 3: Uporedjivanje promenjene prozorske funkcije sa nekom drugom'
'______________________________________________ '
'Nakon sto smo primenili prozorsku funkciju izlazni signal mozemo da poredimo sa nekom drugom primenjenom prozorskom funkcijom'
'U komandnom prozoru je potrebno da na pitanje da li zelimo da dobijeni rezultat poredimo sa nekim drugom prozorskom funkcijom odgovorimo sa Y'
'Nakon toga se inicijalizuje proces za biranje druge prozorske funkcije kao u segmentu 2.'
'Ovaj proces se ponavlja sve dok na pitanje ne odgovorimo negativnim odgovorom N, za ne.'
'Na ovaj nacin smo postigli da prvobitni rezultat iz segmenta 2 mozemo da poredimo sa preostale 5 prozorske funkcije koje smo implementirali.'
'______________________________________________ '
'NAPOMENA:'
'______________________________________________ '
'Tacke 3 i 4 koje su sastavni deo drugog dela nisu interaktivne i one se izvrsavaju uvek na isti nacin. '
'______________________________________________ '
'by Stefan Tesanovic, OE, 675/2016 '
},'Upustvo - za pokretanje','help');

flag = true;
while flag
    prompt = 'Da li zelite da program bude interaktivan? Y/N [Y]: ';
    strInter = input(prompt,'s');
    if isempty(strInter)
    strInter = 'N';
    end

    if ( (strInter=='Y') || (strInter=='y') || (strInter=='N') || (strInter=='n') )
        flag = false;
    end
end


%%%%%
% Tacka 1. Odredjivanje N-a i generisanje signala
%%%%%%

F1=1000; F2=1240; F3=1300; Fs=10000;

disp(' ');
disp(' Minimalan broj odbiraka N za digitalni sistem x[n] je N=500');
disp(' ');

N=500;

%Crtamo signal u N tacaka
n=0:N-1;

x=5*cos(2*pi*F1*n/Fs)+1000*cos(2*pi*F2*n/Fs)+10*cos(2*pi*F3*n/Fs);

figure(1);
title('Diskretizovan signala x(t) u x[n]');
stem(n, x);
xlabel('n'),ylabel('Amplituda signala x[n]');


%Izracunavanje diskretne furijerove transformacije za odredjeno N kada ne
%domaci do curenja spektra

X=fft(x);
n=Fs/length(X):Fs/length(X):Fs/2;
X=X(1:N/2);
Xreal=real(X);
Ximag=imag(X);

figure(2);
subplot(2,1,1), stem(n, Xreal);
xlabel('n'), ylabel('real(Y)');
subplot(2,1,2), stem(n, Ximag);
xlabel('n'), ylabel ('imag(Y)');

%%%%%
% Tacka 2. Primena prozorske funkcije
%%%%%%

%Definisemo odabir prozorske funkcije

flag3 = true;
flagFirst = true;
while flag3

    if ( (strInter=='Y') || (strInter=='y')  )
        flag = true;
        while flag
            disp(' ');
            %Drugi put prolazimo kroz while petlju ispisujemo dodatni tekst
            if (flagFirst==false)
               disp([' Potrebno je uneti drugu prozorsku funkciju koja se uporedjuje sa ', nameWIn0]);    
            end
            disp(' ');
            disp('Potrebno je odabrati neku od ponudjenih prozorskih funkcija ciji odbirci opadaju do nule na krajevima. ');
            disp('Prozorske funkcije koje su implementirane su:');
            disp(' 1. Hanova prozorska funkcija - hann(N).');
            disp(' 2. Trougaona prozorska funkcija - triang(N).');
            disp(' 3. Modifikovana Bartlett-Hann prozorska funkcija - barthannwin(N).');
            disp(' 4. Bartlett  prozorska funkcija - bartlett(N).');
            disp(' 5. Blekmanova  prozorska funkcija - blackman(N).');
            disp(' 6. Parzen (de la Vallée Poussin)  prozorska funkcija - parzenwin(N).');
            prompt = 'Unesite broj od 1 do 6 za odabir prozorske funkcije [5]:';
            strWind = input(prompt,'s');
            if isempty(strWind)
            strWind = '5';
            end

            if ( (strWind=='1') || (strWind=='2') || (strWind=='3')|| (strWind=='4')|| (strWind=='5')|| (strWind=='6'))
                flag = false;
            end
        end
    else 
        %Ne zelimo da nam program bude interaktivan
        strWind = '5';
        strOneMore='N';
    end

    if (strWind=='1') 
        w=hann(N)'; nameWIn= ' hann(N)'; end
    if (strWind=='2') 
        w=triang(N)'; nameWIn= ' triang(N)'; end
    if (strWind=='3')
        w=barthannwin(N)'; nameWIn= ' barthannwin(N)'; end
    if (strWind=='4')
        w=bartlett(N)'; nameWIn= ' bartlett(N) '; end
    if (strWind=='5')
        w=blackman(N)'; nameWIn= ' blackman(N)'; end
    if (strWind=='6')
        w=parzenwin(N)'; nameWIn= ' parzenwin(N)'; end
    
    %Kada prvi put prolazimo kroz petlju
    if (flagFirst==true)
        w0=w;
        nameWIn0=nameWIn;
        y=x.*w0;
        Y=2*fft(y)/N;
        n2=Fs/length(Y):Fs/length(Y):Fs/2;
        Y=Y(1:N/2);
        Yreal=real(Y);
        Yimag=imag(Y);

        figure(3);
        subplot(2,1,1), stem(n2, Yreal);
        title(['Realni deo signala Y[n]',nameWIn]);
        xlabel('n'), ylabel('real(Y[n])');
        subplot(2,1,2), stem(n2, Yimag);
        title(['Imaginarni deo signala Y[n]',nameWIn]);
        xlabel('n'), ylabel ('imag(Y[n])');
    end
    
        %Drugi put prolazimo kroz petlju, crtamo sva 4 signala
    if (flagFirst==false)
        y2=x.*w;
        Y2=2*fft(y2)/N;
        n3=Fs/length(Y2):Fs/length(Y2):Fs/2;
        Y2=Y2(1:N/2);
        Y2real=real(Y2);
        Y2imag=imag(Y2);

        figure(4);
        subplot(2,2,1), stem(n2, Yreal);
        title(['Realni deo signala Y[n]',nameWIn0]);
        xlabel('n'), ylabel('real(Y[n])');
        subplot(2,2,2), stem(n3, Y2real);
        title(['Realni deo signala Y[n]',nameWIn]);
        xlabel('n'), ylabel('real(Y[n])');
        
        subplot(2,2,3), stem(n2, Yimag);
        title(['Imaginarni deo signala Y[n]',nameWIn0]);
        xlabel('n'), ylabel ('imag(Y[n])');
        subplot(2,2,4), stem(n3, Y2imag);
        title(['Imaginarni deo signala Y[n]',nameWIn]);
        xlabel('n'), ylabel ('imag(Y[n])');
        
        strOneMore = 'N';
    end
    
    
    if ( (strInter=='Y') || (strInter=='y') )
        flag = true;
        while flag
            disp(' ');
            prompt = 'Da li zelite da dobijeni rezultat uporedite sa jos nekom prozorskom funkcijom? Y/N [Y]: ';
            strOneMore = input(prompt,'s');
            if isempty(strOneMore)
                strOneMore = 'N';
            end
            
            if ( (strOneMore=='Y') || (strOneMore=='y') || (strOneMore=='N') || (strOneMore=='n') )
                flag = false;
            end
        end
    
        if ((strOneMore=='N') || (strOneMore=='n'))
        %Ne zelimo da poredimo dobijeni rezultat za nekom drugom prozorskom
        %funkcijom izlazimo iz glavne while petlje
            flag3 = false;
        end
        if ( (strOneMore=='Y') || (strOneMore=='y'))
        %Postavljamo flag na false i prolazimo drugi put kroz petlju.
            flagFirst=false;
        end
        
    end
        
    if ( (strInter=='N') || (strInter=='n') )
        flag3 = false;
        
    end

end
    
%%%%%
% Tacka 3. Odredjivanje amplitudskog spektra signala u db, nakon primene
% prozorskih funkcija. Ovaj segment nije interaktivan, jel je ovo samo
% cisto poredjenje radi ilustracije, nije previse mastovito.
%%%%%%

N3=1.3*N;
n3=0:N3-1;

x1=5*cos(2*pi*F1*n3/Fs)+1000*cos(2*pi*F2*n3/Fs)+10*cos(2*pi*F3*n3/Fs);
X1=2*abs(fft(x1))/N3; %normalizacija spektra tako da W(0)=1 odn. 0dB
n31=Fs/length(X1):Fs/length(X1):Fs/2; X1=X1(1:N3/2);X1=20*log10(X1);

figure(5)
stem(n31,X1),xlabel('n'), ylabel('Amplituda [dB]'),title('Spektar signala x1(n)');


w=boxcar(N3)'; x2=x1.*w; X2=2*abs(fft(x2))/N3; 
w=triang(N3)'; x3=x1.*w; X3=2*abs(fft(x3))/N3; 
w=hanning(N3)'; x4=x1.*w; X4=2*abs(fft(x4))/N3;
w=hamming(N3)'; x5=x1.*w; X5=2*abs(fft(x5))/N3; 
w=blackman(N3)'; x6=x1.*w; X6=2*abs(fft(x6))/N3; 
w=kaiser(N3,3)'; x7=x1.*w; X7=2*abs(fft(x7))/N3; 
w=kaiser(N3,7)'; x8=x1.*w; X8=2*abs(fft(x8))/N3; 
w=kaiser(N3,10)'; x9=x1.*w; X9=2*abs(fft(x9))/N3; 



n32=Fs/length(X2):Fs/length(X2):Fs/2; X2=X2(1:N3/2); X2=20*log10(X2);
n33=Fs/length(X3):Fs/length(X3):Fs/2; X3=X3(1:N3/2); X3=20*log10(X3);
n34=Fs/length(X4):Fs/length(X4):Fs/2; X4=X4(1:N3/2); X4=20*log10(X4);
n35=Fs/length(X5):Fs/length(X5):Fs/2; X5=X5(1:N3/2); X5=20*log10(X5);
n36=Fs/length(X6):Fs/length(X6):Fs/2; X6=X6(1:N3/2); X6=20*log10(X6);
n37=Fs/length(X7):Fs/length(X7):Fs/2; X7=X7(1:N3/2); X7=20*log10(X7);
n38=Fs/length(X8):Fs/length(X8):Fs/2; X8=X8(1:N3/2); X8=20*log10(X8);
n39=Fs/length(X9):Fs/length(X9):Fs/2; X9=X9(1:N3/2); X9=20*log10(X9);



figure(6);
subplot(3,1,1),stem(n31,X1),xlabel('n'), ylabel('Amplituda [dB]'),title('Spektar signala x1(n)');
subplot(3,1,2),stem(n32,X2),xlabel('n'), ylabel('Amplituda [dB]'),title('Spektar signala x2(n) - Pravougraona prozorska fun.');
subplot(3,1,3),stem(n33,X3),xlabel('n'), ylabel('Amplituda [dB]'),title('Spektar signala x3(n) - Trougaona prozorska fun.');

figure(7);
subplot(3,1,1),stem(n34,X4),xlabel('n'), ylabel('Amplituda [dB]'),title('Spektar signala x4(n) - Hanova prozorska fun.');
subplot(3,1,2),stem(n35,X5),xlabel('n'), ylabel('Amplituda [dB]'),title('Spektar signala x5(n) - Hamingova prozorska fun.');
subplot(3,1,3),stem(n36,X6),xlabel('n'), ylabel('Amplituda [dB]'),title('Spektar signala x6(n) - Blekmanova prozorska fun.');

figure(8);
subplot(3,1,1),stem(n37,X7),xlabel('n'), ylabel('Amplituda [dB]'),title('Spektar signala x7(n) - Kajzerova prozorska fun. za b=3');
subplot(3,1,2),stem(n38,X8),xlabel('n'), ylabel('Amplituda [dB]'),title('Spektar signala x8(n) - Kajzerova prozorska fun. za b=7');
subplot(3,1,3),stem(n39,X9),xlabel('n'), ylabel('Amplituda [dB]'),title('Spektar signala x9(n) - Kajzerova prozorska fun. za b=10');

%%%%%
% Tacka 4. Nalazenje zavisnosti Slabljenja Hamming-ove prozorske funkcije od
% opsega N u opsegu od 8 do 1024
%%%%%%

A=zeros(1,length(8:1:1024));

for n4 = 8:1:1024
    A(n4-7) = hamming_slabljenje (n4);
end


figure(9)
title('Zavisnost slabljenja od duzine za N [8,1024]');
plot(8:1:1024, A);
xlabel('N [8,1024]'), ylabel('Slabljenje[dB]');



