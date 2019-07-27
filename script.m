clear;

hello1 = audioFilter('michaelTest.wav',800);
hello2 = audioFilter('andrewTest.wav',800);
hello3 = audioFilter('scottTest.wav',800);
hello4 = audioFilter('nickitaTest.wav',800);
hello5 = audioFilter('merlin.wav',800);

hello = audioFilter('andrewRef.wav',800);

analyze1 = spectrumAnalysis('michaelTest.wav',2000,hello1.fftMagnitude);
analyze2 = spectrumAnalysis('andrewTest.wav',2000,hello2.fftMagnitude);
analyze3 = spectrumAnalysis('scottTest.wav',2000,hello3.fftMagnitude);
analyze4 = spectrumAnalysis('nickitaTest.wav',2000,hello4.fftMagnitude);
analyze5 = spectrumAnalysis('merlin.wav',2000,hello5.fftMagnitude);

analyze = spectrumAnalysis('andrewRef.wav',2000,hello.fftMagnitude);

result1 = speechFeatureComparison(analyze2.averageFrequency,analyze.averageFrequency);
result2 = speechFeatureComparison(analyze1.averageFrequency,analyze.averageFrequency);
result3 = speechFeatureComparison(analyze3.averageFrequency,analyze.averageFrequency);
result4 = speechFeatureComparison(analyze4.averageFrequency,analyze.averageFrequency);
result5 = speechFeatureComparison(analyze5.averageFrequency,analyze.averageFrequency);

display(analyze2);
display(analyze5.averageFrequency);

%Winner should ALWAYS be result 1