function varargout = assignment(varargin)
% ASSIGNMENT MATLAB code for assignment.fig
%      ASSIGNMENT, by itself, creates a new ASSIGNMENT or raises the existing
%      singleton*.
%
%      H = ASSIGNMENT returns the handle to a new ASSIGNMENT or the handle to
%      the existing singleton*.
%
%      ASSIGNMENT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASSIGNMENT.M with the given input arguments.
%
%      ASSIGNMENT('Property','Value',...) creates a new ASSIGNMENT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before assignment_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to assignment_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help assignment

% Last Modified by GUIDE v2.5 20-Mar-2021 15:05:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @assignment_OpeningFcn, ...
                   'gui_OutputFcn',  @assignment_OutputFcn, ...
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


% --- Executes just before assignment is made visible.
function assignment_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to assignment (see VARARGIN)

% Choose default command line output for assignment
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes assignment wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = assignment_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function editLoan_Callback(hObject, eventdata, handles)
% hObject    handle to editLoan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editLoan as text
%        str2double(get(hObject,'String')) returns contents of editLoan as a double


% --- Executes during object creation, after setting all properties.
function editLoan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editLoan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editInterest_Callback(hObject, eventdata, handles)
% hObject    handle to editInterest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editInterest as text
%        str2double(get(hObject,'String')) returns contents of editInterest as a double


% --- Executes during object creation, after setting all properties.
function editInterest_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editInterest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editMonthlyPayment_Callback(hObject, eventdata, handles)
% hObject    handle to editMonthlyPayment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editMonthlyPayment as text
%        str2double(get(hObject,'String')) returns contents of editMonthlyPayment as a double


% --- Executes during object creation, after setting all properties.
function editMonthlyPayment_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editMonthlyPayment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function dataDisplay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dataDisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
table = ["Beginning Balance", "Payment", "Interest", "Principal", "Ending Balance"];
set(hObject,'ColumnName',table);


% --- Executes on button press in calculate.
function calculate_Callback(hObject, eventdata, handles)
% hObject    handle to calculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get the user input and store then in global variables
loan = str2double(get(handles.editLoan, "string"));

interest = str2double(get(handles.editInterest, "string"));

monthlyPayment = str2double(get(handles.editMonthlyPayment, "string"));

monthlyInterest = (loan * interest) / 12;


if loan > 5000
    if interest > 0.015
        if monthlyPayment >= monthlyInterest
            data = calculateData(loan, monthlyPayment, interest);
            set(handles.dataDisplay, 'Data', data);
        else
            errordlg("Monthly payment too small", "warning");
        end     
    else
        errordlg("Insufficient interest rate, minimum 1.5%", "warning"); 
    end
else
    errordlg("Insufficient loan amount, minimum $5000", "warning");
end

    function data = calculateData(loan, monthlyPayment, interest)
        data = [];
        ending_balance = loan;
        iteration = 1;
        while ending_balance ~= 0
            if monthlyPayment < ending_balance
                beginning_balance = ending_balance;
                monthlyInterest = (beginning_balance * interest) / 12;
                principal = monthlyPayment - monthlyInterest;
                ending_balance = beginning_balance - principal;
            else
                beginning_balance = ending_balance;
                monthlyPayment = ending_balance; 
                principal = ending_balance;
                monthlyInterest = 0;
                ending_balance = 0;
            end
            data(iteration, 1:5) = [beginning_balance, monthlyPayment, monthlyInterest, principal, ending_balance];
            iteration = iteration + 1;
        end




% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)
