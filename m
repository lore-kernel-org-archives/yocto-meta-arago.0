Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 7861A5299A
	for <meta-arago@arago-project.org>;
	Thu,  4 May 2017 15:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 81D0C20066;
	Thu,  4 May 2017 15:25:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id g0P-8d0dvzHG; Thu,  4 May 2017 15:25:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 43C1420BAF;
	Thu,  4 May 2017 15:25:38 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id A846C162494;
	Thu,  4 May 2017 11:25:37 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu,  4 May 2017 11:25:33 -0400
Message-Id: <1493911533-127779-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493911533-127779-1-git-send-email-denis@denix.org>
References: <1493911533-127779-1-git-send-email-denis@denix.org>
Subject: [oe-layersetup][PATCH 3/3] distroless-morty-config: add new config
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
X-List-Received-Date: Thu, 04 May 2017 15:25:45 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/distroless-morty-config.txt | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 configs/distroless-morty-config.txt

diff --git a/configs/distroless-morty-config.txt b/configs/distroless-morty-config.txt
new file mode 100644
index 0000000..7c59380
--- /dev/null
+++ b/configs/distroless-morty-config.txt
@@ -0,0 +1,7 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+bitbake,git://git.openembedded.org/bitbake,1.32,HEAD,layers=
+meta-ti,git://git.yoctoproject.org/meta-ti,morty,HEAD,layers=
+oe-core,git://git.openembedded.org/openembedded-core,morty,HEAD,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local.conf.sample
-- 
2.7.4


