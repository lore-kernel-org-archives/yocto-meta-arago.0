Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 52FC4529CA
	for <meta-arago@arago-project.org>;
	Tue, 26 Mar 2019 03:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 446F340B66;
	Tue, 26 Mar 2019 03:19:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 64IG_qXHYVua; Tue, 26 Mar 2019 03:19:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-81-231.washdc.fios.verizon.net
	[100.15.81.231])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 275C4407DA;
	Tue, 26 Mar 2019 03:19:24 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id D0C5F16D279;
	Mon, 25 Mar 2019 23:19:23 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 25 Mar 2019 23:19:23 -0400
Message-Id: <1553570363-6027-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] external-arm-secondary-sdk-toolchain: package secondary Arm toolchain into devkit
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
X-List-Received-Date: Tue, 26 Mar 2019 03:19:39 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/meta/external-arm-secondary-sdk-toolchain.bb         | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/meta/external-arm-secondary-sdk-toolchain.bb

diff --git a/meta-arago-distro/recipes-core/meta/external-arm-secondary-sdk-toolchain.bb b/meta-arago-distro/recipes-core/meta/external-arm-secondary-sdk-toolchain.bb
new file mode 100644
index 0000000..22a8aa0
--- /dev/null
+++ b/meta-arago-distro/recipes-core/meta/external-arm-secondary-sdk-toolchain.bb
@@ -0,0 +1,4 @@
+TARGET_ARCH := "${SECONDARY_TARGET_ARCH}"
+MACHINEOVERRIDES := "${SECONDARY_TARGET_ARCH}"
+
+require recipes-core/meta/external-arm-sdk-toolchain.bb
-- 
2.7.4


