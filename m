Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 548AA52A60
	for <meta-arago@arago-project.org>;
	Tue, 16 Jan 2018 02:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8A0FC20B9C;
	Tue, 16 Jan 2018 02:15:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id STAoAGHnkMUR; Tue, 16 Jan 2018 02:15:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 608CF20B99;
	Tue, 16 Jan 2018 02:15:23 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 7AF98163267;
	Mon, 15 Jan 2018 21:15:22 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 15 Jan 2018 21:15:11 -0500
Message-Id: <1516068913-79829-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516068913-79829-1-git-send-email-denys@ti.com>
References: <1516068913-79829-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCH 2/4] at: explicitly depend on bison-native for deterministic builds
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
X-List-Received-Date: Tue, 16 Jan 2018 02:15:38 -0000

The fix was submitted upstream to oe-core - overlay locally until it gets
backported to rocko.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-extended/at/at_%.bbappend | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 meta-arago-distro/recipes-extended/at/at_%.bbappend

diff --git a/meta-arago-distro/recipes-extended/at/at_%.bbappend b/meta-arago-distro/recipes-extended/at/at_%.bbappend
new file mode 100644
index 0000000..ab5a588
--- /dev/null
+++ b/meta-arago-distro/recipes-extended/at/at_%.bbappend
@@ -0,0 +1 @@
+DEPENDS += "bison-native"
-- 
2.7.4


