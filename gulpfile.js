const gulp = require('gulp'),
sequence = require('gulp-sequence'),
nodemon = require('gulp-nodemon')

// nodemon 的配置  
var nodemonConfig = {  
    script : 'app.js',  
    env : {  
       "NODE_ENV": "development"  
    }  
}


gulp.task('server', function() {
	nodemon(nodemonConfig)
})

gulp.task('dev', sequence(['server']))