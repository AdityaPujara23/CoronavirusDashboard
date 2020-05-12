%plot function of the tool
function[] = plotc(location)
%PLOTC searchs the WHO dataset for country name and plots the infection 
%rate of the country
data = readtable('.\WHO-COVID-19-global-data.csv');

    %using rowLocater function to find the country specific data from the
    %entire data set
    [rowLocate1, rowLocate2] = rowLocater(location);
 
    %settting x-axis for plotting to the record dates for the country
    x = data.day(rowLocate1:rowLocate2);
    %settting y-axis for plotting to the cummulative confirmed cases of
    %coronavirus
    y = data.CumulativeConfirmed(rowLocate1:rowLocate2);
    %plotting the graph with the information for the country
    figure;plot(x,y);
    %labelling the plot title for the specific country
    plottitle = sprintf("Cummulative cases of Coronavirus for %s",location);
    %applying the plot title
    title(plottitle);
    %labelling the x-axis with the name 'Date'
    xlabel('Date');
    %labelling the y-axis with the name 'Cases'
    ylabel('Cases');
end