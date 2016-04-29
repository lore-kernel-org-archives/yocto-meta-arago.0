Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by arago-project.org (Postfix) with ESMTPS id B1B7852AAC
	for <meta-arago@arago-project.org>;
	Fri, 29 Apr 2016 22:27:54 +0000 (UTC)
Received: from vz-proxy-l007.mx.aol.com ([64.236.82.157])
	by vms173013.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6F007FZ2DS04A0@vms173013.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 29 Apr 2016 17:27:38 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=EDyElNE8DnJcdewKkuvZJw==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=Kxjt6ynSbN_D3GypibsA:9
Received: by 100.15.86.14 with SMTP id 6b700155; Fri, 29 Apr 2016 22:27:38 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id ACF12161FD0;	Fri,
	29 Apr 2016 18:27:27 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 29 Apr 2016 18:27:27 -0400
Message-id: <1461968847-26289-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] arago-prefs: switch to 2016.05 u-boot-ti-staging
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
X-List-Received-Date: Fri, 29 Apr 2016 22:27:59 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 5b68fa1..b64d0d3 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -43,7 +43,7 @@ PREFERRED_VERSION_linux-ti-staging = "4.4%"
 
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
-PREFERRED_VERSION_u-boot-ti-staging = "2015.07%"
+PREFERRED_VERSION_u-boot-ti-staging = "2016.05%"
 
 # Pin down udev version from oe-core, as meta-oe pulls in newer systemd-enhanced version
 PREFERRED_VERSION_eudev = "3.1.5"
-- 
2.2.0


