function minModel= createMinModel(model)

%INPUT:
%    model: COBRA model structure

%OUTPUT:
%    minModel: As computed by minReact

% Computed minModel for GrowthRateCutoff = 0.05 and tol = 0
%Jmin==1:Present in minimal model  Jmin==0: Deleted reactions

[Jmin, minReactNo] = minReact(model, 0.05, 0);
delRxns = model.rxns(Jmin==0);
minModel = removeRxns(model, delRxns);


xmlfile = sprintf('Min-%s',minModel.description );
minModel = writeCbModel(minModel, 'format','sbml', 'fileName', xmlfile); %output xml file

%output .mat file
%minModel = writeCbModel(minModel, 'format','mat', 'fileName','minModel.mat');

end

