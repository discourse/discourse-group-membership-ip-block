import Component from "@ember/component";
import { classNames, tagName } from "@ember-decorators/component";
import { i18n } from "discourse-i18n";
import ValueList from "admin/components/value-list";

@tagName("div")
@classNames("group-edit-outlet", "field-container")
export default class FieldContainer extends Component {
  <template>
    <div class="control-group ip-blocks-list">
      <label class="control-label" for="ip_blocks_list">
        {{i18n "admin.groups.ip_blocks_list.label"}}
      </label>
      <ValueList
        @values={{this.group.custom_fields.ip_blocks_list}}
        @name="ip_blocks_list"
        class="input-xxlarge"
      />
      <div class="desc">{{i18n "admin.groups.ip_blocks_list.description"}}</div>
    </div>
  </template>
}
