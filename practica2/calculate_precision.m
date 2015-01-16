function [ sign int frac ] = calculate_precision( num, max_error )
%CALCULATE_PRECISION Summary of this function goes here
%   Detailed explanation goes here

    if nargin < 2
        max_error = 1 / 10000000;
    end
    int = 0;
    float = 0;

    %Sign is straightforward
    if num < 0
        sign = 1;
    else
        sign = 0;
    end

    %Maximum error number
    num_error = num * max_error;
    %How many bits do I need to represent this
    error = log2(abs(num_error));

    %If I can represent it without fractional part means num is big enough
    if error >= 0
        %Check ceil 
        int = ceil(log2(abs(num)));
        frac = 0;
        int = int - ceil(error);
        return
    end

    %Decimals of the number
    frac = ceil(abs(error));
    int = ceil(log2(abs(num)));
    return
end

