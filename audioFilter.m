classdef audioFilter
    properties
        fileName;
        frequencyRange;
        data;
        fftData;
        fftMagnitude;
        filteredData;
        filteredDataTD;
        samplingRate;
    end
    
    methods    
        %Object constructor
        function obj = audioFilter(nameValue,rangeValue)
            obj.fileName = nameValue;
            obj.frequencyRange = rangeValue;
            
            %Convert to frequency domain
            [data,fs] = audioread(obj.fileName);
            obj.data = data;
            averageData = (data(:,1) + data(:,2))/2;
            obj.samplingRate = fs;
            obj.fftData = fft(averageData);
            
            %Calculate magnitude associated with frequency
            obj.fftMagnitude = sqrt(imag(obj.fftData).^2 + real(obj.fftData).^2);
            
            %Construct low pass filter
            lowPassLow = ones(obj.frequencyRange,1);
            lowPassMiddle = zeros(length(obj.fftData) - 2*obj.frequencyRange,1);
            lowPassHigh = ones(obj.frequencyRange,1);
            lowPass = [lowPassLow;lowPassMiddle;lowPassHigh];
            obj.filteredData = (lowPass .* obj.fftData);
            
            %Convert data from frequency domain to time domain
            obj.filteredDataTD = ifft(obj.filteredData,'symmetric');
        end
    end
end

% subplot(1,3,1);plot(fftMagnitude);
% subplot(1,3,2);plot(lowPass);
% subplot(1,3,3);plot(abs(filteredSound));

%Post filter sound file
%soundsc(filteredSound,fs);

% What the average frequency sounds like
% tt = [1:1/fs:5];
% testAudio = sin(2*pi*averageFrequency.*tt);
% soundsc(testAudio,fs);
