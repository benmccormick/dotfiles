function ensure({ test, value }, data, message) {
  const result = test(data);
  if (!result) {
    throw new Error(message || data);
  }
}

function Length(value) {
  return {
    value: value.length,
    test: (length) => {
      return value.length === length;
    },
  };
}


function Exists(value) {
  return {
    value,
    test: () => value !== undefined,
  };
}

module.exports = {
  ensure: ensure,
  Length: Length,
  Exists: Exists,
};
