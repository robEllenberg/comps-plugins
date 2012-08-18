function cmdString=makecbirrtcmd(cmd)

    %% Build string based on fields
    fn=fieldnames(cmd)';
    cmdString='RunCBiRRT ';
    for str=fn
        %TODO: refactor this to operate directly on cell array of string names

        if ~isempty(cmd.(char(str)))
            warning off
            buildField=str2func(['runCBiRRT/',char(str)]);
            warning on
            cmdString=sprintf('%s%s',cmdString,buildField());
        end
    end

    function sout=supportlinks()
        numLinks=length(cmd.supportlinks);
        sout=sprintf('supportlinks %d %s',numLinks,sprintf('%s ',cmd.supportlinks{:}));
    end

    function sout=jointgoals()
        numJoints=length(cmd.jointgoals)
        %TODO: error check with activeDOFs?
        sout=sprintf('jointgoals %d %s',numJoints,sprintf('%g ',cmd.jointgoals));
    end

    function sout=jointstarts()
        numJoints=length(cmd.jointstarts)
        %TODO: error check with activeDOFs?
        sout=sprintf('jointstarts %d %s',numJoints,sprintf('%g ',cmd.jointstarts));
    end

    function sout=filename()
        sout=sprintf('filename %s ',cmd.filename);
    end

    function sout=timelimit()
        sout=sprintf('timelimit %g ',cmd.timelimit);
    end

    function sout=smoothingitrs()
        sout=sprintf('smoothingitrs %d ',cmd.smoothingitrs);
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
        sout=sprintf('psample %g ',cmd.psample);
    end

end
