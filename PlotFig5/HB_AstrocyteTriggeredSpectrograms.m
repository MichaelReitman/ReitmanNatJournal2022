function HB_AstrocyteTriggeredSpectrograms(RatioStructure)

rng(1756);

figure; hold on;
subplot 211; hold on;
HierarchicallyBootstrap(RatioStructure.ipsireal{2},RatioStructure.ipsishuff{2},{'empirical','Shuffled'},'ratio',10000);
title('ipsilateral high frequency power change vs shuffled')
subplot 212; hold on;
HierarchicallyBootstrap(RatioStructure.ipsireal{1},RatioStructure.ipsishuff{1},{'empirical','Shuffled'},'ratio',10000);
title('ipsilateral low frequency power change vs shuffled')


figure; hold on;
subplot 211; hold on;
HierarchicallyBootstrap(RatioStructure.contrareal{2},RatioStructure.contrashuff{2},{'empirical','Shuffled'},'ratio',10000);
title('contralateral high frequency power change vs shuffled')
subplot 212; hold on;
HierarchicallyBootstrap(RatioStructure.contrareal{1},RatioStructure.contrashuff{1},{'empirical','Shuffled'},'ratio',10000);
title('contralateral low frequency power change vs shuffled')

figure; hold on;
subplot 211; hold on;
HierarchicallyBootstrap(RatioStructure.ipsireal{2},RatioStructure.ipsipraz{2},{'empirical','+ Prazosin'},'ratio',10000);
suptitle('ipsilateral high frequency power change vs prazosin')
subplot 212; hold on;
HierarchicallyBootstrap(RatioStructure.ipsireal{1},RatioStructure.ipsipraz{1},{'empirical','+ Prazosin'},'ratio',10000);
suptitle('ipsilateral low frequency power change vs prazosin')


subplot 211; hold on;
HierarchicallyBootstrap(RatioStructure.contrareal{2},RatioStructure.contrapraz{2},{'empirical','+ Prazosin'},'ratio',10000);
suptitle('contralateral high frequency power change vs prazosin')
subplot 212; hold on;
HierarchicallyBootstrap(RatioStructure.contrareal{1},RatioStructure.contrapraz{1},{'empirical','+ Prazosin'},'ratio',10000);
suptitle('contralateral low frequency power change vs prazosin')
