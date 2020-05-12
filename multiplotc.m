%multiple plot function of the tool
function[countryplot] = multiplotc(countryname)

%MULTIPLOTC searchs the WHO dataset for country name and extracts the data
%from the dataset for that specific country
data = readtable('.\WHO-COVID-19-global-data.csv');
%using rowLocater function to find the country specific data from the
%entire data set
[rowLocate1, rowLocate2] = rowLocater(countryname);
 
    %settting y-axis for plotting to the cummulative confirmed cases of
    %coronavirus
    if rowLocate1 > 0 && rowLocate2 > 0
        countryplot = data.CumulativeConfirmed(rowLocate1:rowLocate2);
    end
end