function out=makeTSR(tsr)

    %% Build string based on fields
    fn = {'manipindex' 'bodyandlink' 'T0_w' 'Tw_e' 'Bw'};

    for str=fn
        %Auto Fill empty fields (will throw errors if field is required)
        if ~isfield(tsr,char(str)) || isempty(tsr.(char(str)))
            tsr.((char(str)))='NULL';
            if strcmp(char(str),'Tw_e')
                tsr.Tw_e=MakeTransform();
            end
        end
    end

    T0_w_string=sprintf('%g ',[GetRot(tsr.T0_w),GetTrans(tsr.T0_w)]);
    Tw_e_string=sprintf('%g ',[GetRot(tsr.Tw_e),GetTrans(tsr.Tw_e)]);
    if isequal(size(tsr.Bw),[6 2])
        %TODO: fix this later
        tsr.Bw=tsr.Bw'
    end
    Bw_string= sprintf('%f ',tsr.Bw(:)');

    out= [ num2str(tsr.manipindex) ' ' tsr.bodyandlink ' ' T0_w_string ' ' Tw_e_string ' ' Bw_string ];
end
