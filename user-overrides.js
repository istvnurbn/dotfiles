/* Disable translations ***/
user_pref("browser.translations.automaticallyPopup", false);
user_pref("browser.translations.enable", false);
user_pref("browser.translations.panelShown", false);

/* Weed out Pocket ***/
user_pref("extensions.pocket.enabled", false);
user_pref("extensions.pocket.refresh.emailButton.enabled", false);
user_pref("extensions.pocket.refresh.hideRecentSaves.enabled", false);
user_pref("extensions.pocket.showHome", false);
user_pref("extensions.pocket.bffRecentSaves", false);
user_pref("browser.urlbar.suggest.pocket", false);
user_pref("browser.newtabpage.activity-stream.discoverystream.saveToPocketCard.enabled", false);
user_pref("browser.newtabpage.activity-stream.discoverystream.sendToPocket.enabled", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includePocket", false);

/* Use a decent password manager ;) ***/
user_pref("signon.rememberSignons", false);
