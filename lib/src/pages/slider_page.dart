import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _currentValue = 200.0;
  bool _blockCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            _createSlider(),
            _createCheckbox(),
            _createSwitch(),
            Expanded(child: _createImage())
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      max: 350,
      min: 100,
      activeColor: Colors.indigoAccent,
      label: 'Image size',
      value: _currentValue,
      /* divisions: 10, */
      onChanged: _blockCheck
          ? null
          : (value) {
              setState(() {
                _currentValue = value;
              });
            },
    );
  }

  Widget _createImage() {
    return FadeInImage(
      fadeInDuration: Duration(milliseconds: 200),
      width: _currentValue,
      fit: BoxFit.contain,
      image: NetworkImage(
          'https://static.wikia.nocookie.net/zelda/images/2/26/Link_Artwork_LAR.png/revision/latest?cb=20191015020845&path-prefix=es'),
      placeholder: AssetImage('assets/loadingImage.gif'),
    );
  }

  Widget _createCheckbox() {
    return CheckboxListTile(
        title: Text('Block Slider'),
        activeColor: Colors.indigoAccent,
        value: _blockCheck,
        onChanged: (value) {
          setState(() {
            _blockCheck = value;
          });
        });
  }

  Widget _createSwitch() {
    return SwitchListTile(
        title: Text('Block Slider'),
        activeColor: Colors.indigoAccent,
        value: _blockCheck,
        onChanged: (value) {
          setState(() {
            _blockCheck = value;
          });
        });
  }
}
