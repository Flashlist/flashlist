import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flashlist_flutter/src/utils/context_helper.dart';

class LogoIcon extends StatelessWidget {
  const LogoIcon({
    super.key,
    this.width = 22,
    this.height = 22,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    String svgString = '''
      <svg xmlns="http://www.w3.org/2000/svg" fill="#${isDarkThemeOf(context) ? 'ffffff' : '000000'}" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Layer_1" x="0px" y="0px" style="enable-background:new 0 0 841.89 595.28;" xml:space="preserve" viewBox="170.14 228.64 157.55 137.37">
        <g>
          <g>
            <g>
              <polygon  points="211.49,366.01 170.14,366.01 170.14,228.64 211.49,228.64 211.49,239.01 180.5,239.01 180.5,355.65      211.49,355.65    "/>
            </g>
            <g>
              <polygon  points="327.69,366.01 286.33,366.01 286.33,355.65 317.33,355.65 317.33,239.01 286.33,239.01 286.33,228.64      327.69,228.64    "/>
            </g>
            <polygon  points="257.5,290 259.39,233.1 234.97,271.52 215.84,304.66 240.39,304.66 238.5,361.56 262.92,323.13 282.05,290   "/>
          </g>
        </g>
      </svg>
    ''';

    return Container(
      margin: const EdgeInsets.only(top: 3, left: 3),
      child: SvgPicture.string(
        svgString,
        width: width,
        height: height,
      ),
    );
  }
}
