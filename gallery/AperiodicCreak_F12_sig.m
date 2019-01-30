% Figure for example of aperiodic creak in the EGG gallery developed at https://github.com/alexis-michaud/egg
% This is the figure for the audio and EGG signals. 

% Clearing all that came before.
clear

% Loading audio file
[aud,Fs] = audioread ('C:\Dropbox\GitHub\egg\gallery\AperiodicCreak_F12_AUD.wav');

% Loading results file, which contains the EGG signal
load('C:\Dropbox\GitHub\egg\gallery\AperiodicCreak_F12.mat')

% Extracting relevant portion
aud = aud(round(LENG(1) * (FS/1000)):round(LENG(2) * (FS/1000)));
egg = SIG(round(LENG(1) * (FS/1000)):round(LENG(2) * (FS/1000)));


figure(1)
% clearing figure
clf

% setting large font size for x and y scales
h = axes;
set(h,'Fontsize',13)


% setting axis limits to the range of the data: axis tight; but this does not suit this figure, as there needs to be a little head room and 'foot room' for legibility.

%%% Plotting the signals
% x axis in centiseconds.
% Duration of extract:  ( length(aud) / Fs ) * 100;
times = ([1:length(aud)] / Fs ) * 100;

% Plotting audio
plot(times, aud*0.8+1.1)

% Keep going without erasing
hold on

% Plotting EGG
plot(times, egg*1.4 + 0.22)
% For the deviated signals: there is 1 sample less. 
plot(times(1:length(times) - 1), (9 * dSIG) - 1)
plot(times(1:length(times) - 1), (13 * SdSIG) - 1.92)

% Axis for best legibility
axis([1 times(length(times)) -2.1 1.8])

% No need for y values or ticks.
set(h,'YTickLabel',{})
set(h,'YTick',[])

xlabel('Time in centiseconds.')
ylabel('From top: audio; EGG; unsmoothed dEGG; smoothed dEGG.')

print('-dpdf', 'C:\Dropbox\GitHub\egg\gallery\images\AperiodicCreak_F12_sig.pdf')
print('-dpng', 'C:\Dropbox\GitHub\egg\gallery\images\AperiodicCreak_F12_sig.png')