Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id DFE1E529DF
	for <meta-arago@arago-project.org>;
	Fri, 31 Jan 2020 23:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B2ADF40BEF;
	Fri, 31 Jan 2020 23:02:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 2gS-XxbdC33h; Fri, 31 Jan 2020 23:02:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9AB96409E1;
	Fri, 31 Jan 2020 23:02:52 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 521BD1743CC;
	Fri, 31 Jan 2020 18:02:52 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 31 Jan 2020 18:02:49 -0500
Message-Id: <1580511770-38413-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [oe-layersetup][PATCH 1/2] distroless-zeus-config: add config for distroless zeus builds
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
 configs/distroless-zeus-config.txt | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 configs/distroless-zeus-config.txt

diff --git a/configs/distroless-zeus-config.txt b/configs/distroless-zeus-config.txt
new file mode 100644
index 0000000..724bc2d
--- /dev/null
+++ b/configs/distroless-zeus-config.txt
@@ -0,0 +1,7 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+bitbake,git://git.openembedded.org/bitbake,1.44,HEAD
+meta-ti,git://git.yoctoproject.org/meta-ti,zeus,HEAD,layers=
+oe-core,git://git.openembedded.org/openembedded-core,zeus,HEAD,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local.conf.sample
-- 
2.7.4


