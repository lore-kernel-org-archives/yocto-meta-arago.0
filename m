Return-Path: <jake@udd0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 403EA52AAE
	for <meta-arago@arago-project.org>;
	Wed, 10 Feb 2016 17:54:31 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1AHsUOY024613
	for <meta-arago@arago-project.org>; Wed, 10 Feb 2016 11:54:30 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1AHsUIk002197
	for <meta-arago@arago-project.org>; Wed, 10 Feb 2016 11:54:30 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 10 Feb 2016 11:54:29 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1AHsTZV008990;
	Wed, 10 Feb 2016 11:54:29 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aTYyD-00037w-78; Wed, 10 Feb 2016 12:54:29 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 10 Feb 2016 12:54:27 -0500
Message-ID: <1455126867-11986-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] arago.conf: Swap including arago-source-ipk.inc before branding.inc
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
X-List-Received-Date: Wed, 10 Feb 2016 17:54:31 -0000
Content-Type: text/plain

* This will allow the branding file to override any settings in
  arago-source-ipk.conf, such as whether to shallow the linux git
  repo

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 4483d0b..325e112 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -89,6 +89,9 @@ require conf/distro/include/arago-prefs.inc
 # git history.
 ASSUME_PROVIDED := "${@filter_out('git-native','${ASSUME_PROVIDED}',d)}"
 
+# Enable generation of source packages for SDKs
+require arago-source-ipk.conf
+
 # Allow branding on top of Arago Distro and Core TI-SDK
 # If ARAGO_BRAND is not set in local.conf, default to core
 ARAGO_BRAND ??= "core"
@@ -98,9 +101,6 @@ require conf/distro/include/branding-${ARAGO_BRAND}.inc
 # Disable polkit's systemd configuration from meta-oe
 POLKITAUTH = ""
 
-# Enable generation of source packages for SDKs
-require arago-source-ipk.conf
-
 # Set ENTERPRISE_DISTRO flag to ensure that recipes that have been flagged
 # do not attempt to enable features that have potential commercial
 # licensing issues.
-- 
1.9.1


