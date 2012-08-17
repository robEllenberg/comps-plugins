function out=runCBiRRT(cmd)

    %% Build string based on fields
    fn=fieldnames(cmd)';
    cmdString='';
    for str=fn
        %TODO: refactor this to operate directly on cell array of string names

        if ~isempty(cmd.(char(str)))
            warning off
            buildField=str2func(['runCBiRRT/',char(str)]);
            warning on
            cmdString=sprintf('%s%s',cmdString,buildField());
        end
    end
    cmdString

    function sout=supportlinks()
        numLinks=length(cmd.supportlinks);
        sout=sprintf('supportlinks %d %s',numLinks,sprintf('%s ',cmd.supportlinks{:}));
    end

    function sout=jointgoals()
        numJoints=length(cmd.jointgoals)
        %TODO: error check with activeDOFs?
        sout=['jointgoals ',sprintf('%f ',cmd.jointgoals)];
    end

    function sout=jointstarts()
        numJoints=length(cmd.jointstarts)
        %TODO: error check with activeDOFs?
        sout=['jointstarts ', sprintf('%f ',cmd.jointstarts)];
    end

    function sout=filename()
        sout=sprintf('filename %s ',cmd.filename);
    end

    function sout=timelimit()
        sout=sprintf('timelimit %f ',cmd.timelimit);
    end

    function sout=smoothingitrs()
        sout=sprintf('smoothingitrs %f ',cmd.smoothingitrs);
    end

    function sout=cmdChain()
        numChains=length(cmd.cmdChain)
        for k=1:numChains

            if isstruct(cmd.cmdChain{k})
                %TODO: Serialize cmd Chain from struct
            elseif isstr(cmd.cmdChain{k})
                sout=cmd.cmdChain{k};
            end
        end
    end

    function sout=psample()
        sout=sprintf('psample %f ',cmd.psample);
    end


end
