import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/photoService.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_application_1/commpanents/photoList.dart';
import 'package:flutter_application_1/model/photoModel.dart';
import 'package:flutter_application_1/screen/detailScreen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<Photo> _photos = [];
  late bool _isLoading = false;
  late String _errorMessage = '';
  late RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController(initialRefresh: false);
    _fetchPhotos();
  }

  Future<void> _fetchPhotos() async {
    setState(() {
      _isLoading = true;
    });

    try {
      List<Photo> photos = await PhotoService.getPhotos();
      setState(() {
        _photos = photos;
        _isLoading = false;
        _errorMessage = '';
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Failed to load photos';
      });
    }
  }

  void _onRefresh() async {
    await _fetchPhotos();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Market App'),
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _onRefresh,
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (_errorMessage.isNotEmpty) {
      return Center(
        child: Text(_errorMessage),
      );
    } else {
      return ListView.builder(
        itemCount: _photos.length,
        itemBuilder: (context, index) {
          final photo = _photos[index];
          return PhotoListItem(
            photo: photo,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(photo: photo),
                ),
              );
            },
          );
        },
      );
    }
  }
}
