classdef spectrumAnalysis
    properties
        fileName;
        frequencyRange;
        fftMagnitude;
        averageFrequency;
    end
    methods
        function obj = spectrumAnalysis(fileName,frequencyRange, fftMagnitude)
            obj.fileName = fileName;
            obj.frequencyRange = frequencyRange;
            obj.fftMagnitude = fftMagnitude;
            
            frequencies = [1:frequencyRange]';
            for i = 1:floor(frequencyRange/32)
                obj.averageFrequency = sum(frequencies(16*(i-1)+1:16*(i+1),:)) .* fftMagnitude(16*(i-1)+1:16*(i+1),:)/(sum(fftMagnitude(16*(i-1)+1:16*(i+1),:)));
            end
        end
    end
end