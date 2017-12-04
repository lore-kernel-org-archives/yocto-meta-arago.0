Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 1951452A40
	for <meta-arago@arago-project.org>;
	Mon,  4 Dec 2017 19:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6BBAE20AD6;
	Mon,  4 Dec 2017 19:47:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id HpzI0Bd3lwMg; Mon,  4 Dec 2017 19:47:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 471EF2005C;
	Mon,  4 Dec 2017 19:47:00 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id C9CA6162742;
	Mon,  4 Dec 2017 14:46:59 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon,  4 Dec 2017 14:46:52 -0500
Message-Id: <1512416813-10967-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH 1/2] linux-firmware: resolve conflict, as ti-connectivity is provided separately
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
X-List-Received-Date: Mon, 04 Dec 2017 19:47:02 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-kernel/linux-firmware/linux-firmware_git.bbappend        | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_git.bbappend

diff --git a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_git.bbappend b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_git.bbappend
new file mode 100644
index 0000000..146596a
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_git.bbappend
@@ -0,0 +1,5 @@
+PR_append = ".arago0"
+
+do_install_append() {
+	rm -rf  ${D}/lib/firmware/ti-connectivity/
+}
-- 
2.7.4


