Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 53115529AA
	for <meta-arago@arago-project.org>;
	Thu,  8 Jun 2017 17:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5CE9820C0A;
	Thu,  8 Jun 2017 17:57:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id c81Qu76AllIs; Thu,  8 Jun 2017 17:57:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3957F204E0;
	Thu,  8 Jun 2017 17:57:53 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id B0BAB1624EA;
	Thu,  8 Jun 2017 13:57:52 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu,  8 Jun 2017 13:57:40 -0400
Message-Id: <1496944662-54767-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1496944662-54767-1-git-send-email-denys@ti.com>
References: <1496944662-54767-1-git-send-email-denys@ti.com>
Subject: [morty/master][PATCH 2/4] systemd/usb-ruls: fix shell hashbang
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
X-List-Received-Date: Thu, 08 Jun 2017 17:57:55 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/systemd/systemd/usb1-rules.sh | 2 +-
 meta-arago-distro/recipes-core/systemd/systemd/usb2-rules.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/systemd/systemd/usb1-rules.sh b/meta-arago-distro/recipes-core/systemd/systemd/usb1-rules.sh
index 51dfd71..68e8351 100755
--- a/meta-arago-distro/recipes-core/systemd/systemd/usb1-rules.sh
+++ b/meta-arago-distro/recipes-core/systemd/systemd/usb1-rules.sh
@@ -1,3 +1,3 @@
-#!bin/sh
+#!/bin/sh
 /sbin/modprobe g_ncm -r
 /sbin/modprobe g_ncm
diff --git a/meta-arago-distro/recipes-core/systemd/systemd/usb2-rules.sh b/meta-arago-distro/recipes-core/systemd/systemd/usb2-rules.sh
index f00565e..9707126 100755
--- a/meta-arago-distro/recipes-core/systemd/systemd/usb2-rules.sh
+++ b/meta-arago-distro/recipes-core/systemd/systemd/usb2-rules.sh
@@ -1,3 +1,3 @@
-#!bin/sh
+#!/bin/sh
 /sbin/modprobe g_zero -r
 /sbin/modprobe g_zero
-- 
2.7.4


