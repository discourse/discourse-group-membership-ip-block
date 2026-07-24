import { withPluginApi } from "discourse/lib/plugin-api";

export default {
  name: "group-custom-field",
  initialize() {
    withPluginApi((api) => {
      api.addModelField("group", "custom_fields", {
        defaultValue: () => ({}),
      });
      api.addModelSaveProperty("group", "custom_fields");
    });
  },
};
