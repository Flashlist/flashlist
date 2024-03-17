import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flashlist_flutter/src/utils/context_helper.dart';

class AddFlashlistIcon extends StatelessWidget {
  const AddFlashlistIcon({
    super.key,
    this.width = 24,
    this.height = 24,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    String svgString = '''
      <svg xmlns="http://www.w3.org/2000/svg" fill="#${isDarkThemeOf(context) ? '000000' : 'ffffff'}"  xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Layer_1" x="0px" y="0px" style="enable-background:new 0 0 841.89 595.28;" xml:space="preserve" viewBox="171.18 92.74 166.34 160.13">
        <g>
          <g>
            <polygon class="st0" points="212.53,230.11 171.18,230.11 171.18,92.74 212.53,92.74 212.53,103.11 181.54,103.11 181.54,219.75     212.53,219.75   "/>
          </g>
          <polygon class="st0" points="258.54,154.1 260.43,97.2 236,135.62 216.88,168.76 241.43,168.76 239.54,225.66 263.96,187.23    283.09,154.1  "/>
          <polygon class="st0" points="318.37,171.53 328.73,171.53 328.73,92.74 287.37,92.74 287.37,103.11 318.37,103.11  "/>
          <polygon class="st0" points="315.31,220.66 315.31,198.44 305.31,198.44 305.31,220.66 283.09,220.66 283.09,230.66 305.31,230.66    305.31,252.87 315.31,252.87 315.31,230.66 337.52,230.66 337.52,220.66  "/>
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
