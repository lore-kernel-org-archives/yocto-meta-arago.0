Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by arago-project.org (Postfix) with ESMTPS id D61E152A4A
	for <meta-arago@arago-project.org>;
	Mon, 25 Apr 2016 15:13:14 +0000 (UTC)
Received: from vz-proxy-l003.mx.aol.com ([64.236.82.155])
	by vms173013.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6700IEC3LMVM00@vms173013.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 25 Apr 2016 10:12:59 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=i+tV1o3iWEoTTvx3QNPGxA==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=V-ZfKAzCuhlz9H6k2v0A:9
Received: by 100.15.86.14 with SMTP id 73220e52; Mon, 25 Apr 2016 15:12:59 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8D1F8161FAF;	Mon,
	25 Apr 2016 11:12:58 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 25 Apr 2016 11:12:55 -0400
Message-id: <1461597176-5337-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/2] arago-prefs: unpin libdrm, pick up latest available
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
X-List-Received-Date: Mon, 25 Apr 2016 15:13:16 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index bab6868..2d8368e 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -19,9 +19,6 @@ include conf/distro/include/qt5-versions.inc
 # Use the latest version of ltp-ddt for kernel versions 3.8+
 PREFERRED_PROVIDER_ltp-ddt = "ltp-ddt"
 
-# Use the latest version of libdrm
-PREFERRED_VERSION_libdrm = "2.4.66"
-
 PREFERRED_PROVIDER_virtual/gettext = "gettext"
 
 ARAGO_QT_PROVIDER = "${@base_conditional('QT_PROVIDER','qt5','',base_contains('MACHINE_FEATURES','sgx','qt4-embedded-gles','qt4-embedded',d),d)}"
-- 
2.2.0


