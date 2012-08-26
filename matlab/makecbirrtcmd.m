function cmdString=makecbirrtcmd(cmd)

    %% Build string based on fields
    
    cmdString='RunCBiRRT ';
    
    %Fill in any defaults here
    numChains=length(cmd.tsrchains)
    if numChains>0 && ~isfield(cmd,'psample')
        cmd.psample=.05
    end
    
    if numChains>0 && ~isfield(cmd,'timelimit')
        cmd.timelimit=30;
    end
    
    fn=fieldnames(cmd)';
    for str=fn
        %TODO: refactor this to operate directly on cell array of string names

        if ~isempty(cmd.(char(str)))
            warning off
            buildField=str2func(['makecbirrtcmd/',char(str)]);
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

    function sout=tsrchains()
           
        sout='';
        for k=1:numChains

            if isstruct(cmd.tsrchains{k})
                sout=[sout ' ' makeTSRChain(cmd.tsrchains{k}) ' '];
            elseif isstr(cmd.tsrchains{k})
                sout=[sout ' ' cmd.tsrchains{k} ' '];
            end
        end
    end

    function sout=psample()
        sout=sprintf('psample %g ',cmd.psample);
    end

end
