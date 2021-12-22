---
title: 3. Primary Menu
date: 2021-12-18
---

The sidebar of the theme uses the `main` menu. Add all the items for your sidebar navigation in this menu.

// config.toml

```toml
[menu]
[[menu.main]]
  name = 'Home'
  url = '/'
  weight = 1
[[menu.main]]
  name = 'Articles'
  url = '/articles'
  weight = 2
```

- name → Title of the menu item
- url → Path to navigate
- weight → Used to decide the order of menu items

If the link points to an external website, the external icon is already displayed.

Using JSON or YAML formats? Check out the [menu](https://gohugo.io/content-management/menus/#simple) documentation.

→ [Configure Social Menu](/articles/social-menu)