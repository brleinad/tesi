function netlist_check2(fin_name, fout_name, plot_arg)
% --------------------------------------------------------------------
%       netlist_check(fin_name)
%       netlist_check(fin_name, fout_name)
%       netlist_check(fin_name, fout_name, 'plot')
% This function tests the netlist file format, and computes:   
% - the processing order of internal and output nodes 
% - the criticality degrees of nodes (i.e. number of successor outputs)
% Input arguments:
% fin_name : short name of the input netlist file. netlist file must be
%     locatted in the './netlist_files/' directory,  and file extension 
%     must be '.nl'
% fout_name: name of the output netlist file. 
%   - it contains the netlist read from the input 'fin_name' file, but 
%     also the processing order of internal and output nodes, the list 
%     of criticality degrees of all the nodes nodes (including inputs), 
%     and the list of indexes of the output nodes
%   - if 'fout_name' is empty or equal to 'off'  => no output file
%   - if 'fout-name' is equal to 'a' or 'append' => processing order
%     of nodes, criticality degrees, and indexes of the output nodes
%     are appended to the end of input file
%   - if 'fout_name' is equal to 'c' or 'check'  => name of the output
%     file is obtained by appending  '_check' to the short name of the 
%     input file
% 'plot' argument may be used to plot the CDF of criticality degrees
% --------------------------------------------------------------------

if nargin < 1
    error('Not enough input arguments!')
elseif nargin == 1
    fout_name = 'off';
    plot_arg  = false;
elseif nargin == 2
    if ~isempty(fout_name) && ~ischar(fout_name) 
        error('Second argument must be either empty of a string')
    end
    if isempty(fout_name), fout_name = 'off'; end
    plot_arg = false;
else
    if ~ischar(plot_arg) || ~strcmpi(plot_arg, 'plot')
        error('Last argument can only be equal to ''plot''')
    end
    plot_arg = true;
end

%fid = fopen(['./netlist_files/' fin_name '.nl'], 'r');
fid = fopen(['./' fin_name '.nl'], 'r');
if fid == -1, error('Cannot open netlist file!'); end

N_inp = fscanf(fid, '%d', 1);      % number of input nodes
N_out = fscanf(fid, '%d', 1);      % number of output nodes
N_mid = fscanf(fid, '%d', 1);      % number of internal ('mid') nodes
N_im  = N_inp + N_mid;             % number of input + mid nodes
N_mo  = N_mid + N_out;             % number of mid + output nodes
N_tot = N_inp + N_mid + N_out;     % total number of nodes

% indeg_all: nodes' indegrees (indegree = number of predecessors) 
% input nodes are of indegree = 0
% indegrees for mid and output nodes are read from netlist file
indeg_all = [zeros(1, N_inp) fscanf(fid, '%d', N_mo)'];
indeg_max = max(indeg_all);  % maximum node indegree
indeg_sum = sum(indeg_all);  % sum of all nodes' indegrees 

if any(indeg_all(N_inp+1:end) <= 0)
    error('input degrees of mid/output nodes must be positive!')
end

% gate_type: type of the corresponding gate, for each node in the netlist
% in_list: list of predecessors (read from netlist file)
% predecessors of node 'n' are stored in the 'in_list' array 
% between indexes in_ldeg(n) and in_rdeg(n)
gate_type = -ones(1, N_tot);
in_list   = -ones(1, indeg_sum);
in_rdeg   = cumsum(indeg_all);
in_ldeg   = in_rdeg - indeg_all + 1;

for n = (N_inp+1):N_tot
    gate_type(n) = fscanf(fid, '%d', 1);
    in_list(in_ldeg(n):in_rdeg(n)) = fscanf(fid, '%d', indeg_all(n))'+1;
end

% end of netlist file
fclose(fid);

% check gate_type and in_list values
if any(gate_type(N_inp+1:end) < 0) || any(gate_type(N_inp+1:end) > 6)
    error('gate type values must be between 0 and 6!')
end
if any(in_list <= 0) || any(in_list > N_tot)
    error('predecessors'' values must be between 0 and %d', N_tot-1)
end

% ---------------------------------
% determine outdegrees and out-list
% ---------------------------------
% outdeg_all: nodes' outdegrees (outdegree = number of successors) 
% output nodes must have outdegree = 0
% input and mid nodes must have outdegree > 0
outdeg_all = zeros(1, N_tot);
for n = 1:N_tot
    in_nodes = in_list(in_ldeg(n):in_rdeg(n)); 
    outdeg_all(in_nodes) = outdeg_all(in_nodes) + 1;
end
% if any(outdeg_all(N_inp+(1:N_out)) ~= 0)
%     error('output nodes should have output degree equal to zero!')
% end
% if any(outdeg_all(1:N_im) == 0)
%     error('input/mid nodes should have output degree greater than zero!')
% end
if any(outdeg_all(1:N_inp) == 0)
    error('input nodes should have output degree greater than zero!')
end
if sum(outdeg_all==0) > N_out
    error('the number of nodes of outdegree zero should be less than or equal to the number of output nodes!')
end
outdeg_sum = sum(outdeg_all);
if indeg_sum ~= outdeg_sum
    error('inconsistency between ''indeg_sum'' (%d) and ''outdeg_sum'' (%d)', indeg_sum, outdeg_sum)
end

% out_list: list of successors (determined acc. to in_list)
% successors of node 'n' are stored in the 'out_list' array 
% between indexes out_ldeg and out_rdeg
out_list = -ones(1, outdeg_sum);
out_rdeg = cumsum(outdeg_all);
out_ldeg = out_rdeg - outdeg_all + 1;
outdeg_tmp  = zeros(1, N_tot);
for n = 1:N_tot
    in_nodes = in_list(in_ldeg(n):in_rdeg(n)); 
    out_list(out_ldeg(in_nodes) + outdeg_tmp(in_nodes)) = n;
    outdeg_tmp(in_nodes) = outdeg_tmp(in_nodes) + 1;
end
if any(out_list) == -1
    error('''out_list'' error')
end

%% ===============================================================
%  determine the processing (encoding) order of nodes
%  input nodes are processed first,
%  then those whose all predecessors are input nodes
%  ..., nodes processed in step l are those whose predecessors are 
%       either input nodes or have been processed during stages 
%  ===============================================================
indeg_tmp = indeg_all;
enc_order = -ones(1, N_tot); % array of nodes stored in encoding order
N_enc  = 0;      % number of encoded nodes
N_step = 0;      % number of encoding steps
N_enc_step = []; % number of encoded nodes per encoded step
while N_enc < N_tot
    nodes = find(indeg_tmp == 0);
    if isempty(nodes)
        error('cannot determine encoding pattern')
    end
    enc_order(N_enc+(1:numel(nodes))) = nodes; 
    N_enc = N_enc + numel(nodes); 
    
    N_step = N_step+1;
    N_enc_step = [N_enc_step, numel(nodes)];
    
    indeg_tmp(indeg_tmp == 0) = -1;
    for n = nodes
       out_nodes = out_list(out_ldeg(n):out_rdeg(n)); 
       if any(indeg_tmp(out_nodes) <= 0)
           error('unexpected ''indeg_tmp(out_nodes)'' equal to zero')
       end
       indeg_tmp(out_nodes) = indeg_tmp(out_nodes)-1;
    end
end
if N_enc ~= N_tot
    error('''N_enc'' (%d) should be equal to ''N_tot'' (%d)', N_enc, N_tot)
end
if N_enc_step(1) ~= N_inp
    error('''N_enc_step(1)'' (%d) should be equal to ''N_inp'' (%d)', N_enc_step(1), N_inp)
end
if any(enc_order(1:N_inp) ~= 1:N_inp)
    error('first ''N_inp'' nodes in the ''enc_order'' vector should be the input nodes')
end

fprintf('\nconsistency check -- OK!\n');
fprintf('number of encoding steps = %d\n', N_step);
fprintf('number of nodes processed per encoding step:\n');
fprintf('   %d', N_enc_step);
fprintf('\n\n');

fprintf('gates type distribution:\n');
for type = 0:6
    fprintf('type %d => number gates = %-5d (%f)\n', type, sum(gate_type==type), sum(gate_type==type)/N_mo);
end
fprintf('\n')

%% ============================================================
%  determine the critical degree of each internal node
%  critical degree = number of output-cones to which it belongs
%  ============================================================
fprintf(1, 'Computing nodes'' criticality degrees...'); 
out_nodes = N_inp+(1:N_out); 
critical_deg = zeros(1, N_tot);

for idx = 1:N_out
   cone_indicator = false(1, N_tot); % indicates which nodes are in the cone
   cone_add_new = out_nodes(idx);    % set of nodes nodes to be added to the cone

   while ~isempty(cone_add_new)
       cone_indicator(cone_add_new) = true; % add the new nodes to the cone
       cone_add_old = cone_add_new;         % save set of nodes added to the cone
       cone_add_new = [];                   % new set of nods to be added to the code
       
       for node = cone_add_old
           pred_list = in_list(in_ldeg(node):in_rdeg(node)); % list of predecessors
           pred_new = pred_list(~cone_indicator(pred_list)); % predecessors that are not in the code already
           cone_add_new = union(cone_add_new, pred_new);     % update list of new nodes
       end    
   end
   
   % update the critical degree of nodes in the cone
   critical_deg(cone_indicator) = critical_deg(cone_indicator) + 1;
end
fprintf(1, 'done!\n\n');
% verify
 if any(critical_deg(out_nodes) ~= 1)
    error('output nodes should have criticality degree equal to 1!'); 
 end


if plot_arg
    critical_deg_mo = critical_deg(N_inp+1:N_tot);
    critical_deg_max = max(critical_deg_mo);
    critical_deg_pdf = zeros(1, critical_deg_max);
    for idx = 1:critical_deg_max
        critical_deg_pdf(idx) = sum(critical_deg_mo==idx);
    end
    critical_deg_cdf = cumsum(critical_deg_pdf);
    
    figure
    plot(1:numel(critical_deg_cdf), critical_deg_cdf/critical_deg_cdf(end), '-b', 'LineWidth', 2);
    xlabel('Criticality degree');
    ylabel('CDF')
end

%% =======================================
%  write or append results to netlist file
%  =======================================
if isempty(fout_name) || strcmpi(fout_name, 'off')
    return

elseif strcmpi(fout_name, 'a') ||  strcmpi(fout_name, 'append')
    % ---------------------------------------------------
    % append 'encoding order' + 'citicality degrees' +   
    % 'indexes of output nodes' to the input netlist file
    % ---------------------------------------------------
    fid = fopen(['./' fin_name '.nl'], 'a');
    if fid == -1, error('Cannot open output file!'); end
    fprintf(fid, '\n');

    % encoding order
    fprintf(fid, '%d ', enc_order((N_inp+1):end)-1);
    fprintf(fid, '\n');
    % criticity degrees
    fprintf(fid, '%d ', critical_deg);
    fprintf(fid, '\n');
    % output nodes
    out_nodes = N_inp+(1:N_out);
    fprintf(fid, '%d ', out_nodes-1);
    fprintf(fid, '\n\n');
    % close file
    fclose(fid);
    
else 
    if strcmpi(fout_name, 'c') ||  strcmpi(fout_name, 'check')
        fout_name = [fin_name '_check'];
    end
    % ---------------------------------------------
    % write output file: netlist + encoding order + 
    % citicality degrees + indexes of output nodes
    % ---------------------------------------------
    %fid = fopen(['./netlist_files/' fout_name '.nl'], 'w');
    fid = fopen(['./' fout_name '.nl'], 'w');
    if fid == -1, error('Cannot open output file!'); end
    % number of input/output/internal nodes
    fprintf(fid, '%d %d %d\n', N_inp, N_out, N_mid);
    % indegrees
    fprintf(fid, '%d ', indeg_all(N_inp+1:end));
    fprintf(fid, '\n');
    % list of predecessors
    for n = (N_inp+1):N_tot
        fprintf(fid, '%d ', gate_type(n));
        fprintf(fid, '%d ', in_list(in_ldeg(n):in_rdeg(n))-1);
        fprintf(fid, '\n');
    end
    fprintf(fid, '\n');
    % encoding order
    fprintf(fid, '%d ', enc_order((N_inp+1):end)-1);
    fprintf(fid, '\n');
    % criticity degrees
    fprintf(fid, '%d ', critical_deg);
    fprintf(fid, '\n');
    % output nodes
    out_nodes = N_inp+(1:N_out); 
    fprintf(fid, '%d ', out_nodes-1);
    fprintf(fid, '\n\n');
    % close file
    fclose(fid);
    
end

end

