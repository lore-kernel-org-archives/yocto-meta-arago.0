Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id B5479529B9
	for <meta-arago@arago-project.org>;
	Wed,  9 Oct 2019 23:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0A1CD40BE5;
	Wed,  9 Oct 2019 23:45:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id TXkqKj8I0Beu; Wed,  9 Oct 2019 23:45:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E63FC40A89;
	Wed,  9 Oct 2019 23:45:21 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 2847A174282;
	Wed,  9 Oct 2019 19:45:21 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  9 Oct 2019 19:45:20 -0400
Message-Id: <1570664720-26376-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] ti-sci-fw: update checksums for AM65x HS SYSFW 2019.08
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
X-List-Received-Date: Wed, 09 Oct 2019 23:46:37 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.08.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.08.bb b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.08.bb
index fab4de4..a8fa994 100644
--- a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.08.bb
+++ b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.08.bb
@@ -30,10 +30,10 @@ SRC_URI_append_am65xx-hs-evm = " \
 	http://install.source.dir.local/ti-sci-firmware-am65x-hs-enc.bin;name=hs-enc \
 "
 
-SRC_URI[hs-cert.md5sum] = "e36d9d945b4aa20347470c7c53dbc54a"
-SRC_URI[hs-cert.sha256sum] = "e32182a3b36e5fc9543ca920dafcc2163384e116c88e3c2625399bc1c2ad2f45"
-SRC_URI[hs-enc.md5sum] = "735128f2ac0dafdd44529f243b60a0c6"
-SRC_URI[hs-enc.sha256sum] = "46c2870e133058f68d6b25fd4979a0726b7c6e2a100d48431d47e47db4165c75"
+SRC_URI[hs-cert.md5sum] = "b5ad8a9e8d7d0bc2c0d075ce06a15213"
+SRC_URI[hs-cert.sha256sum] = "f79cf2696f4dac4f682a79336e7be86df50bddf764234bd82ac67921565e6129"
+SRC_URI[hs-enc.md5sum] = "dfe6eac6a650b9b3ac2a9a679e5e5678"
+SRC_URI[hs-enc.sha256sum] = "6389d873889b63c32d9aa3aaae7f0ebd21d1e97e32c176a8daf514e99e412d17"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


