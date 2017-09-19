function a=hamming_slabljenje(N)
prozor=hamming(N);
P=fft(prozor,2048);
P=2*abs(P)/N;
ind=0;k=1;
while ind<2
	k=k+1;
	if (P(k-1)<P(k) && P(k)>P(k+1)),
		ind=ind+1;
		a=20*log10(P(k));
		end
end
