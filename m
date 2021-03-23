Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id BABCD52A25
	for <meta-arago@arago-project.org>;
	Tue, 23 Mar 2021 21:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6C12F40C34;
	Tue, 23 Mar 2021 21:15:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id kS59fiQbRhxp; Tue, 23 Mar 2021 21:15:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4F707400CF;
	Tue, 23 Mar 2021 21:15:15 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 2154517454E;
	Tue, 23 Mar 2021 17:15:14 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 23 Mar 2021 17:15:04 -0400
Message-Id: <1616534107-46438-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master][PATCH 1/4] chromium: apply bbappend with fix dynamically based on "browser-layer" presence
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
X-List-Received-Date: Tue, 23 Mar 2021 21:14:59 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

This solves the dangling bbappend warning when browser-layer is not enabled.

As chromium still requires Python2, corresponding meta-python2 layer is required.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/conf/layer.conf                                     | 4 ++++
 .../chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch     | 0
 .../recipes-browser/chromium/chromium-ozone-wayland_%.bbappend        | 0
 3 files changed, 4 insertions(+)
 rename meta-arago-distro/{ => dynamic-layers/browser-layer}/recipes-browser/chromium/chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch (100%)
 rename meta-arago-distro/{ => dynamic-layers/browser-layer}/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend (100%)

diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
index 2931bf9..9014511 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -24,6 +24,10 @@ LAYERRECOMMENDS_meta-arago-distro = " \
     browser-layer \
 "
 
+BBFILES_DYNAMIC += " \
+    browser-layer:${LAYERDIR}/dynamic-layers/browser-layer/recipes*/*/*.bbappend \
+"
+
 BB_DANGLINGAPPENDS_WARNONLY = "true"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
diff --git a/meta-arago-distro/recipes-browser/chromium/chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch b/meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch
similarity index 100%
rename from meta-arago-distro/recipes-browser/chromium/chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch
rename to meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch
diff --git a/meta-arago-distro/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend b/meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend
rename to meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend
-- 
2.7.4


