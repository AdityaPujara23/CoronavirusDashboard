%row locating function for tool
function[rowLocate1,rowLocate2] = rowLocater(countryname)
    %creating a new array of country names using the country name coloumn in the
    %data set
    data = readtable('.\WHO-COVID-19-global-data.csv');
    country = data.CountryName;
    %default setting the row loactions to the first row 
    rowLocate1 = 1;
    rowLocate2 = 1;
    %comparing the country name from input with all the countries for which
    %WHO has available data
    for i = 1:size(country,1)
            %comparing user input of a country with the available country
            %specific information in the data file
            if strcmp(countryname,country(i))
                %if country name matches with user input, setting the row
                %location to that row of match
                rowLocate1 = i;
                break;
            else 
                %if country name does not match, displaying an error
                %resetting row to 0
                rowLocate1 = 0;
            end
    end
    %continuing if there was no prior error
    if ~(rowLocate1 == 0)
        for j = rowLocate1:size(country,1)
            %comparing the location input by user with the country names
            if ~(strcmp(countryname,country(j)))
                %finding the last row where the country name matches the user
                %input
                rowLocate2 = j-1;
                break;
            end
        end
    end
 end