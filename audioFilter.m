classdef audioFilter
    properties
        fileName;
        frequencyRange;
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
        end
 
        %Get data in frequency domain
        function obj = getFFTData(obj)
            [data,fs] = audioread(obj.fileName);
            averageData = (data(:,1) + data(:,2))/2;
            obj.samplingRate = fs;
            obj.fftData = fft(averageData); 
        end

        %Get magnitudes of frequency domain
        function obj = getFFTMagnitude(obj)
           obj = sqrt(imag(obj.fftData).^2 + real(obj.fftData).^2); 
        end

        %Construct the filtering matrix for lower and upper spectrum and filter
        %frequency data
        function obj = filterFrequency(obj)
            lowPassLow = ones(obj.frequencyRange,1);
            lowPassMiddle = zeros(length(data) - 2*obj.frequencyRange,1);
            lowPassHigh = ones(frequenctRange,1);
            lowPass = [lowPassLow;lowPassMiddle;lowPassHigh];
            obj.filteredData = (lowPass .* obj.fftData);
        end

        %Get data in time domain (from freq.)
        function obj = getTimeDomain(obj)
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
