/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

import React from 'react';
import {View, Text, StyleSheet, Button} from 'react-native';
import {setWidgetText} from './src/utils/SharedStorage';
const styles = StyleSheet.create({
  container: {flex: 1},
  btnContainer: {flexDirection: 'row', height: 150},
});
const App = () => {
  const buttons = [
    {
      name: 'Red',
      color: '#FF0000',
    },
    {
      name: 'Green',
      color: '#00FF00',
    },
    {
      name: 'Blue',
      color: '#0000FF',
    },
  ];
  return (
    <View style={styles.container}>
      <Text>Hello</Text>
      <View style={styles.btnContainer}>
        {buttons.map((b, idx) => {
          return (
            <Button
              key={'b_' + idx}
              color={b.color}
              onPress={() => setWidgetText('hello', b.color)}
              title={b.name}
            />
          );
        })}
      </View>
    </View>
  );
};
export default App;
