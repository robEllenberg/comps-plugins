function [polygon,cog,mass,success]=processSupportCheckData(stringin)

    data=sscanf(stringin,'%f ');
    success=data(1);
    mass=data(2);
    cog=data(3:5);
    polygon=reshape(data(6:end),(length(data)-5)/2,2)';

end

