Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 8B41B529E5
	for <meta-arago@arago-project.org>;
	Thu, 30 Apr 2020 00:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 678CD40C0F;
	Thu, 30 Apr 2020 00:35:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id H35oBbqKAH8J; Thu, 30 Apr 2020 00:35:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C1E9740A9E;
	Thu, 30 Apr 2020 00:35:56 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 32C7717272F;
	Wed, 29 Apr 2020 20:35:56 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 29 Apr 2020 20:35:56 -0400
Message-Id: <1588206956-22534-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] linuxptp: switch to local ti-linuxptp branch for phc2pwm support
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
X-List-Received-Date: Thu, 30 Apr 2020 00:38:20 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-connectivity/linuxptp/linuxptp_%.bbappend   | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend

diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend
new file mode 100644
index 0000000..ff1e161
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend
@@ -0,0 +1,17 @@
+PR_append = ".arago0"
+PV_append = "+git${SRCPV}"
+
+BRANCH = "ti-linuxptp"
+SRCREV = "e54ee647f1d2844b7015d1ae60eef21aa92e113b"
+
+SRC_URI = " \
+    git://git.ti.com/processor-sdk/linuxptp.git;branch=${BRANCH} \
+    file://build-Allow-CC-and-prefix-to-be-overriden.patch \
+    file://no-incdefs-using-host-headers.patch \
+"
+
+S = "${WORKDIR}/git"
+
+do_install_append () {
+    install -p ${S}/phc2pwm ${D}/${bindir}
+}
-- 
2.7.4


