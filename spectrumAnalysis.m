classdef spectrumAnalysis
    properties
        frequencyRange;
        fileName;
    end
    methods(Static)
        %Feature Extraction: Average frequency
        function f = getAverageFrequency(frequencyRange)
            frequencies = [1:frequencyRange]';
            f = sum(frequencies(1:frequencyRange,:) .* fftMagnitude(1:frequencyRange,:)/(sum(fftMagnitude(1:frequencyRange,:))));
        end
    end
end