%search function of the tool
function[] = searchdata(location)

%SEARCHDATA searchs dataset for country name and total cases, total deaths and
%recoveries of coronavirus patients
data = readtable('.\Coronavirus Dashboard\covid19_preprocessed.csv');

%using rowLocater function to find the country specific data from the
%entire data set
[rowLocate] = rowLocaterKaggle(location);
 
    %only displaying search results if country name and location input from
    %user match
    if ~(rowLocate == 0)
        
        %basic analysis
        totalCases = table2array(data(rowLocate,2));
        totalDeaths = table2array(data(rowLocate,3));
        recovered = table2array(data(rowLocate,4));
        
        %advanced analysis
        casesPerMil = table2array(data(rowLocate,7));
        deathsPerMil = table2array(data(rowLocate,8));
        testsPerMil = table2array(data(rowLocate,10));
        
        %displaying basic analysis for the country
        countryData1 = [totalCases,totalDeaths,recovered];
        advcountryData1 = [casesPerMil,deathsPerMil,testsPerMil];
        
        %displaying information
        
        %basic analysis
        disp("     ");
        fprintf("Cases:         ");
        fprintf("%d",countryData1(1,1));
        fprintf("\n");
        fprintf("Deaths:         ");
        fprintf("%d",countryData1(1,2));
        fprintf("\n");
        fprintf("Recovered:      ");
        fprintf("%d",countryData1(1,3));
        fprintf("\n");
        
        %advanced analysis
        disp("     ");
        fprintf("Cases per Million:    ");
        fprintf("%0.1f",advcountryData1(1,1));
        fprintf("\n");
        fprintf("Deaths per Million:    ");
        fprintf("%0.1f",advcountryData1(1,2));
        fprintf("\n");
    elseif rowLocate == 0 
        %printing an error message if country name and location input by
        %user dont match
        warning("Country name is invalid.");
    end
end







