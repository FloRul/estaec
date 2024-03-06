// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documents_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$completionGetterHash() => r'db82b939f2a09f3fa939a505a82f1ff7b1865279';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$CompletionGetter
    extends BuildlessAutoDisposeAsyncNotifier<Completion?> {
  late final String? completionId;

  FutureOr<Completion?> build(
    String? completionId,
  );
}

/// See also [CompletionGetter].
@ProviderFor(CompletionGetter)
const completionGetterProvider = CompletionGetterFamily();

/// See also [CompletionGetter].
class CompletionGetterFamily extends Family<AsyncValue<Completion?>> {
  /// See also [CompletionGetter].
  const CompletionGetterFamily();

  /// See also [CompletionGetter].
  CompletionGetterProvider call(
    String? completionId,
  ) {
    return CompletionGetterProvider(
      completionId,
    );
  }

  @override
  CompletionGetterProvider getProviderOverride(
    covariant CompletionGetterProvider provider,
  ) {
    return call(
      provider.completionId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'completionGetterProvider';
}

/// See also [CompletionGetter].
class CompletionGetterProvider extends AutoDisposeAsyncNotifierProviderImpl<
    CompletionGetter, Completion?> {
  /// See also [CompletionGetter].
  CompletionGetterProvider(
    String? completionId,
  ) : this._internal(
          () => CompletionGetter()..completionId = completionId,
          from: completionGetterProvider,
          name: r'completionGetterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$completionGetterHash,
          dependencies: CompletionGetterFamily._dependencies,
          allTransitiveDependencies:
              CompletionGetterFamily._allTransitiveDependencies,
          completionId: completionId,
        );

  CompletionGetterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.completionId,
  }) : super.internal();

  final String? completionId;

  @override
  FutureOr<Completion?> runNotifierBuild(
    covariant CompletionGetter notifier,
  ) {
    return notifier.build(
      completionId,
    );
  }

  @override
  Override overrideWith(CompletionGetter Function() create) {
    return ProviderOverride(
      origin: this,
      override: CompletionGetterProvider._internal(
        () => create()..completionId = completionId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        completionId: completionId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<CompletionGetter, Completion?>
      createElement() {
    return _CompletionGetterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CompletionGetterProvider &&
        other.completionId == completionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, completionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CompletionGetterRef on AutoDisposeAsyncNotifierProviderRef<Completion?> {
  /// The parameter `completionId` of this provider.
  String? get completionId;
}

class _CompletionGetterProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CompletionGetter,
        Completion?> with CompletionGetterRef {
  _CompletionGetterProviderElement(super.provider);

  @override
  String? get completionId => (origin as CompletionGetterProvider).completionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
