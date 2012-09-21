function out=makeTSR(tsr)

    %% Build string based on fields
    fn = {'manipindex' 'bodyandlink' 'T0_w' 'Tw_e' 'Bw'};

    if ~isfield(tsr,'Tw_e')
        tsr.Tw_e=MakeTransform();
    end
    if ~isfield(tsr,'bodyandlink')
        %Assume world coordinates
        tsr.bodyandlink='NULL';
    end
    
    T0_w_string=sprintf('%g ',[GetRot(tsr.T0_w),GetTrans(tsr.T0_w)]);
    Tw_e_string=sprintf('%g ',[GetRot(tsr.Tw_e),GetTrans(tsr.Tw_e)]);
    if isequal(size(tsr.Bw),[6 2])
        %TODO: fix this later
        tsr.Bw=tsr.Bw'
    end
    Bw_string= sprintf('%g ',tsr.Bw(:)');

    out= [ num2str(tsr.manipindex) ' ' tsr.bodyandlink ' ' T0_w_string ' ' Tw_e_string ' ' Bw_string ];
end
