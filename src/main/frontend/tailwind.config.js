/** @type {import('tailwindcss').Config} */
module.exports = {
  //content: ["../resources/templates/**/*.{html,js, jsp}"],
  content: [
    "./src/main/webapp/WEB-INF/jsp/**/*.jsp", // Inclure tous les fichiers JSP
    "./src/main/resources/templates/**/*.{html,js}", // Inclure les fichiers HTML/JS dans templates
    "./src/main/frontend/**/*.{html,js}"
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}

