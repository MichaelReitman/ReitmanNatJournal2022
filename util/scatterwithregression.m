function h= scatterwithregression(x,y)
linearfit = fitlm(x,y);
p = coefTest(linearfit); 

R2 = linearfit.Rsquared.Adjusted;
intercept = linearfit.Coefficients.Estimate(1);
interceptSE = linearfit.Coefficients.SE(1);
interceptpval = linearfit.Coefficients.pValue(1);

slope = linearfit.Coefficients.Estimate(2);
slopeSE = linearfit.Coefficients.SE(2);
slopepval = linearfit.Coefficients.pValue(2);

h(1) = scatter(x,y,250,'k.');
h(2) = plot(x,linearfit.Fitted,'r','linewidth',2);
text_xloc = max(double(get(gca,'xlim')))/3;
text_yloc = max(double(get(gca,'ylim')));
text(text_xloc,text_yloc,...
    {['r^2 = ' num2str(R2,3) ' p = ' num2str(p,2)]})% ...
    %['slope: ' num2str(slope) ' +/- ' num2str(slopeSE)];...
    %['intercept: ' num2str(intercept) ' +/- ' num2str(interceptSE)];...
    %['slope p = ' num2str(slopepval) ' intercept pvalue = ' num2str(interceptpval)]})
end
