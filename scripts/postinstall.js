'use strict'

const path = require('path')
const fs = require('fs-extra')

fs.copySync(path.join(__dirname, '..', 'prisma'), path.join(__dirname, '..', '..', '..', 'prisma'), {
  overwrite: true
})
