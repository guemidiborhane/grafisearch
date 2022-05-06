import { defineConfig } from "vite";
import { resolve } from "path";

// https://vitejs.dev/config/
export default defineConfig({
  clearScreen: false,
  plugins: [],
  server: {
    proxy: {
      "/api": `http://localhost:${process.env.PORT}`,
    },
  },
  build: {
    lib: {
      entry: resolve(__dirname, "assets/app.ts"),
      formats: ["es"],
      name: "app",
      fileName: "app",
    },
    rollupOptions: {
      output: { entryFileNames: "[name].js" },
    },
    outDir: resolve(__dirname, "static"),
    emptyOutDir: false,
  },
});
