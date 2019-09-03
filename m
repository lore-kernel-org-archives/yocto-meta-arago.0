Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 363F952970
	for <meta-arago@arago-project.org>;
	Tue,  3 Sep 2019 20:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C5A6E40BC0;
	Tue,  3 Sep 2019 20:20:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id pxwOQ0Xgf1nu; Tue,  3 Sep 2019 20:20:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A5B7140BAF;
	Tue,  3 Sep 2019 20:20:11 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 828E3173C0E;
	Tue,  3 Sep 2019 16:20:10 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue,  3 Sep 2019 16:20:09 -0400
Message-Id: <1567542009-38879-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] rng-tools: remove duplicate initscript and wait for module load
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
X-List-Received-Date: Tue, 03 Sep 2019 20:21:16 -0000

Since Arago still has a mix of SysVinit iniscripts and systemd unit files, it
enables both of the DISTRO_FEATURES, resulting in some duplication. It appears
that rngd currently has a problem handling signals when forked in daemon mode.
Hence, drop SysVinit initscript in favor of systemd service, as the latter one
starts rngd in foreground. Also, add udev dependency rule on omap_rng module.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-support/rng-tools/rng-tools/rngd.rules          |  1 +
 .../recipes-support/rng-tools/rng-tools_%.bbappend          | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 meta-arago-distro/recipes-support/rng-tools/rng-tools/rngd.rules
 create mode 100644 meta-arago-distro/recipes-support/rng-tools/rng-tools_%.bbappend

diff --git a/meta-arago-distro/recipes-support/rng-tools/rng-tools/rngd.rules b/meta-arago-distro/recipes-support/rng-tools/rng-tools/rngd.rules
new file mode 100644
index 0000000..a21c99b
--- /dev/null
+++ b/meta-arago-distro/recipes-support/rng-tools/rng-tools/rngd.rules
@@ -0,0 +1 @@
+ACTION=="add", SUBSYSTEM=="module", KERNEL=="omap_rng", TAG+="systemd", ENV{SYSTEMD_WANTS}+="rngd.service"
diff --git a/meta-arago-distro/recipes-support/rng-tools/rng-tools_%.bbappend b/meta-arago-distro/recipes-support/rng-tools/rng-tools_%.bbappend
new file mode 100644
index 0000000..df84536
--- /dev/null
+++ b/meta-arago-distro/recipes-support/rng-tools/rng-tools_%.bbappend
@@ -0,0 +1,13 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+PR_append = ".arago0"
+
+SRC_URI += "file://rngd.rules"
+
+do_install_append() {
+	# remove duplicate initscript
+	rm -f ${D}${sysconfdir}/init.d/rng-tools
+
+	install -d ${D}${sysconfdir}/udev/rules.d/
+	install -m0644 ${WORKDIR}/rngd.rules ${D}${sysconfdir}/udev/rules.d/
+}
-- 
2.7.4


