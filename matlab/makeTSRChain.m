function out=makeTSRChain(chain)

    %% Build string based on fields
    fn = {'bSampleStartFromChain'   'bSampleGoalFromChain'   'bConstrainToChain'   'numchains' 'TSRs' 'mimicbodyname'};

    for str=fn
        if ~isfield(chain,char(str)) || isempty(chain.(char(str)))
            chain.(char(str))='NULL';
        end
    end

    if iscell(chain.TSRs)
        allTSRstring=sprintf('%s ',chain.TSRs{:});
    elseif isstr(chain.TSRs)
        allTSRstring=chain.TSRs;
    end

    out = ['TSRChain ' num2str(chain.bSampleStartFromChain) ' ' num2str(chain.bSampleGoalFromChain) ' ' num2str(chain.bConstrainToChain) ' ' num2str(chain.numchains) ' '  allTSRstring ' ' chain.mimicbodyname];

end
