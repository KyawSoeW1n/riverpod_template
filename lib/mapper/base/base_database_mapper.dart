abstract class BaseDatabaseMapper<T, V> {
  V mapFromDatabase(T data);

  T mapToEntity(V data);
}
