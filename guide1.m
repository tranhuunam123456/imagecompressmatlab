function varargout = guide1(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guide1_OpeningFcn, ...
                   'gui_OutputFcn',  @guide1_OutputFcn, ...
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

% --- Executes just before guide1 is made visible.
function guide1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guide1 (see VARARGIN)

% Choose default command line output for guide1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guide1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guide1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btbfile.
function btbfile_Callback(hObject, eventdata, handles)

[filename, filepath] = uigetfile({'*.*';'*.jpg';'*.png';'*.bmp'},'Search image to be displayed');
fullname = [filepath filename];
ImageFile = imread(fullname);
axes(handles.axes1);
set(handles.edit1,'string',fullname);
imshow(ImageFile);
fileInfo = dir(fullname);
fileSize = fileInfo.bytes;
set(handles.textbytes1,'String',num2str(fileSize));

% hObject    handle to btbfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btbComp.
function btbComp_Callback(hObject, eventdata, handles)
input=get(handles.edit1,'string');
x=str2num(get(handles.texttiso,'string'));
output=main(input,x);
axes(handles.axes2);
imshow(output);
y = psnr(input,output);
temp = size(enco,1) * size(enco,2);
temp2 = size(input,1) * size(input,2);
z = ((temp2 - temp) / temp2) * 100;



set(handles.textsave,'string',y);


% hObject    handle to btbComp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btbsave.



% hObject    handle to btbsave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in btbclear.
function btbclear_Callback(hObject, eventdata, handles)
set(handles.textbytes2,'String','');
set(handles.textsave,'String','');
set(handles.texttiso,'String','');
set(handles.textnen,'String','');
cla(handles.axes2,'reset');
set(handles.axes2,'xtick',[]);
set(handles.axes2,'ytick',[]);



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)


function axes2_CreateFcn(hObject, eventdata, handles)



function texttiso_Callback(hObject, eventdata, handles)
% hObject    handle to texttiso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of texttiso as text
%        str2double(get(hObject,'String')) returns contents of texttiso as a double


% --- Executes during object creation, after setting all properties.
function texttiso_CreateFcn(hObject, eventdata, handles)
% hObject    handle to texttiso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btbbytes.



% --- Executes on button press in btbsave.
function btbsave_Callback(hObject, eventdata, handles)
input=get(handles.textsave,'String');
IM = getimage(handles.axes2);
axes(handles.axes2);
imwrite(IM,input)
fileInfo = dir(input);
fileSize = fileInfo.bytes;
set(handles.textbytes2,'String',num2str(fileSize));
x=str2num(get(handles.textbytes1,'string'));
y=str2num(get(handles.textbytes2,'string'));
set(handles.textnen,'String',num2str(x/y));
% hObject    handle to btbsave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function textsave_Callback(hObject, eventdata, handles)
% hObject    handle to textsave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textsave as text
%        str2double(get(hObject,'String')) returns contents of textsave as a double


% --- Executes during object creation, after setting all properties.
function textsave_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textsave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btbpsnr.
function btbpsnr_Callback(hObject, eventdata, handles)
x=[1 2 3 5 10];
y=[35.8 33.7 32.5 30.5 27.3];
axes(handles.axes1);
plot(x,y);



% hObject    handle to btbpsnr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
