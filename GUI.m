function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 05-Dec-2012 22:52:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in rayleigh_input.
function rayleigh_input_Callback(hObject, eventdata, handles)
% hObject    handle to rayleigh_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rayleigh_input



function N_input_Callback(hObject, eventdata, handles)
% hObject    handle to N_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of N_input as text
%        str2double(get(hObject,'String')) returns contents of N_input as a double


% --- Executes during object creation, after setting all properties.
function N_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to N_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function M_input_Callback(hObject, eventdata, handles)
% hObject    handle to M_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of M_input as text
%        str2double(get(hObject,'String')) returns contents of M_input as a double


% --- Executes during object creation, after setting all properties.
function M_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to M_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in high_radio.
function high_radio_Callback(hObject, eventdata, handles)
% hObject    handle to high_radio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of high_radio


% --- Executes on button press in low_radio.
function low_radio_Callback(hObject, eventdata, handles)
% hObject    handle to low_radio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of low_radio



function polynomials_input_Callback(hObject, eventdata, handles)
% hObject    handle to polynomials_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of polynomials_input as text
%        str2double(get(hObject,'String')) returns contents of polynomials_input as a double


% --- Executes during object creation, after setting all properties.
function polynomials_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to polynomials_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in doppler_input.
function doppler_input_Callback(hObject, eventdata, handles)
% hObject    handle to doppler_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns doppler_input contents as cell array
%        contents{get(hObject,'Value')} returns selected item from doppler_input


% --- Executes during object creation, after setting all properties.
function doppler_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to doppler_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in hard_soft_input.
function hard_soft_input_Callback(hObject, eventdata, handles)
% hObject    handle to hard_soft_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns hard_soft_input contents as cell array
%        contents{get(hObject,'Value')} returns selected item from hard_soft_input


% --- Executes during object creation, after setting all properties.
function hard_soft_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hard_soft_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in csi_input.
function csi_input_Callback(hObject, eventdata, handles)
% hObject    handle to csi_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns csi_input contents as cell array
%        contents{get(hObject,'Value')} returns selected item from csi_input


% --- Executes during object creation, after setting all properties.
function csi_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to csi_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in interleaving_input.
function interleaving_input_Callback(hObject, eventdata, handles)
% hObject    handle to interleaving_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of interleaving_input


% --- Executes on button press in search_button.
function search_button_Callback(hObject, eventdata, handles)
% hObject    handle to search_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fprintf( '--------------')
N = str2num(get(handles.N_input, 'string'));
M = str2num(get(handles.M_input, 'string'));

% get rayleigh input and parse it
rayleigh = get(handles.rayleigh_input, 'Value');
if rayleigh == 1
    rayleigh = 'yes';
else
    rayleigh = 'no';
end

% get doppler input and parse it
doppler = get(handles.doppler_input, 'Value');
if doppler == 1
    doppler = 'low';
else
    doppler = 'high';
end
 
% get viterbi decoder type input and parse it
decoding = get(handles.hard_soft_input, 'Value');
if decoding == 1
    decoding = 'HDD';
else
    decoding = 'SDD';
end

% get csi input and parse it
csi = get(handles.csi_input, 'Value');
if csi == 1
    csi = 'no';
else
    csi = 'yes';
end

% get interleaving input and parse it
interleaving = get(handles.interleaving_input, 'Value');
if interleaving == 1
    interleaving = 'yes';
else
    interleaving = 'no';
end
experiment(M, N, rayleigh, doppler, 0, decoding, csi, interleaving,'search')
%fprintf('%d %d\n', N, M)
%rayleigh
%doppler
%type
%csi
%interleaving

% --- Executes on button press in plot_button.
function plot_button_Callback(hObject, eventdata, handles)
% hObject    handle to plot_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%fprintf( '--------------')
N = str2num(get(handles.N_input, 'string'));
M = str2num(get(handles.M_input, 'string'));

% get rayleigh input and parse it
rayleigh = get(handles.rayleigh_input, 'Value');
if rayleigh == 1
    rayleigh = 'yes';
else
    rayleigh = 'no';
end

% get doppler input and parse it
doppler = get(handles.doppler_input, 'Value');
if doppler == 1
    doppler = 'low';
else
    doppler = 'high';
end

% get convolutional codes and parse it
arr = get(handles.polynomials_input, 'string');
count = 1;
tmp = zeros(1, 10); % for safety
while isempty(arr) ~= 1
    [token, arr] = strtok(arr, ',');
    tmp(count) = str2num(token);
    count = count + 1;
end
arr = zeros(1, (count-1));
for i=1:length(arr)
    arr(i) = tmp(i);
end
 
% get viterbi decoder type input and parse it
decoding = get(handles.hard_soft_input, 'Value');
if decoding == 1
    decoding = 'HDD';
else
    decoding = 'SDD';
end

% get csi input and parse it
csi = get(handles.csi_input, 'Value');
if csi == 1
    csi = 'no';
else
    csi = 'yes';
end

% get interleaving input and parse it
interleaving = get(handles.interleaving_input, 'Value');
if interleaving == 1
    interleaving = 'yes';
else
    interleaving = 'no';
end
experiment(M, N, rayleigh, doppler, arr, decoding, csi, interleaving,'plot')
%fprintf('%d %d\n', N, M)
%arr
%rayleigh
%doppler
%type
%csi
%interleaving

% --- Executes during object creation, after setting all properties.
function search_button_CreateFcn(hObject, eventdata, handles)
% hObject    handle to search_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over plot_button.
function plot_button_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to plot_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
