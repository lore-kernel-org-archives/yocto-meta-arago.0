Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id AADA2529A6
	for <meta-arago@arago-project.org>;
	Fri, 29 Mar 2019 16:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2936F40A18;
	Fri, 29 Mar 2019 16:58:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id cvVSqCOj0S6H; Fri, 29 Mar 2019 16:58:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-81-231.washdc.fios.verizon.net
	[100.15.81.231])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 127AB40B88;
	Fri, 29 Mar 2019 16:58:50 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 2923716D6A9;
	Fri, 29 Mar 2019 12:58:49 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri, 29 Mar 2019 12:58:45 -0400
Message-Id: <1553878725-54332-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1553878725-54332-1-git-send-email-denys@ti.com>
References: <1553878725-54332-1-git-send-email-denys@ti.com>
Subject: [thud/master][PATCH 2/2] external-arm-toolchain: overlay libc.so linker script path fix
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
X-List-Received-Date: Fri, 29 Mar 2019 16:59:07 -0000

Overlay locally until the fix gets into meta-linaro-toolchain.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend

diff --git a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
new file mode 100644
index 0000000..974bc7a
--- /dev/null
+++ b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
@@ -0,0 +1,4 @@
+do_install_append() {
+	# libc.so linker script should use relative path to not clash with host libs
+	sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libc.so
+}
-- 
2.7.4


