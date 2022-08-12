import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mi_snap_flutter/misnap_flutter.dart';
import 'package:misnap_flutter/misnap_config.dart';

class MiSnapCheckBackView extends StatefulWidget {
  const MiSnapCheckBackView({
    Key? key,
    required this.width,
    required this.height,
    required this.onPlatformViewCreated,
  }) : super(key: key);

  final double width;
  final double height;
  final MiSnapController? Function(int) onPlatformViewCreated;

  @override
  State<MiSnapCheckBackView> createState() => _CheckBackViewState();
}

class _CheckBackViewState extends State<MiSnapCheckBackView> {
  @override
  Widget build(BuildContext context) {
    final isAndroid = defaultTargetPlatform == TargetPlatform.android;
    return isAndroid ? _platformViewLink() : _uiKitView();
  }

  Widget _platformViewLink() {
    // TODO: impl android target
    return Container();
  }

  Widget _uiKitView() {
    final Map<String, dynamic> creationParams = <String, dynamic>{};
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Align(
        alignment: Alignment.centerRight,
        child: UiKitView(
          viewType: MiSnapPluginConfig.CHECK_BACK,
          onPlatformViewCreated: _createController,
          creationParams: creationParams,
          creationParamsCodec: const StandardMessageCodec(),
        ),
      ),
    );
  }

  void _createController(int id) {
    widget.onPlatformViewCreated(id);
  }
}
