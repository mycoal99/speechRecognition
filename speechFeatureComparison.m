function f = speechFeatureComparison(testAverageFrequency,referenceAverageFrequency)
    f = sum(abs(testAverageFrequency-referenceAverageFrequency));
end