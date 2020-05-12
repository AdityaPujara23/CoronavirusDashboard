%this script provides users with useful information regarding COVID-19

%clearing the command window
clear
close all
clc

%setting warning to off
warning('off');

%startup options image
imshow('startup.png');

%setting program status to on
n = 1;

%startup options in text format 
optionsMenu();

%asking user for an option to choose till the user quits the program
while n == 1
    %using try and catch to make sure that errors in the input do not
    %end the program
    try
        %asking user for input
        choice = input("Please input an option: ");
    catch
        %setting warning to on
        warning('on');
        %printing an error if choice input by user is not valid
        warning("Error, please make a valid choice!");
        %reminding user on how to access main menu at any time
        disp('To access main menu at any time, input 6 when asked for an option.');
        %setting warning to off
        warning('off');
    end
    switch choice
        case 1 %choice to search data for countries and get latest information for that country
            %clearing the command window
            clc
            clear all
            %setting program status to on
            n = 1;
            %reminding user on how to access main menu at any time
            disp('To access main menu at any time, input 6 when asked for an option.');
            disp(' ');
            disp('Search for a country and get the latest analysis for that country.');
            disp(' ');
            %fetches coronavirus latest data from Kaggle: https://www.kaggle.com/ninjaxiii/covid19-cases
            websave('coronavirusdata.zip', 'https://www.kaggle.com/ninjaxiii/covid19-cases/download');
            %unzipping the zip file containing the data set
            unzip('coronavirusdata.zip','.\');
            %creating a search function for information in the coronavirus data set
            searchdata(input("Enter location in sentence case: ", 's'));
            %turning warnings back on
            warning('on');
            warning backtrace off;
            %displaying a precautionary warning
            disp(' ');
            warning('If this output is not as expected, either input is invalid or the country does not exist on the database.');
            warning('If this output was as expected, ignore the precautionary warning.');
            %turning warnings back off
            warning('off');
        case 2 %choice to a map of cases around the world
            %clearing the command window
            clc
            clear all
            %setting program status to on
            n = 1;
            %reminding user on how to access main menu at any time
            disp('To access main menu at any time, input 6 when asked for an option.'); 
            disp(' ');
            disp('A map of cases around the world will open in a new image window.');
            disp(' ');
            %map is downloaded from a website where it is updated on a
            %regular basis
            websave('coronamap.png', 'https://i.insider.com/5e6f8ee1c48540116e247a42');
            %displaying the image
            imshow('coronamap.png');
        case 3 %choice to see the infection rate graph of coronavirus in a particular country
            %fetches coronavirus latest data from Kaggle: https://www.kaggle.com/ninjaxiii/covid19-cases
            websave('coronavirusdata.zip', 'https://www.kaggle.com/ninjaxiii/covid19-cases/download');
            %unzipping the zip file containing the data set
            unzip('coronavirusdata.zip','.\');
            %clearing the command window
            clc
            clear all
            %setting program status to on
            n = 1;
            %reminding user on how to access main menu at any time
            disp('To access main menu at any time, input 6 when asked for an option.');
            disp(' ');
            disp('This option can plot the infection rate graph of coronavirus for a particular country.'); 
            disp(' ');
            %asking user for the number of countries to graph
            %using try to avoid errors
            try 
                num = input('Enter the number of countries to graph (greater than 0): ');
            end
            %checking for valid input
            if num > 0 
                %looping for the number of countries that the user wants to
                %graph
                for i = 1:num
                    plotc(input("Enter location: ", 's'));
                end
            else 
                    %turning warnings back on 
                    warning('off');
                    warning('on');
                    %turing off backtrace to location of warning message from
                    %stylistic point of view
                    warning backtrace off;
                    %returing an error message if user input was invalid
                    warning('Input error. Enter a valid number of countries (greater than 0) and valid country names.');
                    %turning warnings back off
                    warning('off');
            end
        case 4 %choice to multi-plot different countries
            %clearing the command window
            clc
            clear all
            %setting program status to on
            n = 1;
            %reminding user on how to access main menu at any time
            disp('To access main menu at any time, input 6 when asked for an option');
            disp(' ');
            disp('This option will allow multiple plots of the infection rate of different countries on a single x and y axis.'); 
            disp(' ');
            %using try and catch to continue the program even if an error
            %occurs after issuing a warning 
            try 
                %taking user input for two locations to plot their 
                %infection rate on a graph together
                location1 = input("Enter valid country name: ", 's');
                location2 = input("Enter valid country name: ", 's');
                %setting y1 and y2 values to the data corrosponding to the
                %country input by user
                y1 = multiplotc(location1);
                y2 = multiplotc(location2);
                %plotting on a logarithmic scale as the cases can increase or
                %decrease dramatically for both countries
                semilogy(y1);
                %plotting two graphs at once, hence holding the figure
                hold on
                semilogy(y2);
                %labelling the plot title for the specific country
                plottitle = sprintf("Cummulative cases of Coronavirus");
                %applying the plot title
                title(plottitle);
                %labelling the x-axis with the name 'Date'
                xlabel('Days After First Case');
                %labelling the y-axis with the name 'Cases'
                ylabel('Cases (In Logarithmic Scale)');
                %providing a legend to the graph to help in analysis 
                legend({location1,location2},'Location','northwest')
            catch
                %turning warnings back on to issue a warning message in
                %case an error occured
                warning('off');
                warning('on');
                %turing off backtrace to location of warning message from
                %stylistic point of view
                warning backtrace off;
                %returning an error message on catching an exception
                %(matlab error)
                warning('Input error. Either one or more of these countries do not have any available WHO data or one or more of them do not exist.');
                warning('If this output was as expected, ignore the precautionary warning.');
                %reminding user on how to access main menu at any time
                disp('To access main menu at any time, input 6 when asked for an option.'); 
                %turing warnings back off from stylistic point of view
                warning('off');
            end
        case 5 %choice to see the top 10 headlines from BBC
            %clearing the command window
            clc
            clear all
            %setting program status to on
            n = 1;
            %reminding user on how to access main menu at any time
            disp(' ');
            disp('To access main menu at any time, input 6 when asked for an option.'); 
            disp(' ');
            %storing the return value from the headlinesBBC function to an
            %array headlinesStorage
            headlinesStorage = headlinesBBC();
            %displaying an empty line for stylistic purposes
            disp(' ');
            %displaying title
            fprintf("Displaying the top 10 current health news from BBC: \n");
            %displaying an empty line for stylistic purposes
            disp(' ');
            %displaying each element of the headlinesStorage array, containing headlines from BBC as strings, in
            %individual lines
            disp(headlinesStorage(1));
            disp(headlinesStorage(2));
            disp(headlinesStorage(3));
            disp(headlinesStorage(4));
            disp(headlinesStorage(5));
            disp(headlinesStorage(6));
            disp(headlinesStorage(7));
            disp(headlinesStorage(8));
            disp(headlinesStorage(9));
            disp(headlinesStorage(10));
            disp("Source Url for further reading: http://feeds.bbci.co.uk/news/video_and_audio/health/rss.xml");
            %displaying an empty line for stylistic purposes
            disp(' ');  
        case 6 %choice to bring up the options menu at any point in time
            %clearing the command window
            clc
            clear all
            %setting program status to on
            n = 1;
            %calling the optionsMenu function to display the options menu
            optionsMenu();
        case 7 %choice to end the program at any point in time
            %clearing the command window
            clc
            clear all
            %program ending message
            disp(' '); 
            fprintf("Thank you for using Coronavirus Dashboard. The program will now close.\n");
            %adding an empty line for stylistic purposes
            disp(' ');
            %ending program by setting while loop condition to false
            n = 0;
        otherwise
            %turning warnings on
            warning('on');
            %turing off backtrace to location of warning message from
            %stylistic point of view
            warning backtrace off;
            %printing an error if choice input by user is not valid
            warning("Error, please make a valid choice!");
            %reminding user on how to access main menu at any time
            disp('To access main menu at any time, input 6 when asked for an option.');
            disp(' ');
            %turning warnings back off
            warning('off');
    end
end 