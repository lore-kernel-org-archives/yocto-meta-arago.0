Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 58D28529B9
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 06:25:40 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so1323219oag.38
	for <meta-arago@arago-project.org>;
	Thu, 04 Oct 2012 23:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=fjf+gmLBV9h9wZoyO0LYdbTipK/LFy2yyrJjtXBVbTs=;
	b=DsiOJO+ijj6JEM1kA3MlQFhTxPauyoQRL30av8jzbL07R5Zet/Ows9xvqkrepT5bTY
	wPOys7suFSal2pOstBFtHLQTWvQUGLoTwCkXC9rF2o7nFAbBVLkhvoa0KZZb6joc+nWl
	tLu8hKtYZHiX0ZMoKX91Rq0rjFC46SdikDQ9VpMamAjuGyMr7uWtuC6p8GJNqulGtpz+
	tp0gHUuU7seB/6odfviJzMAcpkK5a6B27GrFa+WfKcG60bFIGdVoXDZV/O675rBBlF2Q
	TMaC4sh+PwsfvELjlcPRp/cjkjdyi2DBCHZDbRgTx5W8tVLONbp0WcqMEnUFwMnb3jEg
	6s8Q==
Received: by 10.60.28.167 with SMTP id c7mr1968706oeh.44.1349418339782;
	Thu, 04 Oct 2012 23:25:39 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id n7sm960801obd.16.2012.10.04.23.25.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Oct 2012 23:25:39 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri,  5 Oct 2012 01:53:59 -0500
Message-Id: <1349420039-21942-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] arago: Add wlan related preferred versions
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
X-List-Received-Date: Fri, 05 Oct 2012 06:25:41 -0000

* Add preferred versions for wpa-supplicant and hostap-daemon.
* This ensures the TI version of the above recipes are used.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index c5d826c..a99a8df 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -18,6 +18,8 @@ PREFERRED_PROVIDER_virtual/gettext = "gettext"
 PREFERRED_VERSION_qt4-embedded = "4.8.0"
 PREFERRED_VERSION_qt4-native = "4.8.0"
 PREFERRED_VERSION_qt4-tools-nativesdk = "4.8.0"
+PREFERRED_VERSION_wpa-supplicant = "0.7.3+0.8.0-rc-ti"
+PREFERRED_VERSION_hostap-daemon = "0.7.3+0.8.0-rc-ti"
 
 # Pin down udev version from oe-core, as meta-oe pulls in newer systemd-enhanced version
 PREFERRED_VERSION_udev = "164"
-- 
1.7.0.4


