/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['site/**/*.html', '!site/prez/**'],
  theme: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/typography'),
    require('@tailwindcss/forms'),
  ],
}

