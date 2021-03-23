Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id BA71A529C8
	for <meta-arago@arago-project.org>;
	Tue, 23 Mar 2021 21:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7A54F40BFF;
	Tue, 23 Mar 2021 21:15:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 8DfOtEqaTFSz; Tue, 23 Mar 2021 21:15:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5BF2640C29;
	Tue, 23 Mar 2021 21:15:15 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 3AC85174559;
	Tue, 23 Mar 2021 17:15:14 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 23 Mar 2021 17:15:06 -0400
Message-Id: <1616534107-46438-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616534107-46438-1-git-send-email-denis@denix.org>
References: <1616534107-46438-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master][PATCH 3/4] chromium: fix building of version 75 against more recent pulseaudio
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Mar 2021 21:15:00 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

Upstream-Status: Inappropriate [old chromium against new pulseaudio]

While chromium 75 is quite old, it was the last one that built with gcc and
did not require clang. To get this working, browser-layer has to be pinned
down to commit 5f365ef0f842ba4651efe88787cf9c63bc8b6cb3.

Since that old snapshot was before dunfell was out, need to mark browser
layer as compatible with dunfell in LAYERSERIES_COMPAT_browser-layer in
corresponding conf/layer.conf

Newer versions of chromium require clang from meta-clang layer and there
are still some issues with building that combo against meta-arago.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../chromium/chromium-ozone-wayland/pulse.patch    | 47 ++++++++++++++++++++++
 .../chromium/chromium-ozone-wayland_%.bbappend     |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland/pulse.patch

diff --git a/meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland/pulse.patch b/meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland/pulse.patch
new file mode 100644
index 0000000..d88220b
--- /dev/null
+++ b/meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland/pulse.patch
@@ -0,0 +1,47 @@
+diff -pNur chromium-77.0.3865.75-orig/media/audio/pulse/pulse.sigs chromium-77.0.3865.75/media/audio/pulse/pulse.sigs
+--- chromium-77.0.3865.75-orig/media/audio/pulse/pulse.sigs	2019-09-09 23:55:20.000000000 +0200
++++ chromium-77.0.3865.75/media/audio/pulse/pulse.sigs	2019-09-20 20:37:43.872670594 +0200
+@@ -24,11 +24,11 @@ pa_operation* pa_context_get_source_info
+ pa_operation* pa_context_get_source_info_by_name(pa_context* c, const char* name, pa_source_info_cb_t cb, void *userdata);
+ pa_operation* pa_context_get_source_info_list(pa_context* c, pa_source_info_cb_t cb, void* userdata);
+ pa_operation* pa_context_get_sink_info_list(pa_context* c, pa_sink_info_cb_t cb, void* userdata);
+-pa_context_state_t pa_context_get_state(pa_context* c);
++pa_context_state_t pa_context_get_state(const pa_context* c);
+ pa_context* pa_context_new(pa_mainloop_api* mainloop, const char* name);
+ pa_operation* pa_context_set_source_volume_by_index(pa_context* c, uint32_t idx, const pa_cvolume* volume, pa_context_success_cb_t cb, void* userdata);
+ void pa_context_set_state_callback(pa_context* c, pa_context_notify_cb_t cb, void* userdata);
+-pa_operation_state_t pa_operation_get_state(pa_operation* o);
++pa_operation_state_t pa_operation_get_state(const pa_operation* o);
+ void pa_context_unref(pa_context* c);
+ void pa_operation_unref(pa_operation* o);
+ int pa_stream_begin_write(pa_stream* p, void** data, size_t* nbytes);
+@@ -38,23 +38,23 @@ pa_operation* pa_stream_cork(pa_stream*
+ int pa_stream_disconnect(pa_stream* s);
+ int pa_stream_drop(pa_stream *p);
+ pa_operation* pa_stream_flush(pa_stream* s, pa_stream_success_cb_t cb, void* userdata);
+-uint32_t pa_stream_get_device_index(pa_stream* s);
++uint32_t pa_stream_get_device_index(const pa_stream* s);
+ int pa_stream_get_latency(pa_stream* s, pa_usec_t* r_usec, int* negative);
+-pa_stream_state_t pa_stream_get_state(pa_stream* p);
++pa_stream_state_t pa_stream_get_state(const pa_stream* p);
+ pa_stream* pa_stream_new(pa_context*  c, const char*  name, const pa_sample_spec*  ss, const pa_channel_map *  map);
+ pa_stream* pa_stream_new_with_proplist(pa_context* c, const char* name, const pa_sample_spec* ss, const pa_channel_map* map, pa_proplist* p);
+ pa_proplist* pa_proplist_new(void);
+-int pa_proplist_contains(pa_proplist* p, const char* key);
++int pa_proplist_contains(const pa_proplist* p, const char* key);
+ void pa_proplist_free(pa_proplist* p);
+-const char* pa_proplist_gets(pa_proplist* p, const char* key);
++const char* pa_proplist_gets(const pa_proplist* p, const char* key);
+ int pa_proplist_sets(pa_proplist* p, const char* key, const char* value);
+-size_t pa_stream_readable_size(pa_stream *p);
++size_t pa_stream_readable_size(const pa_stream *p);
+ int pa_stream_peek(pa_stream* p, const void** data, size_t* nbytes);
+ void pa_stream_set_read_callback(pa_stream* p, pa_stream_request_cb_t cb, void* userdata);
+ void pa_stream_set_state_callback(pa_stream* s, pa_stream_notify_cb_t cb, void* userdata);
+ int pa_stream_write(pa_stream* p, const void* data, size_t nbytes, pa_free_cb_t free_cb, int64_t offset, pa_seek_mode_t seek);
+ void pa_stream_set_write_callback(pa_stream *p, pa_stream_request_cb_t cb, void *userdata);
+ void pa_stream_unref(pa_stream* s);
+-int pa_context_errno(pa_context *c);
++int pa_context_errno(const pa_context *c);
+ const char* pa_strerror(int error);
+ pa_cvolume* pa_cvolume_set(pa_cvolume* a, unsigned  channels, pa_volume_t v);
diff --git a/meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend b/meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend
index 5548b2c..e1600e8 100644
--- a/meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend
+++ b/meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend
@@ -5,3 +5,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 DEPENDS_remove = "virtual/libgl"
 
 SRC_URI += "file://chromium-75.0.3770.80-SIOCGSTAMP.patch"
+SRC_URI += "file://pulse.patch"
-- 
2.7.4


