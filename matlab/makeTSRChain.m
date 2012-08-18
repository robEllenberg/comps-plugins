function out=makeTSRChain(chain)

    %% Build string based on fields
    fn = {'TSRs' 'mimicbodyname'};

    for str=fn
        if ~isfield(chain,char(str)) || isempty(chain.(char(str)))
            chain.(char(str))='NULL';
        end
    end
    
    fn = {'sampleStart'   'sampleGoal'   'constrain'};

    for str=fn
        if ~isfield(chain,char(str)) || isempty(chain.(char(str)))
            chain.(char(str))=0;
        end
    end
    
    %Build TSR strings
    if iscellstr(chain.TSRs)
        allTSRstring=sprintf('%s ',chain.TSRs{:});
        numchains=length(chain.TSRs);
    elseif isstr(chain.TSRs)
        allTSRstring=chain.TSRs;
        numchains=1;
    elseif iscell(chain.TSRs)
        allTSRstring='';
        numchains=length(chain.TSRs);
        for k=1:length(chain.TSRs)
            allTSRstring=[allTSRstring ' ' makeTSR(chain.TSRs{k})];
        end
    end

    %check for mimicbodies and include
    if isfield(chain,'mimicbodyname') && isfield(chain,'mimicbodyjoints')
        mimicString = [num2str(numel(chain.mimicbodyjoints)) ' ' num2str(chain.mimicbodyjoints)];
    else
        mimicString = 'NULL';
    end
    
    out = sprintf('TSRChain %d %d %d %d %s %s',...
        chain.sampleStart,chain.sampleGoal,chain.constrain,...
        numchains, allTSRstring,mimicString);
    
end
