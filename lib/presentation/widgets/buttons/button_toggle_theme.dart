import 'package:flutter/material.dart';
import 'package:wordup/domain/domain.dart';
import '../../../presentation/providers/provider_theme.dart';

class ToggleThemeButton extends StatelessWidget {
  const ToggleThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = ThemeProvider.watch(context);
    final isDark = provider.currentTheme.id == 'dark';

    void setTheme(AppThemeData theme){
      if(provider.currentTheme != theme){
        provider.setTheme(theme);
      }
    }

    final width = 70.0;
    final height = 26.0;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Color.lerp(theme.colorScheme.surface, Colors.white, 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        children: [
          // Selected indicator
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: isDark ? 0 : width/2,
            child: Container(
              width: width/2,
              height: height,
              decoration: BoxDecoration(
                color: isDark ? Color(0xffbe4ff7) : theme.colorScheme.secondary,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(isDark ? 4 : 0),
                  right: Radius.circular(isDark ? 0 : 4),
                ),
              ),
            ),
          ),
          // Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => setTheme(DarkTheme()),
                child: Icon(
                  Icons.nightlight_outlined,
                  size: 20,
                  color: isDark ? Colors.white : null,
                ),
              ),
              VerticalDivider(width: 0, color: Colors.transparent),
              GestureDetector(
                onTap: () => setTheme(LightTheme()),
                child: Icon(
                  Icons.wb_sunny_outlined,
                  size: 20,
                  color: isDark ? Colors.white.withAlpha(220) : Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
