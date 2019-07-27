clear;

hello1 = audioFilter('michaelTest.wav',800);
hello2 = audioFilter('andrewTest.wav',800);

hello = audioFilter('andrewRef.wav',800);

analyze1 = spectrumAnalysis('michaelTest.wav',2000,hello1.fftMagnitude);
analyze2 = spectrumAnalysis('andrewTest.wav',2000,hello2.fftMagnitude);

analyze = spectrumAnalysis('andrewRef.wav',2000,hello.fftMagnitude);

result1 = speechFeatureComparison(analyze1.averageFrequency,analyze.averageFrequency);
result2 = speechFeatureComparison(analyze2.averageFrequency,analyze.averageFrequency);

if result1 < result2
    disp("Is this " + hello1.fileName);
else
    disp("Is this " + hello2.fileName);
end
