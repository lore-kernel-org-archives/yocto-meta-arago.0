Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 1E30852A69
	for <meta-arago@arago-project.org>;
	Sat, 19 Nov 2016 19:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0AC21209C6;
	Sat, 19 Nov 2016 19:04:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id onJSfGvxqT2h; Sat, 19 Nov 2016 19:04:42 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DFBD6204AF;
	Sat, 19 Nov 2016 19:04:41 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id 30F7F1621A4;
	Sat, 19 Nov 2016 14:04:41 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat, 19 Nov 2016 14:04:40 -0500
Message-Id: <1479582280-13738-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] arago-prefs: update libnl, bash pinned versions, drop readline pinning
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
X-List-Received-Date: Sat, 19 Nov 2016 19:04:43 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 24a4754..be7aa61 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -50,14 +50,10 @@ PREFERRED_PROVIDER_jpeg = "libjpeg-turbo"
 # Setting PREFERRED_VERSIONS due to selecting a specific version of a library or
 # application that does not have a GPLv3 license
 PREFERRED_VERSION_gdbm = "1.8.3"
-PREFERRED_VERSION_readline = "5.2"
-PREFERRED_VERSION_readline-native = "5.2"
-PREFERRED_VERSION_readline-nativesdk = "5.2"
-
-PREFERRED_VERSION_libnl = "3.2.25"
+PREFERRED_VERSION_libnl = "3.2.28"
 PREFERRED_VERSION_crda = "3.18"
 PREFERRED_VERSION_obex = "0.34"
-PREFERRED_VERSION_bash = "3.2.48"
+PREFERRED_VERSION_bash = "3.2.57"
 PREFERRED_VERSION_gettext = "0.16.1"
 PREFERRED_VERSION_elfutils = "0.148"
 
-- 
2.7.4


