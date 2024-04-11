import 'package:flashlist_server/src/generated/protocol.dart';
import 'package:flashlist_server/src/helpers/flashlist/flashlist_item_helper.dart';
import 'package:flashlist_server/src/helpers/flashlist/flashlist_permission_helper.dart';
import 'package:flashlist_server/src/helpers/user/user_helper.dart';
import 'package:serverpod/serverpod.dart';

class FlashlistHelper {
  final userHelper = UserHelper();
  final flashlistItemHelper = FlashlistItemHelper();
  final flashlistPermissionHelper = FlashlistPermissionHelper();

  /// Creates a new flashlist from the given [flashlist] object.
  /// Also creates a new permission for the currently authenticated user
  /// with access level 'owner'.
  Future<Flashlist> createFlashlist(
    Session session,
    Flashlist flashlist,
  ) async {
    try {
      final newFlashlist = await Flashlist.db.insertRow(session, flashlist);
      final userId = await userHelper.getAuthenticatedUserId(session);

      await flashlistPermissionHelper.createFlashlistPermission(
        session,
        newFlashlist.id!,
        userId!,
        'owner',
      );

      return newFlashlist;
    } catch (e) {
      throw Exception('Failed to create flashlist: $e');
    }
  }

  /// Returns all flashlists that the currently authenticated user has permission to view.
  /// Returns an empty list if the user has no permissions.
  Future<List<Flashlist>> getFlashlistsForUser(Session session) async {
    try {
      final permissionsForUser = await flashlistPermissionHelper
          .getFlashlistPermissionsForUser(session);

      if (permissionsForUser.isEmpty) {
        return [];
      } else {
        final permissionsForUserIds =
            permissionsForUser.map((e) => e.flashlistId).toSet();

        final flashlistCollection = await Flashlist.db.find(
          session,
          where: (flashlist) => flashlist.id.inSet(permissionsForUserIds),
        );

        for (final flashlist in flashlistCollection) {
          flashlist.items = await flashlistItemHelper
              .getFlashlistItemsByFlashlistId(session, flashlist.id!);

          flashlist.authors = await flashlistPermissionHelper
              .getCoAuthorsByFlashlistId(session, flashlist.id!);
        }

        return flashlistCollection;
      }
    } catch (e) {
      throw Exception('Failed to get flashlists for user: $e');
    }
  }

  /// Returns the flashlist with the given [flashlistId].
  /// Throws an exception if the user does not have permission to view the flashlist.
  /// Returns null if the flashlist does not exist.
  Future<Flashlist?> getFlashlistById(
    Session session,
    int flashlistId,
  ) async {
    try {
      final flashlist = await Flashlist.db.findFirstRow(
        session,
        where: (currentFlashlist) => currentFlashlist.id.equals(flashlistId),
      );

      return flashlist;
    } catch (e) {
      throw Exception('Failed to get flashlist by id: $e');
    }
  }

  Future<Flashlist?> getFlashlistByIdWithAttachments(
    Session session,
    int flashlistId,
  ) async {
    try {
      // Get flashlist
      final flashlist = await getFlashlistById(session, flashlistId);

      if (flashlist == null) {
        throw Exception('Flashlist does not exist');
      }

      // Attach items and co-authors
      flashlist.items = await flashlistItemHelper
          .getFlashlistItemsByFlashlistId(session, flashlist.id!);

      flashlist.authors = await flashlistPermissionHelper
          .getCoAuthorsByFlashlistId(session, flashlist.id!);

      return flashlist;
    } catch (e) {
      throw Exception('Failed to get flashlist by id with attachments: $e');
    }
  }

  /// Deletes the flashlist with the given [flashlistId].
  /// Throws an exception if the user does not have permission to delete the flashlist.
  Future<bool> deleteFlashlist(
    Session session,
    int flashlistId,
  ) async {
    try {
      final accessLevel = await flashlistPermissionHelper
          .getUserAccessLevelByFlashlistId(session, flashlistId);

      if (accessLevel == null || accessLevel != 'owner') {
        throw Exception('User cannot delete Flashlist');
      }

      final flashlistToDelete = await getFlashlistById(session, flashlistId);

      if (flashlistToDelete == null) {
        throw Exception('Flashlist does not exist');
      }

      await flashlistPermissionHelper.deletePermissionsForFlashlist(
        session,
        flashlistId,
      );

      await Flashlist.db.deleteRow(
        session,
        flashlistToDelete,
      );

      return true;
    } catch (e) {
      throw Exception('Failed to delete flashlist: $e');
    }
  }

  /// Updates the flashlist with [id] matching the [update] object.
  /// Throws an exception if the user does not have permission to update the flashlist.
  /// Returns the updated flashlist if successful.
  Future<Flashlist> updateFlashlist(
    Session session,
    UpdateFlashlist update,
  ) async {
    try {
      final flashlistToUpdate = await getFlashlistById(session, update.id);

      return await Flashlist.db.updateRow(
        session,
        flashlistToUpdate!.copyWith(
          title: update.title,
          color: update.color,
          updatedAt: DateTime.now(),
        ),
      );
    } catch (e) {
      throw Exception('Failed to update flashlist: $e');
    }
  }
}
