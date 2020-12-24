import React from 'react';
import {NativeModules} from 'react-native';

const SharedStorage = NativeModules.SharedStorage;

export const setWidgetText = (messege, color) => {
  SharedStorage.set(JSON.stringify({text: messege, color}));
};
