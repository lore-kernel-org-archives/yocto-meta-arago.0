Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 45FBF52A74
	for <meta-arago@arago-project.org>;
	Tue, 21 Mar 2017 01:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4B3C520BBB;
	Tue, 21 Mar 2017 01:43:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id UHgacz6e3p7h; Tue, 21 Mar 2017 01:43:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3137E20B96;
	Tue, 21 Mar 2017 01:43:14 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 7AF3216241F;
	Mon, 20 Mar 2017 21:43:12 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 20 Mar 2017 21:43:09 -0400
Message-Id: <1490060589-72852-12-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490060589-72852-1-git-send-email-denis@denix.org>
References: <1490060589-72852-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 12/12] arago-prefs: disable preference for old GPLv2 packages removed from OE-Core
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
X-List-Received-Date: Tue, 21 Mar 2017 01:43:18 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index ac18258..546cecb 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -28,12 +28,13 @@ PREFERRED_PROVIDER_jpeg = "libjpeg-turbo"
 
 # Setting PREFERRED_VERSIONS due to selecting a specific version of a library or
 # application that does not have a GPLv3 license
-PREFERRED_VERSION_gdbm = "1.8.3"
 PREFERRED_VERSION_crda = "3.18"
 PREFERRED_VERSION_obex = "0.34"
-PREFERRED_VERSION_bash = "3.2.57"
-PREFERRED_VERSION_gettext = "0.16.1"
-PREFERRED_VERSION_elfutils = "0.148"
+# These old GPLv2 versions are no longer in OE-Core
+#PREFERRED_VERSION_gdbm = "1.8.3"
+#PREFERRED_VERSION_bash = "3.2.57"
+#PREFERRED_VERSION_gettext = "0.16.1"
+#PREFERRED_VERSION_elfutils = "0.148"
 
 PREFERRED_PROVIDER_libnl-xfrm = "libnl"
 
-- 
2.7.4


