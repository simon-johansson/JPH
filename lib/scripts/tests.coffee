JPH = {}
JPH.rand = new (require('./Rand.coffee'))

for key, val of JPH
  global[key] = -> JPH[key].main.apply(JPH[key], arguments)

console.log global.rand(5, 10)
console.log global.rand(5, 10)
console.log global.rand(5, 10)

