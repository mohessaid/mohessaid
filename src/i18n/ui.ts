export const languages = {
  ar: 'العربية',
  en: 'English',
};

export const defaultLang = 'ar';

export const ui = {
  ar: {
    'nav.home': 'الرئيسية',
    'nav.projects': 'مشاريع',
    'nav.about': 'عني',
    'projects.back': 'العودة للمشاريع',
    'essays.loadMore': 'عرض المزيد',
    'status.legacy': 'أرشيف',
    'status.inprogress': 'قيد التطوير',
    'status.maintained': 'مستمر',
    'status.present': 'الآن',
  },
  en: {
    'nav.home': 'Home',
    'nav.projects': 'Projects',
    'nav.about': 'About',
    'projects.back': 'Back to projects',
    'essays.loadMore': 'Load More',
    'status.legacy': 'Legacy',
    'status.inprogress': 'In Progress',
    'status.maintained': 'Maintained',
    'status.present': 'Present',
  },
} as const;
