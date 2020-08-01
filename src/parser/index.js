var parser = require("jison!./magic.jison");

export default function (input) {
  return parser.parse(input);
};
