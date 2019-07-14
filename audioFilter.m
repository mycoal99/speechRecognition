fileName = "hello.wav";
[data,fs] = audioread(fileName);
plot(data)

%Average of left and right audio channels
averageData = (data(:,1) + data(:,2))/2;

%Converting to frequency domain
fftData = fft(averageData);

%Magnitude for identifying fundamental freq.
fftMagnitude = [sqrt(imag(fftData).^2 + real(fftData).^2)];

%Construct the filtering matrix for lower and upper spectrum
lowPassLow = ones(800,1);
lowPassMiddle = zeros(length(data) - 1600,1);
lowPassHigh = ones(800,1);
lowPass = [lowPassLow;lowPassMiddle;lowPassHigh];

%Filters data by frequency
filteredData = (lowPass .* fftData);

%Bring data back to time domain
filteredSound = ifft(filteredData,'symmetric');

subplot(1,3,1);plot(fftMagnitude);
subplot(1,3,2);plot(lowPass);
subplot(1,3,3);plot(abs(filteredSound));
%soundsc(filteredSound,fs);

%Feature Extraction: Average frequency
frequencies = 1:57788;
frequencies = flipud(rot90(frequencies));
averageFrequency = sum(frequencies(1:57788/2,:) .* fftMagnitude(1:57788/2,:))/(sum(fftMagnitude(1:57788/2,:)))


