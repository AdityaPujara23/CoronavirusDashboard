%row locating function for tool
function[rowLocate] = rowLocaterKaggle(countryname)
%ROWLOCATERKAGGLE searches the dataset from Kaggle for a particular country
    %creating a new array of country names using the country name coloumn in the
    %data set
    data = readtable('.\covid19_preprocessed.csv');
    %creating a new array of country names using the country coloumn in the
    %data set
    country = data.Country(1:212,1);
    %default setting the row loactions to the first row 
    rowLocate = 1;
    %comparing the country name from input with all the countries for which
    %WHO has available data
    for i = 1:size(country,1)
        %comparing user input of a country with the available country
        %specific information in the data file
        if strcmp(countryname,country(i))
            %if country name matches with user input, setting the row
            %location to that row of match
            rowLocate = i;
            break;
        else 
            %if country name does not match, displaying an error
            %resetting row to 0
            rowLocate = 0;
            warning('Invalid Input.');
        end
    end
 end