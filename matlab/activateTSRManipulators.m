function activateTSRManipulators(robot,cmd)
    
    maniplist=[];

    for k=1:length(cmd.tsrchains)
        for j=1:length(cmd.tsrchains{k}.TSRs)
        maniplist=[maniplist cmd.tsrchains{k}.TSRs{j}.manipindex];
    end
    
    activateManipulator(robot.id,unique(maniplist));
    
end
