import 'package:flclashx/common/common.dart';
import 'package:flclashx/models/models.dart';
import 'package:flclashx/providers/config.dart';
import 'package:flclashx/providers/state.dart';
import 'package:flclashx/state.dart';
import 'package:flclashx/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

/// Settings page for the auto-select (url-test) group: name, check interval
/// and the set of servers from the current profile that participate in the
/// automatic lowest-latency pick.
class AutoSelectView extends ConsumerStatefulWidget {
  const AutoSelectView({super.key});

  @override
  ConsumerState<AutoSelectView> createState() => _AutoSelectViewState();
}

class _AutoSelectViewState extends ConsumerState<AutoSelectView> {
  late AutoSelectProps _props;
  bool _dirty = false;

  @override
  void initState() {
    super.initState();
    final profile = globalState.config.currentProfile;
    _props = profile?.autoSelect ?? const AutoSelectProps();
  }

  List<String> _getAvailableServers(List<Group> groups) {
    final servers = <String>{};
    for (final group in groups) {
      for (final proxy in group.all) {
        final name = proxy.name;
        if (group.name != name) {
          servers.add(name);
        }
      }
    }
    servers.removeAll(const ["DIRECT", "REJECT", "REJECT-DROP", "PASS", "COMPATIBLE"]);
    return servers.toList()..sort();
  }

  Future<void> _apply(AutoSelectProps props) async {
    final profile = globalState.config.currentProfile;
    if (profile == null) return;
    setState(() {
      _props = props;
      _dirty = true;
    });
  }

  Future<void> _save() async {
    final profile = globalState.config.currentProfile;
    if (profile == null) return;
    final name = _props.name.trim().isEmpty ? "⚡ Auto" : _props.name.trim();
    final props = _props.copyWith(name: name);
    ref.read(profilesProvider.notifier).setProfile(
          profile.copyWith(
            autoSelect: props,
            // A stale selection can point at a removed server; the injected
            // group filters those out anyway, but drop them here to keep the
            // saved state clean.
            selectedMap: profile.selectedMap,
          ),
        );
    setState(() {
      _dirty = false;
    });
    // Re-setup the core config so the injected group appears immediately.
    globalState.appController.setupClashConfigDebounce();
  }

  @override
  Widget build(BuildContext context) {
    final groups = ref.watch(currentGroupsStateProvider).value;
    final availableServers = _getAvailableServers(groups);
    final servers = _props.servers;

    return CommonScaffold(
      title: appLocalizations.autoSelect,
      actions: [
        IconButton(
          tooltip: appLocalizations.save,
          onPressed: _dirty ? _save : null,
          icon: const Icon(Icons.save_outlined),
        ),
      ],
      body: generateListView(
        [
          ListItem.switchItem(
            leading: const Icon(Icons.bolt),
            title: Text(appLocalizations.autoSelect),
            subtitle: Text(appLocalizations.autoSelectDesc),
            delegate: SwitchDelegate(
              value: _props.enable,
              onChanged: (value) => _apply(_props.copyWith(enable: value)),
            ),
          ),
          ListItem.input(
            leading: const Icon(Icons.abc),
            title: Text(appLocalizations.autoSelectName),
            delegate: InputDelegate(
              title: appLocalizations.autoSelectName,
              value: _props.name,
              resetValue: "⚡ Auto",
              onChanged: (value) => _apply(
                _props.copyWith(name: value ?? "⚡ Auto"),
              ),
            ),
          ),
          ListItem.input(
            leading: const Icon(Icons.timer_outlined),
            title: Text(appLocalizations.autoSelectInterval),
            delegate: InputDelegate(
              title: appLocalizations.autoSelectInterval,
              value: "${_props.interval}",
              suffixText: "s",
              resetValue: "300",
              validator: (value) {
                final v = int.tryParse(value ?? "");
                if (v == null || v < 60) {
                  return Intl.message(
                    "Minimum 60 seconds",
                    name: "autoSelectIntervalMin",
                  );
                }
                return null;
              },
              onChanged: (value) {
                final v = int.tryParse(value ?? "");
                if (v != null && v >= 60) {
                  _apply(_props.copyWith(interval: v));
                }
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            width: double.maxFinite,
            child: Text(
              appLocalizations.autoSelectServers,
              style: context.textTheme.titleSmall?.copyWith(
                color: context.colorScheme.primary,
              ),
            ),
          ),
          if (availableServers.isEmpty)
            ListItem(
              title: Text(appLocalizations.autoSelectServersEmpty),
              subtitle: Text(appLocalizations.autoSelectProfileOnly),
            )
          else ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () => _apply(
                      _props.copyWith(servers: availableServers),
                    ),
                    child: Text(appLocalizations.autoSelectSelectAll),
                  ),
                  TextButton(
                    onPressed: () => _apply(_props.copyWith(servers: [])),
                    child: Text(appLocalizations.autoSelectDeselectAll),
                  ),
                ],
              ),
            ),
            ...availableServers.map(
              (server) => ListItem.checkbox(
                key: ValueKey(server),
                title: Text(server),
                delegate: CheckboxDelegate(
                  value: servers.contains(server),
                  onChanged: (checked) {
                    final next = Set<String>.from(servers);
                    if (checked ?? false) {
                      next.add(server);
                    } else {
                      next.remove(server);
                    }
                    _apply(_props.copyWith(servers: next.toList()));
                  },
                ),
              ),
            ),
          ],
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              appLocalizations.autoSelectProfileOnly,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
