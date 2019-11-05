Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 918DF529DE
	for <meta-arago@arago-project.org>;
	Tue,  5 Nov 2019 18:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5BD5240BFD;
	Tue,  5 Nov 2019 18:13:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id hg7mOomcRkyi; Tue,  5 Nov 2019 18:13:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4538E40BD2;
	Tue,  5 Nov 2019 18:13:25 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 83B471742DE;
	Tue,  5 Nov 2019 13:13:24 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue,  5 Nov 2019 13:13:24 -0500
Message-Id: <1572977604-13512-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] nbench-byte: stick to arm instructions to improve performance
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
X-List-Received-Date: Tue, 05 Nov 2019 18:14:48 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-benchmark/nbench-byte/nbench-byte_%.bbappend | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 meta-arago-distro/recipes-benchmark/nbench-byte/nbench-byte_%.bbappend

diff --git a/meta-arago-distro/recipes-benchmark/nbench-byte/nbench-byte_%.bbappend b/meta-arago-distro/recipes-benchmark/nbench-byte/nbench-byte_%.bbappend
new file mode 100644
index 0000000..f571f36
--- /dev/null
+++ b/meta-arago-distro/recipes-benchmark/nbench-byte/nbench-byte_%.bbappend
@@ -0,0 +1 @@
+ARM_INSTRUCTION_SET = "arm"
-- 
2.7.4


