Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DEEAC35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 21:12:10 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.6557.1742418723649782493
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Mar 2025 14:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=oci7sPHS;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52JLC1BY3027732
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Mar 2025 16:12:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742418721;
	bh=2yH0M48CplB33+t+c8X45qChW4PWE1F1iXzarPdq+YQ=;
	h=From:To:CC:Subject:Date;
	b=oci7sPHSDllOlfR9yKH2el0sVQA9lmOWNVQe9RPwmXnRoavi5/DSbu9ylRxbnk7+u
	 nzXG3FqLb+5aC/W12igh8i2NohijdocnMDTtdPSFTCeTrrKzwypt3tVCFq3IyCGHso
	 +WpFfdaMshbxCx9pgBGiynfv3o9wU0LRq6zQ3d5s=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52JLC0Di019831
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 19 Mar 2025 16:12:01 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Mar 2025 16:12:00 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Mar 2025 16:12:00 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52JLC0AV010253;
	Wed, 19 Mar 2025 16:12:00 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 1/2] emptty: handle legacy init a litte better
Date: Wed, 19 Mar 2025 16:11:48 -0500
Message-ID: <20250319211149.730403-1-rs@ti.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Mar 2025 21:12:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16094

From: Randolph Sapp <rs@ti.com>

I've found some odd behavior with this application when it comes to
daemonization and working with legacy init systems. Some of this was
related to sequencing regarding this script and the depedent seat
script, other parts are just related to this application. This fixes up
most of that behavior until it can be addressed upstream.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-graphics/emptty/emptty/init       | 23 +++++++++++++++----
 .../recipes-graphics/emptty/emptty_0.13.0.bb  |  7 +++---
 2 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty/init b/meta-arago-distro/recipes-graphics/emptty/emptty/init
index f6bc79f9..114177c8 100644
--- a/meta-arago-distro/recipes-graphics/emptty/emptty/init
+++ b/meta-arago-distro/recipes-graphics/emptty/emptty/init
@@ -1,4 +1,13 @@
 #!/bin/sh
+#
+### BEGIN INIT INFO
+# Provides: emptty
+# Required-Start: $local_fs $remote_fs
+# Required-Stop: $local_fs $remote_fs
+# Default-Start:     5
+# Default-Stop:      0 1 2 3 6
+# X-Interactive: true
+### END INIT INFO
 
 PIDFILE=/var/run/emptty.pid
 
@@ -8,16 +17,22 @@ PIDFILE=/var/run/emptty.pid
 case "$1" in
 	start)
 		echo "Starting display manager: emptty"
-		start-stop-daemon -S -p $PIDFILE -x /usr/bin/emptty
+		start-stop-daemon -b -S -p $PIDFILE -x /usr/bin/emptty -- -d
 		;;
 	stop)
 		echo "Stopping display manager: emptty"
-		start-stop-daemon -S -p $PIDFILE -x /usr/bin/emptty
+		start-stop-daemon -K -p $PIDFILE -x /usr/bin/emptty
 		;;
 	restart)
-		start-stop-daemon -K -p $PIDFILE --oknodo -x /usr/bin/emptty
+		start-stop-daemon -K -p $PIDFILE --oknodo -x /usr/bin/emptty -- -d
 		sleep 2
-		start-stop-daemon -S -p $PIDFILE -x /usr/bin/emptty
+		start-stop-daemon -b -S -p $PIDFILE -x /usr/bin/emptty
+		;;
+	reload|force-reload)
+		start-stop-daemon -K -p $PIDFILE -s 1 -x /usr/bin/emptty
+		;;
+	status)
+		status /usr/bin/emptty
 		;;
 	*)
 		echo "usage: $0 { start | stop | restart }"
diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty_0.13.0.bb b/meta-arago-distro/recipes-graphics/emptty/emptty_0.13.0.bb
index 7129426d..176c9537 100644
--- a/meta-arago-distro/recipes-graphics/emptty/emptty_0.13.0.bb
+++ b/meta-arago-distro/recipes-graphics/emptty/emptty_0.13.0.bb
@@ -9,6 +9,7 @@ SRC_URI = "\
     git://${GO_IMPORT}.git;protocol=https;branch=master \
     git://${GO_IMPORT_pam}.git;protocol=https;branch=master;name=pam;destsuffix=${S}/src/${GO_IMPORT_pam} \
     file://pamconf \
+    file://init \
     "
 SRCREV = "4046552b6f5cc1cf76ce8bf333e04e16c59febca"
 SRCREV_pam = "50ded1b0e7864b9bf75005eb945a8ec826bcf69d"
@@ -29,7 +30,7 @@ GOBUILDFLAGS:append = " -tags=${GO_TAGS}"
 
 export GO111MODULE="off"
 
-inherit go systemd
+inherit go update-rc.d systemd
 
 DEPENDS:append = " gzip"
 
@@ -72,7 +73,5 @@ RDEPENDS:${PN}:append = " virtual-emptty-conf pam-plugin-succeed-if"
 SYSTEMD_SERVICE:${PN} = "emptty.service"
 
 INITSCRIPT_NAME = "emptty"
-INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
+INITSCRIPT_PARAMS = "start 10 5 2 . stop 20 0 1 6 ."
 INHIBIT_UPDATERCD_BBCLASS = "${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', '1', '', d)}"
-
-inherit update-rc.d systemd
-- 
2.48.1


