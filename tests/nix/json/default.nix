{
  name = "json";
  expected = ./expected.json;
  args = {};
  request = {
    format = "json";
    output = "test.json";
    data = {
      field1 = "value1";
      field2 = 42;
      field3 = false;
    };
  };
}
