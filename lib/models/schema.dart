import 'package:powersync/powersync.dart';
import 'package:powersync_attachments_helper/powersync_attachments_helper.dart';

const todosTable = 'todos';
const appLogsTable = 'app_logs';

Schema schema = Schema([
  const Table(todosTable, [
    Column.text('list_id'),
    Column.text('photo_id'),
    Column.text('created_at'),
    Column.text('completed_at'),
    Column.text('description'),
    Column.integer('completed'),
    Column.text('created_by'),
    Column.text('completed_by'),
  ], indexes: [
    // Index to allow efficient lookup within a list
    Index('list', [IndexedColumn('list_id')])
  ]),
  const Table('lists', [
    Column.text('created_at'),
    Column.text('name'),
    Column.text('owner_id')
  ]),
  const Table(appLogsTable, [
    Column.text('user_id'),
    Column.text('action_type'),
    Column.text('details'),
    Column.text('ip_address'),
    Column.text('device_info'),
    Column.text('created_at'),
  ], indexes: [
    // Index for efficient lookup by user
    Index('user_logs', [IndexedColumn('user_id')]),
    // Index for efficient lookup by action type
    Index('action_type', [IndexedColumn('action_type')]),
    // Index for efficient lookup by creation date
    Index('created_at', [IndexedColumn('created_at')])
  ]),
  AttachmentsQueueTable(
      attachmentsQueueTableName: defaultAttachmentsQueueTableName)
]);