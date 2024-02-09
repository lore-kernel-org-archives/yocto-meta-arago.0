Return-Path: <detheridge@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 561DCC4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 18:56:48 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.20646.1707505005584270318
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Feb 2024 10:56:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hRbQU2bm;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: detheridge@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 419Iuivs058201;
	Fri, 9 Feb 2024 12:56:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707505004;
	bh=7pU5LRKzLwop+pfb5lSnmcmOKcaj4JC7BU4UzgqSUdQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hRbQU2bmmdZXbkJzvuvGoTsz5HrqPHzsaBPexz5KyuttCTeCbYFEGSxpoAYCBObtE
	 wkKVRWJohclgj4C3/xZHerA2Oj9MI6fdqUWgHWpJguTJ4RR0L4zffCzcs4zNF5k5uL
	 2KL/ClR/OpW9LLYlvcbI2YKyzrtIRrgKzq+O4Ad4=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 419IuifB119675
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Feb 2024 12:56:44 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Feb 2024 12:56:44 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Feb 2024 12:56:44 -0600
Received: from uda0867391.dal.design.ti.com (uda0867391.dhcp.ti.com [128.247.81.32])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 419IugLe047828;
	Fri, 9 Feb 2024 12:56:44 -0600
From: <detheridge@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
        <denys@konsulko.com>
CC: <rs@ti.com>, <detheridge@ti.com>
Subject: [meta-arago][kirkstone][PATCHv2 1/4] meta-arago: distro: chromium: remove old dynamic layer
Date: Fri, 9 Feb 2024 12:56:32 -0600
Message-ID: <20240209185635.32675-2-detheridge@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20240209185635.32675-1-detheridge@ti.com>
References: <20240209185635.32675-1-detheridge@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Feb 2024 18:56:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15155

From: Darren Etheridge <detheridge@ti.com>

Cleaning up left over chromium stuff that I suspect won't even build
with kirkstone.  The meta-browser layer has moved on considerably and my
next patches will replace this with GPU support on IMG Rogue based GPU
devices within Chromium v111.

Signed-off-by: Darren Etheridge <detheridge@ti.com>
---
 meta-arago-distro/conf/layer.conf             |  2 -
 .../chromium-75.0.3770.80-SIOCGSTAMP.patch    | 15 ------
 .../chromium-ozone-wayland/pulse.patch        | 47 -------------------
 .../chromium-ozone-wayland_%.bbappend         |  8 ----
 4 files changed, 72 deletions(-)
 delete mode 100644 meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch
 delete mode 100644 meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland/pulse.patch
 delete mode 100644 meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend

diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
index cf6ccbec..40b0f5bb 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -24,11 +24,9 @@ LAYERDEPENDS_meta-arago-distro = " \
 # clang-layer
 
 LAYERRECOMMENDS_meta-arago-distro = " \
-    browser-layer \
 "
 
 BBFILES_DYNAMIC += " \
-    browser-layer:${LAYERDIR}/dynamic-layers/browser-layer/recipes*/*/*.bbappend \
 "
 
 BB_DANGLINGAPPENDS_WARNONLY = "true"
diff --git a/meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch b/meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch
deleted file mode 100644
index 0ef1e7f1..00000000
--- a/meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-diff -up chromium-75.0.3770.80/third_party/webrtc/rtc_base/physical_socket_server.h.SIOCGSTAMP chromium-75.0.3770.80/third_party/webrtc/rtc_base/physical_socket_server.h
---- chromium-75.0.3770.80/third_party/webrtc/rtc_base/physical_socket_server.h.SIOCGSTAMP	2019-06-06 10:04:57.050403639 -0400
-+++ chromium-75.0.3770.80/third_party/webrtc/rtc_base/physical_socket_server.h	2019-06-06 10:06:03.975121688 -0400
-@@ -16,6 +16,11 @@
- #define WEBRTC_USE_EPOLL 1
- #endif
- 
-+// for SIOCGSTAMP in Linux 5.2
-+#if defined(WEBRTC_LINUX)
-+#include <linux/sockios.h>
-+#endif
-+
- #include <memory>
- #include <set>
- #include <vector>
diff --git a/meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland/pulse.patch b/meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland/pulse.patch
deleted file mode 100644
index d88220b3..00000000
--- a/meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland/pulse.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-diff -pNur chromium-77.0.3865.75-orig/media/audio/pulse/pulse.sigs chromium-77.0.3865.75/media/audio/pulse/pulse.sigs
---- chromium-77.0.3865.75-orig/media/audio/pulse/pulse.sigs	2019-09-09 23:55:20.000000000 +0200
-+++ chromium-77.0.3865.75/media/audio/pulse/pulse.sigs	2019-09-20 20:37:43.872670594 +0200
-@@ -24,11 +24,11 @@ pa_operation* pa_context_get_source_info
- pa_operation* pa_context_get_source_info_by_name(pa_context* c, const char* name, pa_source_info_cb_t cb, void *userdata);
- pa_operation* pa_context_get_source_info_list(pa_context* c, pa_source_info_cb_t cb, void* userdata);
- pa_operation* pa_context_get_sink_info_list(pa_context* c, pa_sink_info_cb_t cb, void* userdata);
--pa_context_state_t pa_context_get_state(pa_context* c);
-+pa_context_state_t pa_context_get_state(const pa_context* c);
- pa_context* pa_context_new(pa_mainloop_api* mainloop, const char* name);
- pa_operation* pa_context_set_source_volume_by_index(pa_context* c, uint32_t idx, const pa_cvolume* volume, pa_context_success_cb_t cb, void* userdata);
- void pa_context_set_state_callback(pa_context* c, pa_context_notify_cb_t cb, void* userdata);
--pa_operation_state_t pa_operation_get_state(pa_operation* o);
-+pa_operation_state_t pa_operation_get_state(const pa_operation* o);
- void pa_context_unref(pa_context* c);
- void pa_operation_unref(pa_operation* o);
- int pa_stream_begin_write(pa_stream* p, void** data, size_t* nbytes);
-@@ -38,23 +38,23 @@ pa_operation* pa_stream_cork(pa_stream*
- int pa_stream_disconnect(pa_stream* s);
- int pa_stream_drop(pa_stream *p);
- pa_operation* pa_stream_flush(pa_stream* s, pa_stream_success_cb_t cb, void* userdata);
--uint32_t pa_stream_get_device_index(pa_stream* s);
-+uint32_t pa_stream_get_device_index(const pa_stream* s);
- int pa_stream_get_latency(pa_stream* s, pa_usec_t* r_usec, int* negative);
--pa_stream_state_t pa_stream_get_state(pa_stream* p);
-+pa_stream_state_t pa_stream_get_state(const pa_stream* p);
- pa_stream* pa_stream_new(pa_context*  c, const char*  name, const pa_sample_spec*  ss, const pa_channel_map *  map);
- pa_stream* pa_stream_new_with_proplist(pa_context* c, const char* name, const pa_sample_spec* ss, const pa_channel_map* map, pa_proplist* p);
- pa_proplist* pa_proplist_new(void);
--int pa_proplist_contains(pa_proplist* p, const char* key);
-+int pa_proplist_contains(const pa_proplist* p, const char* key);
- void pa_proplist_free(pa_proplist* p);
--const char* pa_proplist_gets(pa_proplist* p, const char* key);
-+const char* pa_proplist_gets(const pa_proplist* p, const char* key);
- int pa_proplist_sets(pa_proplist* p, const char* key, const char* value);
--size_t pa_stream_readable_size(pa_stream *p);
-+size_t pa_stream_readable_size(const pa_stream *p);
- int pa_stream_peek(pa_stream* p, const void** data, size_t* nbytes);
- void pa_stream_set_read_callback(pa_stream* p, pa_stream_request_cb_t cb, void* userdata);
- void pa_stream_set_state_callback(pa_stream* s, pa_stream_notify_cb_t cb, void* userdata);
- int pa_stream_write(pa_stream* p, const void* data, size_t nbytes, pa_free_cb_t free_cb, int64_t offset, pa_seek_mode_t seek);
- void pa_stream_set_write_callback(pa_stream *p, pa_stream_request_cb_t cb, void *userdata);
- void pa_stream_unref(pa_stream* s);
--int pa_context_errno(pa_context *c);
-+int pa_context_errno(const pa_context *c);
- const char* pa_strerror(int error);
- pa_cvolume* pa_cvolume_set(pa_cvolume* a, unsigned  channels, pa_volume_t v);
diff --git a/meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend b/meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend
deleted file mode 100644
index 13ac6464..00000000
--- a/meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend
+++ /dev/null
@@ -1,8 +0,0 @@
-PR:append = ".arago0"
-
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
-
-DEPENDS:remove = "virtual/libgl"
-
-SRC_URI += "file://chromium-75.0.3770.80-SIOCGSTAMP.patch"
-SRC_URI += "file://pulse.patch"
-- 
2.36.1


