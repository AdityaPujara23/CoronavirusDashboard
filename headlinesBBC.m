%headlines function for the tool
function[headlinesStorage] = headlinesBBC()
%HEADLINESBBC grabs the top 10 headlines from the BBC rss feed and returns
%them in an array
    
    %allocating BBC's RSS feed's website page source code to the source
    %variable
    source = (webread('http://feeds.bbci.co.uk/news/health/rss.xml'));
    
    %allocating the expression to search for within the source code
    search = '<title>(.*?)</title>';
    
    %storing the found expressions within the crudeHeadlines array
    crudeHeadlines = regexp(source, search, 'tokens');
    
    %for each element in the array containing a character array, converting
    %it to a string and then extracting the headline from within the
    %opening and closing html tags
    headline1 = extractBetween(string(crudeHeadlines(1,3)),"<![CDATA[","]]>");
    headline2 = extractBetween(string(crudeHeadlines(1,4)),"<![CDATA[","]]>");
    headline3 = extractBetween(string(crudeHeadlines(1,5)),"<![CDATA[","]]>");
    headline4 = extractBetween(string(crudeHeadlines(1,6)),"<![CDATA[","]]>");
    headline5 = extractBetween(string(crudeHeadlines(1,7)),"<![CDATA[","]]>");
    headline6 = extractBetween(string(crudeHeadlines(1,8)),"<![CDATA[","]]>");
    headline7 = extractBetween(string(crudeHeadlines(1,9)),"<![CDATA[","]]>");
    headline8 = extractBetween(string(crudeHeadlines(1,10)),"<![CDATA[","]]>");
    headline9 = extractBetween(string(crudeHeadlines(1,11)),"<![CDATA[","]]>");
    headline10 = extractBetween(string(crudeHeadlines(1,12)),"<![CDATA[","]]>");
    
    %storing each string headline into headlinesStorage array to return
    %when the function is called
    headlinesStorage = [headline1,headline2,headline3,headline4,headline5,headline6,headline7,headline8,headline9,headline10];
end