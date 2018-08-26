
function varargout = c_gui(varargin)
% C_GUI MATLAB code for c_gui.fig
%      C_GUI, by itself, creates a new C_GUI or raises the existing
%      singleton*.
%
%      H = C_GUI returns the handle to a new C_GUI or the handle to
%      the existing singleton*.
%
%      C_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in C_GUI.M with the given input arguments.
%
%      C_GUI('Property','Value',...) creates a new C_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before c_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to c_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help c_gui

% Last Modified by GUIDE v2.5 26-Apr-2018 16:56:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @c_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @c_gui_OutputFcn, ...
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


% --- Executes just before c_gui is made visible.
function c_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to c_gui (see VARARGIN)

% Choose default command line output for c_gui
handles.output = hObject;

% Initialize all variables we'll need later
handles.fileLoaded = 0;
handles.spectrogramLoaded = 0;
handles.fs = 0;
handles.signal = 0;
handles.waveformX = 0;
handles.spectrogram = 0;
handles.spectralX = 0;
handles.currentSpectralLimits = 0;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes c_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = c_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
% "load file"
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% file dialog to get filename
[filename,filefolder] = uigetfile('.wav');
filepath = [filefolder, filename];
if (filepath)
    % set signal
    handles.signal = audioread(filepath);
    % set sampling rate
    foo = audioinfo(filepath);
    handles.fs = foo.SampleRate;
    % set waveformAxes x-coordinates
    handles.waveformX = (1 / handles.fs / 60) ...
        .* (1:length(handles.signal));
    axes(handles.waveformAxes);
    plot(handles.waveformX, handles.signal);
    title("waveform");
    xlabel("time (minutes)");
    xlim([0 handles.waveformX(end)]);
    ylabel("sample value");
    % adjust internal flag
    handles.fileLoaded = 1;
end
% update
guidata(hObject, handles);


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in windowsizemenu.
function windowsizemenu_Callback(hObject, eventdata, handles)
% hObject    handle to windowsizemenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns windowsizemenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from windowsizemenu


% --- Executes during object creation, after setting all properties.
function windowsizemenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to windowsizemenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in zeropaddingmenu.
function zeropaddingmenu_Callback(hObject, eventdata, handles)
% hObject    handle to zeropaddingmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns zeropaddingmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from zeropaddingmenu


% --- Executes during object creation, after setting all properties.
function zeropaddingmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to zeropaddingmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
%% "calculate FFT"
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if (handles.fileLoaded)
    disp('calculating FFT');
    % get window size
    windowSize = get(handles.windowsizemenu, 'String'); % all the strings
    windowSize = windowSize(get(handles.windowsizemenu, 'Value')); % right string
    windowSize = str2num(cell2mat(windowSize)); % as a number

    % get hop size
    hopSize = get(handles.hopsizemenu, 'String'); % all the strings
    hopSize = hopSize(get(handles.hopsizemenu, 'Value')); % right string
    hopSize = str2num(cell2mat(hopSize)); % as a number

    % get zero-padding
    zeroPadding = get(handles.zeropaddingmenu, 'String'); % all the strings
    zeroPadding = zeroPadding(get(handles.zeropaddingmenu, 'Value')); % right string
    zeroPadding = str2num(cell2mat(zeroPadding)); % as a number

    % calculate spectrogram
    handles.spectrogram = b_abstracted_spectrogram_magnitude(...
        handles.signal', windowSize, hopSize, zeroPadding);

    % plot in spectrogramAxes window
    axes(handles.spectrogramAxes)
    
    handles.spectralX = (hopSize / handles.fs / 60) .* ...
        (1:size(handles.spectrogram,2));
    
    % now that spectrogram is magnitudes, convert to db
    imagesc(flipud(mag2db(handles.spectrogram)));
    title("spectrogram");
    % again from hw3: adjust axis labels
    % adjust x axis labels to be in minutes (multiply # of hops by calculated
    % hop size in minutes)
    xticklabels(arrayfun(@(numhops) round(handles.spectralX(numhops),2), xticks));
    % likewise adjust y axis labels to correspond to bin frequencies
    xlabel("time (min)");
    numBins = (zeroPadding * windowSize / 2 + 1);
    handles.numBins = numBins;
    yticklabels(arrayfun(@(inversebin) round( ...
        (numBins - inversebin) * (handles.fs/2/numBins), 2), yticks));
    ylabel("frequency (Hz)");
    guidata(hObject, handles);
    disp('complete');
else
    errordlg('no file loaded');
end


%% --- Executes on selection change in hopsizemenu.
function hopsizemenu_Callback(hObject, eventdata, handles)
% hObject    handle to hopsizemenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns hopsizemenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from hopsizemenu


% --- Executes during object creation, after setting all properties.
function hopsizemenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hopsizemenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in centroid_checkbox.
function centroid_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to centroid_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of centroid_checkbox


% --- Executes on button press in pushbutton3.
% "calculate timbre attributes"
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% first, calculate spectral centroid from spectrogram
% set and clear axes
axes(handles.attributesAxes);
cla
% plot and set bounds
legendText = [];
% centroid
if (get(handles.centroid_checkbox, 'Value'))
    hold on;   
    plot(handles.spectralX, handles.centroidVector);
    legendText = [legendText, {'centroid (Hz)'}];
end
% standard deviation
if (get(handles.sd_checkbox, 'Value'))
    hold on;
    plot(handles.spectralX, handles.sdVector);
    legendText = [legendText, {'spread (Hz)'}];
end
if (get(handles.flatness_checkbox, 'Value'))
    hold on;
    plot(handles.spectralX, handles.flatnessVector);
    legendText = [legendText, {'flatness'}];
end
if (get(handles.roughness_checkbox, 'Value'))
    hold on;
    plot(handles.spectralX, handles.roughnessVector);
    legendText = [legendText, {'roughness'}];
end
if (get(handles.inharmonicity_checkbox, 'Value'))
    hold on;
    plot(handles.spectralX, handles.inharmonicityVector);
    legendText = [legendText, {'inharmonicity'}];
end
if (get(handles.numpeaks_checkbox, 'Value'))
    hold on;
    plot(handles.spectralX, handles.numpeaksVector);
    legendText = [legendText, {'# peaks'}];
end    
xlabel("time (minutes)");
ylabel("attribute value");
title("Timbre Attributes");
legend(legendText);

if (handles.currentSpectralLimits)
    xlim(handles.currentSpectralLimits);
else
    xlim(handles.spectralX([1 end]));
end
guidata(hObject, handles);



% --- Executes on slider movement.
function startSlider_Callback(hObject, eventdata, handles)
% hObject    handle to startSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function startSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to startSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function endSlider_Callback(hObject, eventdata, handles)
% hObject    handle to endSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function endSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to endSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton4.
% "bounds"
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
startVal = get(handles.startSlider, 'Value');
endVal = get(handles.endSlider, 'Value');
if (startVal < endVal)
    % adjust waveform axes
    axes(handles.waveformAxes);
    waveformLen = length(handles.waveformX) - 1;
    waveformStart = floor(waveformLen * startVal) + 1;
    waveformEnd = floor(waveformLen * endVal) + 1;
    xlim(handles.waveformX([waveformStart waveformEnd]))
    title("waveform");
    xlabel("time (minutes)");
    ylabel("sample value");
    % replot spectrogram
    spectralLen = length(handles.spectralX) - 1;
    spectralStart = floor(spectralLen * startVal) + 1;
    spectralEnd = floor(spectralLen * endVal) + 1;
    axes(handles.spectrogramAxes)
    % now that spectrogram is magnitudes, convert to db
    imagesc(flipud(mag2db(handles.spectrogram(: , (spectralStart:spectralEnd)))));
    % for x tick labels, "1" is now actually "spectralStart," so adjust
    % appropriately. Somehow this gets correct spacing but wrong initial
    % value???
    xticklabels(arrayfun(@(numhops) round(handles.spectralX(numhops+spectralStart),2), xticks));
    xlabel("time (min)");
    yticklabels(arrayfun(@(inversebin) round( ...
        (handles.numBins - inversebin) * (handles.fs/2/handles.numBins), 2), yticks));
    ylabel("frequency (Hz)");
    % again from hw3: adjust axis labels
    % adjust x axis labels to be in minutes (multiply # of hops by calculated
    % hop size in minutes)
    xticklabels(arrayfun(@(numhops) round(handles.spectralX(numhops),2), xticks));
    % adjust timbre attribute axes
    axes(handles.attributesAxes);
    handles.currentSpectralLimits = handles.spectralX([spectralStart spectralEnd]);
    xlim(handles.currentSpectralLimits);
    xlabel("time (minutes)");
    ylabel("spectral centroid (Hz)");
    title("Timbre Attributes");
    guidata(hObject, handles);
else
    errordlg('start value not less than end value');
end


% --- Executes on button press in sd_checkbox.
function sd_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to sd_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sd_checkbox


% --- Executes on button press in flatness_checkbox.
function flatness_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to flatness_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of flatness_checkbox


% --- Executes on button press in roughness_checkbox.
function roughness_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to roughness_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of roughness_checkbox


% --- Executes on button press in inharmonicity_checkbox.
function inharmonicity_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to inharmonicity_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of inharmonicity_checkbox


% "basic spectral measures"
% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    disp('calculating spectral centroid...');
    handles.centroidVector = b_spectralCentroid(handles.spectrogram, handles.fs);
    disp('calculating spectral standard deviation...');
    handles.sdVector = d_spectralStandardDeviation(handles.spectrogram, ...
        handles.centroidVector, handles.fs);
    disp('calculating spectral flatness...');
    handles.flatnessVector = d_spectralFlatness(handles.spectrogram);
    disp('basic spectral measures complete.');
    guidata(hObject, handles);

% "peak extraction measures"
% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% also calculate timbre metrics here, so we can adjust which to plot later!
    disp('extracting peaks...');
    threshold = get(handles.peakThresholdSlider, 'Value') * 50 + 10;
    disp('threshold:');
    disp(threshold);
    handles.peaksVector = e_peaks(handles.spectrogram, handles.fs, threshold);
    disp('calculating numbers of peaks...')
    handles.numpeaksVector = e_countpeaks(handles.peaksVector);
    disp('calculating roughness...');
    handles.roughnessVector = e_roughness(handles.peaksVector);
    disp('calculating inharmonicity...');
    handles.inharmonicityVector = e_inharmonicity(handles.peaksVector);
    disp('complete');
    % update values
    guidata(hObject, handles);

% --- Executes on button press in numpeaks_checkbox.
function numpeaks_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to numpeaks_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of numpeaks_checkbox


% --- Executes on slider movement.
function peakThresholdSlider_Callback(hObject, eventdata, handles)
% hObject    handle to peakThresholdSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function peakThresholdSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to peakThresholdSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton9.
% save data
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% include all data worth saving
tosave = struct;
tosave.signal = handles.signal;
tosave.waveformX = handles.waveformX;
tosave.spectrogram = handles.spectrogram;
tosave.spectralX = handles.spectralX;
tosave.numBins = handles.numBins;
tosave.centroidVector = handles.centroidVector;
tosave.sdVector = handles.sdVector;
tosave.flatnessVector = handles.flatnessVector;
tosave.roughnessVector = handles.roughnessVector;
tosave.inharmonicityVector = handles.inharmonicityVector;
tosave.numpeaksVector = handles.numpeaksVector;
tosave.peaksVector = handles.peaksVector;
tosave.fs = handles.fs;

[filename,filefolder] = uiputfile('.mat');
filepath = [filefolder, filename];
save(filepath, 'tosave');



% --- Executes on button press in pushbutton10.
% load data
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,filefolder] = uigetfile('.mat');
filepath = [filefolder, filename];
load(filepath);
toload = tosave;

handles.signal = toload.signal;
handles.waveformX = toload.waveformX;
handles.spectrogram = toload.spectrogram;
handles.spectralX = toload.spectralX;
handles.numBins = toload.numBins;
handles.centroidVector = toload.centroidVector;
handles.sdVector = toload.sdVector;
handles.flatnessVector = toload.flatnessVector;
handles.roughnessVector = toload.roughnessVector;
handles.inharmonicityVector = toload.inharmonicityVector;
handles.numpeaksVector = toload.numpeaksVector;
handles.peaksVector = toload.peaksVector;
handles.fs = toload.fs;
guidata(hObject, handles);

% plot waveform
axes(handles.waveformAxes);
plot(handles.waveformX, handles.signal);
title("waveform");
xlabel("time (minutes)");
xlim([0 handles.waveformX(end)]);
ylabel("sample value");
% adjust internal flag
handles.fileLoaded = 1;

% adjust other things automatically
pushbutton3_Callback(hObject, eventdata, handles);
pushbutton4_Callback(hObject, eventdata, handles)
    
