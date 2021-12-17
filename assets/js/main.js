const sidebar = document.querySelector('aside.sidebar');
const menuTrigger = document.querySelector('button.menu-trigger');
const menuTriggerClose = document.querySelector('button.menu-trigger-close');
const menuOpacity = document.querySelector('div.menu-overlay');

const toggleSidebar = () => {
  if (sidebar.classList.contains('!translate-x-0')) {
    sidebar.classList.remove('!translate-x-0')
    menuOpacity.classList.add('hidden')
  } else {
    sidebar.classList.add('!translate-x-0')
    menuOpacity.classList.remove('hidden')
  }
}

menuTrigger.addEventListener('click', toggleSidebar)
menuTriggerClose.addEventListener('click', toggleSidebar)
menuOpacity.addEventListener('click', toggleSidebar)