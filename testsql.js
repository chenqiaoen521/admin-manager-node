var Sequelize = require('sequelize');
 const sequelize = new Sequelize('yongdian', 'root', '111111', {
    host: 'localhost', // 数据库地址
    dialect: 'mysql', // 指定连接的数据库类型
    pool: {
        max: 10, // 连接池中最大连接数量
        min: 0, // 连接池中最小连接数量
        idle: 10000 // 如果一个线程 10 秒钟内没有被使用过的话，那么就释放线程
    }
})

sequelize
  .authenticate()
  .then(() => {
const Role2 = sequelize.define('role2', {
  roleId: {
    type: Sequelize.INTEGER,
    field: 'role_id',
    primaryKey: true,
    autoIncrement: true
  },
  roleCode: {
    type: Sequelize.STRING,
    field: 'role_code'
  },
  roleName: {
    type: Sequelize.STRING,
    field: 'role_name'
  },
  memo: {
    type: Sequelize.STRING,
    field: 'memo'
  }
}, {
  freezeTableName: true // Model 对应的表名将与model名相同
})

const Dept = sequelize.define('yd_dept', {
  departmentId: {
    field: 'department_id',
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  departmentCode: {
    field: 'department_code',
    type: Sequelize.STRING,
    unique: true
  },
  departmentName: {
    field: 'department_name',
    type: Sequelize.STRING
  },
  parentId: {
    field: 'parent_id',
    type: Sequelize.INTEGER,
    defaultValue: 0
  },
  isChild: {
    field: 'is_child',
    type: Sequelize.INTEGER,
    defaultValue: 0 // 是否有下级0:没有，1：有
  }
})

const Permission = sequelize.define('yd_perm', {
  permissionId: {
    field: 'permission_id',
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  permissionCode: {
    field: 'permission_code',
    type: Sequelize.STRING,
    unique: true
  },
  permissionUri: {
    field: 'permission_uri',
    type: Sequelize.STRING,
    unique: true
  },
  permissionName: {
    field: 'permission_name',
    type: Sequelize.STRING
  },
  columnId: {
    field: 'column_id',
    type: Sequelize.INTEGER
  }
})
const User = sequelize.define('users', {
  id: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  username: {
    type: Sequelize.STRING,
    unique: true
  },
  password: {
    type: Sequelize.STRING
  },
  status: {
    type: Sequelize.BOOLEAN, allowNull: false, defaultValue: true
  }
})
/*Permission.belongsToMany(Role2, {through: 'RolePermission', foreignKey: 'permission_id'});
Role2.belongsToMany(Permission, {through: 'RolePermission', foreignKey: 'role_id'});
User.belongsToMany(Role2, {through: 'UserRole', foreignKey: 'id'});
Role2.belongsToMany(User, {through: 'UserRole', foreignKey: 'role_id'});*/

User.belongsToMany(Dept, {through: 'UserDept', foreignKey: 'id'});
Dept.belongsToMany(User, {through: 'UserDept', foreignKey: 'department_id'});
sequelize.sync();
  }).catch(err => {
  	console.log('-----------------error -----------------');
    console.error('Unable to connect to the database:', err);
  });
