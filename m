Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id CD6BE52960
	for <meta-arago@arago-project.org>;
	Wed,  4 Sep 2019 17:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 77A9E40BE5;
	Wed,  4 Sep 2019 17:25:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id n-894pAiDw5w; Wed,  4 Sep 2019 17:25:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4BAE940A9E;
	Wed,  4 Sep 2019 17:25:41 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 81176173A9B;
	Wed,  4 Sep 2019 13:25:40 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  4 Sep 2019 13:25:40 -0400
Message-Id: <1567617940-18452-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH v2] rng-tools: remove duplicate initscript and wait for module load
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
X-List-Received-Date: Wed, 04 Sep 2019 17:26:49 -0000

Since Arago still has a mix of SysVinit iniscripts and systemd unit files, it
enables both of the DISTRO_FEATURES, resulting in some duplication. It appears
that rngd currently has a problem handling signals when forked in daemon mode.
Hence, drop SysVinit initscript in favor of systemd service, as the latter one
starts rngd in foreground. Also, add udev dependency rule on omap_rng module.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - since dropping initscript, disable corresponding update-rc.d processing

 .../recipes-support/rng-tools/rng-tools/rngd.rules        |  1 +
 .../recipes-support/rng-tools/rng-tools_%.bbappend        | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
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
index 0000000..2a7810f
--- /dev/null
+++ b/meta-arago-distro/recipes-support/rng-tools/rng-tools_%.bbappend
@@ -0,0 +1,15 @@
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
+
+INHIBIT_UPDATERCD_BBCLASS = "1"
-- 
2.7.4


