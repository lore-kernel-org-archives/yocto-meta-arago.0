Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id 0C16852AA6
	for <meta-arago@arago-project.org>;
	Tue,  3 Jun 2014 02:30:20 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N6K00DRLMXP67E0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 02 Jun 2014 21:30:02 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9D7D920210; Mon,
	02 Jun 2014 22:29:49 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 02 Jun 2014 22:29:39 -0400
Message-id: <1401762581-31370-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
In-reply-to: <1401762581-31370-1-git-send-email-denis@denix.org>
References: <1401762581-31370-1-git-send-email-denis@denix.org>
Subject: [PATCH 3/5] arago-prefs: make ARAGO_QT_PROVIDER aware of Qt5
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
X-List-Received-Date: Tue, 03 Jun 2014 02:30:20 -0000

From: Denys Dmytriyenko <denys@ti.com>

As ARAGO_QT_PROVIDER is used to select between gles and non-gles versions of Qt4,
make it aware of Qt5 and set it empty in that case.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 6ae11e9..0885acf 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -25,7 +25,7 @@ PREFERRED_VERSION_libdrm = "2.4.46"
 
 PREFERRED_PROVIDER_virtual/gettext = "gettext"
 
-ARAGO_QT_PROVIDER = "${@base_contains('MACHINE_FEATURES','sgx','qt4-embedded-gles','qt4-embedded',d)}"
+ARAGO_QT_PROVIDER = "${@base_contains('QT_PROVIDER','qt5','',base_contains('MACHINE_FEATURES','sgx','qt4-embedded-gles','qt4-embedded',d),d)}"
 PREFERRED_PROVIDER_qt4-embedded = "${ARAGO_QT_PROVIDER}"
 
 PREFERRED_VERSION_qt4-embedded = "4.8.5"
-- 
1.9.2


