Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id E71E052A0A
	for <meta-arago@arago-project.org>;
	Fri, 31 Jan 2020 23:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BBEC3409E1;
	Fri, 31 Jan 2020 23:02:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id foPj2cA4S5hM; Fri, 31 Jan 2020 23:02:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id ABA9940BDA;
	Fri, 31 Jan 2020 23:02:52 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 5E7E31743CD;
	Fri, 31 Jan 2020 18:02:52 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 31 Jan 2020 18:02:50 -0500
Message-Id: <1580511770-38413-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580511770-38413-1-git-send-email-denis@denix.org>
References: <1580511770-38413-1-git-send-email-denis@denix.org>
Subject: [oe-layersetup][PATCH 2/2] poky-zeus-config: add config for poky zeus builds
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
X-List-Received-Date: Fri, 31 Jan 2020 23:04:46 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/poky-zeus-config.txt | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 configs/poky-zeus-config.txt

diff --git a/configs/poky-zeus-config.txt b/configs/poky-zeus-config.txt
new file mode 100644
index 0000000..d1d944a
--- /dev/null
+++ b/configs/poky-zeus-config.txt
@@ -0,0 +1,7 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+bitbake,git://git.openembedded.org/bitbake,1.44,HEAD
+poky,git://git.yoctoproject.org/poky,zeus,HEAD,layers=meta:meta-poky:meta-yocto-bsp
+meta-ti,git://git.yoctoproject.org/meta-ti,zeus,HEAD,layers=
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-poky.conf.sample
-- 
2.7.4


