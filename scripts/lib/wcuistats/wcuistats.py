#!/usr/bin/env python
from os import walk, getenv
import os.path

wcui_base = os.path.normpath(getenv('WCUI_PATH', '/Users/ben/Code/Windsor/wcui_dev/src/wcui/'))

js_base = wcui_base + '/wcui/app/js/';

vendor_base = js_base + 'vendor/'
views_base = js_base + 'views/'
models_base = js_base + 'models/'
collections_base = js_base + 'collections/'

files = []
for (dirpath, dirnames, filenames) in walk(js_base):
    for _file in filenames:
        path = os.path.join(dirpath, _file)
        reference = path.replace(js_base, '')
        filename, ext = os.path.splitext(path)
        if len(ext) > 1:
            ext = ext[1:]
        files.append({
            'abspath': path,
            'ref': reference,
            'ext': ext,
        })

js_files = filter(lambda f: f['ext'] == 'js' and vendor_base not in f['abspath'], files)
js_views = filter(lambda f: views_base in f['abspath'], js_files)
js_models = filter(lambda f: models_base in f['abspath'], js_files)
js_collections = filter(lambda f: collections_base in f['abspath'], js_files)
es6_files = filter(lambda f: f['ext'] == 'es6' and vendor_base not in f['abspath'], files)
es6_views = filter(lambda f: views_base in f['abspath'], es6_files)
es6_models = filter(lambda f: models_base in f['abspath'], es6_files)
es6_collections = filter(lambda f: collections_base in f['abspath'], es6_files)
hbs_files = filter(lambda f: f['ext'] == 'hbs' and vendor_base not in f['abspath'], files)

print('\nPlain JS Files\n======================\n')
print('js count: ' + str(len(js_files)))
print('js views: ' + str(len(js_views)))
print('js models: ' + str(len(js_models)))
print('js collections: ' + str(len(js_collections)))
print('\nES6 JS Files\n======================\n')
print('es6 count: ' + str(len(es6_files)))
print('es6 views: ' + str(len(es6_views)))
print('es6 models: ' + str(len(es6_models)))
print('es6 collections: ' + str(len(es6_collections)))
print('\nHandlebars Files\n======================\n')
print('hbs count: ' + str(len(hbs_files)))

# for f in js_files:
#     print(f['ref'])
