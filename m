Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id DED5A5298B
	for <meta-arago@arago-project.org>;
	Tue, 11 Feb 2020 04:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 44F1040C11;
	Tue, 11 Feb 2020 04:22:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id poqNi1mQUM04; Tue, 11 Feb 2020 04:22:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4711840BFC;
	Tue, 11 Feb 2020 04:22:50 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id EFE2B1743F4;
	Mon, 10 Feb 2020 23:22:49 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 10 Feb 2020 23:22:43 -0500
Message-Id: <1581394963-24648-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud][PATCH] docker: install init script if sysvinit is enabled
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
X-List-Received-Date: Tue, 11 Feb 2020 04:24:50 -0000

From: Jacob Stiffler <j-stiffler@ti.com>

The docker recipe in meta-virtualization has conflicting logic for
when to install and when to enable the docker initscript. When both
systemd and sysvinit are in DISTRO_FEATURES, this causes the docker
postinst to fail, which now fails the rootfs task.

Here we install the initscript only based on if sysvinit is in the
DISTRO_FEATURES.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-containers/docker/docker_git.bbappend | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-arago-distro/recipes-containers/docker/docker_git.bbappend

diff --git a/meta-arago-distro/recipes-containers/docker/docker_git.bbappend b/meta-arago-distro/recipes-containers/docker/docker_git.bbappend
new file mode 100644
index 0000000..ccf9ff2
--- /dev/null
+++ b/meta-arago-distro/recipes-containers/docker/docker_git.bbappend
@@ -0,0 +1,8 @@
+PR_append = ".arago0"
+
+do_install_append() {
+	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
+		install -d ${D}${sysconfdir}/init.d
+		install -m 0755 ${WORKDIR}/docker.init ${D}${sysconfdir}/init.d/docker.init
+	fi
+}
-- 
2.7.4


