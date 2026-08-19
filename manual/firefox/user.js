user_pref("browser.startup.page", 3);

user_pref("intl.locale.requested", "ru");
user_pref("intl.accept_languages", "ru, en-us, en");
user_pref("intl.regional_prefs.use_os_locales", true);

user_pref("browser.download.alwaysOpenPanel", false);
user_pref("browser.download.start_downloads_in_tmp_dir", true);
user_pref("browser.helperApps.deleteTempFileOnExit", true);

user_pref("media.eme.enabled", true);

user_pref("browser.newtabpage.activity-stream.showSearch", false);
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.highlights", false);

user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);

user_pref("browser.urlbar.trending.featureGate", false);
user_pref("browser.urlbar.suggest.history", false);
user_pref("browser.urlbar.suggest.openpage", false);
user_pref("browser.urlbar.suggest.recentsearches", false);
user_pref("browser.urlbar.suggest.quickactions", false);

user_pref("privacy.globalprivacycontrol.enabled", true);
user_pref("signon.rememberSignons", false);
user_pref("extensions.formautofill.creditCards.enabled", false);
user_pref("extensions.formautofill.addresses.enabled", false);
user_pref("dom.security.https_only_mode", true);
user_pref("network.trr.mode", 5);

user_pref("privacy.sanitize.timeSpan", 0);

user_pref("privacy.clearSiteData.browsingHistoryAndDownloads", true);
user_pref("privacy.clearSiteData.cookiesAndStorage", false);
user_pref("privacy.clearSiteData.cache", true);
user_pref("privacy.clearSiteData.formdata", true);

user_pref("privacy.clearHistory.browsingHistoryAndDownloads", true);
user_pref("privacy.clearHistory.cookiesAndStorage", false);
user_pref("privacy.clearHistory.cache", true);
user_pref("privacy.clearHistory.formdata", true);

user_pref("privacy.sanitize.sanitizeOnShutdown", true);
user_pref("privacy.clearOnShutdown_v2.browsingHistoryAndDownloads", false);
user_pref("privacy.clearOnShutdown_v2.cookiesAndStorage", false);
user_pref("privacy.clearOnShutdown_v2.cache", false);
user_pref("privacy.clearOnShutdown_v2.formdata", true);
user_pref("privacy.clearOnShutdown_v2.downloads", true);

user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.usage.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("toolkit.telemetry.archive.enabled", false);

user_pref("browser.ctrlTab.sortByRecentlyUsed", true);
user_pref("browser.ml.linkPreview.enabled", false);

// Don't piss me off.
user_pref("permissions.default.desktop-notification", 2);
user_pref("browser.shell.checkDefaultBrowser", false);
user_pref("browser.aboutConfig.showWarning", false);
user_pref("full-screen-api.warning.timeout", 0);

// <Tab> focuses form controls only.
user_pref("accessibility.tabfocus", 1);

// Open bookmarks in background tabs without closing the menu.
user_pref("browser.tabs.loadBookmarksInBackground", true);
user_pref("browser.bookmarks.openInTabClosesMenu", false);

// `userChrome.css` && `userContent.css`.
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
