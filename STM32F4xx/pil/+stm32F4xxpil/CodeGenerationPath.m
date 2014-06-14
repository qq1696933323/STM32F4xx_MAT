classdef CodeGenerationPath < hgsetget % subclass hgsetget
%CodeGenerationPath class to store starting path before code generation
    
%   Copyright 2011 The MathWorks, Inc.
    
   properties 
      FromPath = '';
   end % Public properties
   methods 
      function obj = CodeGenerationPath(f)
         if nargin > 0
            obj.FromPath = f;
         end
      end% CodeGenerationPath  
   end % methods
end % classdef