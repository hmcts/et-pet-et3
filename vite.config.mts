import { defineConfig } from "vite";
import RubyPlugin from "vite-plugin-ruby";
import FullReload from "vite-plugin-full-reload";
import StimulusHMR from "vite-plugin-stimulus-hmr";
import path from "path";

export default defineConfig({
  build: {
    sourcemap: true,
  },
  plugins: [
    RubyPlugin(),
    FullReload(["config/routes.rb", "app/views/**/*", "app/helpers/**/*"]),
    StimulusHMR(),
    myPlugin(),
    stableApplicationCssPlugin(),
  ],
});

function stableApplicationCssPlugin() {
  return {
    name: "stable-application-css-plugin",
    apply: "build",
    generateBundle(_options, bundle) {
      const applicationCssAsset = Object.entries(bundle).find(
        ([fileName, output]) => {
          return (
            output.type === "asset" &&
            /^assets\/application-.*\.css$/.test(fileName)
          );
        },
      );

      if (!applicationCssAsset) {
        this.warn(
          "Could not find generated application CSS asset to duplicate",
        );
        return;
      }

      const [, output] = applicationCssAsset;
      this.emitFile({
        type: "asset",
        fileName: "assets/application.css",
        source: output.source,
      });
    },
  };
}

function myPlugin() {
  return {
    name: "my-plugin",
    config: (config) => {
      // Ensure resolve and alias objects exist
      config.resolve = config.resolve || {};
      config.resolve.alias = config.resolve.alias || {};

      // Add your alias
      config.resolve.alias["@govuk-assets"] = path.resolve(
        __dirname,
        "node_modules/govuk-frontend/dist/govuk/assets",
      );

      return config; // Return the modified config
    },
  };
}
