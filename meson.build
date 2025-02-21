project(
  'set_wm_class',
  'c',
  version: '0.1.1.alpha',
  meson_version: '>= 0.64.0',
  default_options: [
    'warning_level=2',
    'werror=false',
    'c_std=gnu11',
  ],
)

cflags = [
  '-Wno-unused-parameter',
  # '-Wno-unused-variable',
  '-Wno-unused-function',
  '-Wno-unused-result',
  # '-Wno-missing-field-initializers',
]

cc = meson.get_compiler('c')
add_project_arguments(cflags, language: 'c')

name = meson.project_name()
developer_name = 'Roberto Morrison'

package_version = meson.project_version()

deps = [
  dependency('x11'),
]

inc = include_directories('.')

src = files('set_wm_class.c')

executable(
  name,
  src,
  include_directories: inc,
  dependencies: deps,
  install: true,
)
