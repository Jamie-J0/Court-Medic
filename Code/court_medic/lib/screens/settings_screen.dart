import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _pushNotifications = true;
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: handDrawnAppBar(context, 'Setting'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _switchTile(
            title: 'Push notifications',
            value: _pushNotifications,
            onChanged: (v) => setState(() => _pushNotifications = v),
          ),
          _switchTile(
            title: 'Dark mode',
            value: _darkMode,
            onChanged: (v) => setState(() => _darkMode = v),
          ),
          const Divider(height: 32),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: Text('About Court Medic', style: AppTextStyles.label(context)),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => showAboutDialog(
              context: context,
              applicationName: 'Court Medic',
              applicationVersion: '1.0.0 (demo)',
            ),
          ),
        ],
      ),
    );
  }

  Widget _switchTile({required String title, required bool value, required ValueChanged<bool> onChanged}) {
    return SwitchListTile(
      title: Text(title, style: AppTextStyles.label(context)),
      value: value,
      activeColor: AppColors.primaryGreen,
      onChanged: onChanged,
    );
  }
}
