user_pref("browser.startup.page", 3);
user_pref("browser.startup.couldRestoreSession.count", 2);
user_pref("browser.ctrlTab.sortByRecentlyUsed", true);
user_pref("browser.newtabpage.activity-stream.section.highlights.includeBookmarks", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includeDownloads", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includeVisited", false);
user_pref("browser.newtabpage.activity-stream.showSearch", false);
user_pref("browser.newtabpage.activity-stream.showWeather", false);
user_pref("browser.newtabpage.enabled", false);
user_pref("browser.urlbar.maxRichResults", 10);
user_pref("browser.urlbar.shortcuts.bookmarks", false);
user_pref("browser.urlbar.shortcuts.history", false);
user_pref("browser.urlbar.shortcuts.tabs", false);
user_pref("browser.urlbar.suggest.clipboard", false);
user_pref("browser.urlbar.suggest.openpage", false);
user_pref("browser.urlbar.suggest.recentsearches", false);
user_pref("browser.urlbar.suggest.topsites", false);
user_pref("browser.download.always_ask_before_handling_new_types", false);
user_pref("browser.download.useDownloadDir", true);
user_pref("browser.download.always_ask_before_handling_new_types", false);
user_pref("browser.download.viewableInternally.typeWasRegistered.avif", true);
user_pref("browser.download.viewableInternally.typeWasRegistered.jxl", true);
user_pref("browser.download.viewableInternally.typeWasRegistered.webp", true);

// History:
user_pref("privacy.sanitize.timeSpan", 0);
user_pref("privacy.sanitize.sanitizeOnShutdown", false);
user_pref("privacy.cpd.cache", true);
user_pref("privacy.cpd.history", true);
user_pref("privacy.cpd.downloads", true);
user_pref("privacy.cpd.cookies", false);
user_pref("privacy.cpd.formdata", true);
user_pref("privacy.cpd.sessions", false);
user_pref("privacy.cpd.offlineApps", false);
user_pref("privacy.cpd.openWindows", false);
user_pref("privacy.clearSiteData.cache", true);
user_pref("privacy.clearSiteData.cookiesAndStorage", false);
user_pref("privacy.clearSiteData.historyFormDataAndDownloads", true);
user_pref("privacy.clearHistory.cache", true);
user_pref("privacy.clearHistory.cookiesAndStorage", false);
user_pref("privacy.clearHistory.historyFormDataAndDownloads", true);
user_pref("privacy.clearOnShutdown.cache", true);
user_pref("privacy.clearOnShutdown.cookies", true);
user_pref("privacy.clearOnShutdown.formdata", true);
user_pref("privacy.clearOnShutdown.offlineApps", false);
user_pref("privacy.clearOnShutdown.downloads", true);
user_pref("privacy.clearOnShutdown.sessions", false);
user_pref("privacy.clearOnShutdown.history", true);
user_pref("privacy.clearOnShutdown_v2.cache", true);
user_pref("privacy.clearOnShutdown_v2.cookiesAndStorage", true);
user_pref("privacy.clearOnShutdown_v2.historyFormDataAndDownloads", true);
user_pref("privacy.clearOnShutdown_v2.browsingHistoryAndDownloads", true);

// Don't piss me off:
user_pref("app.normandy.first_run", false);
user_pref("browser.shell.didSkipDefaultBrowserCheckOnFirstRun", true);
user_pref("browser.aboutConfig.showWarning", false);
user_pref("browser.engagement.ctrlTab.has-used", true);
user_pref("browser.engagement.fxa-toolbar-menu-button.has-used", true);
user_pref("browser.firefox-view.view-count", 1);
user_pref("media.videocontrols.picture-in-picture.video-toggle.has-used", true);
user_pref("devtools.everOpened", true);
user_pref("dom.security.https_only_mode_ever_enabled", true);
user_pref("doh-rollout.doneFirstRun", true);

// Enable userChrome.css:
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// Disable the hint "is now in fullscreen"
user_pref("full-screen-api.warning.timeout", 0);

// <tab> is only for forms:
user_pref("accessibility.tabfocus", 1);

// Open tabs conveniently from the bookmarks menu:
user_pref("browser.tabs.loadBookmarksInBackground", true);
user_pref("browser.bookmarks.openInTabClosesMenu", false);
