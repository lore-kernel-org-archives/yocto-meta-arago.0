Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 7465F52982
	for <meta-arago@arago-project.org>;
	Thu,  4 May 2017 15:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 66E0820BE7;
	Thu,  4 May 2017 15:25:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id FBYBwaMWegWq; Thu,  4 May 2017 15:25:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3F4FC20066;
	Thu,  4 May 2017 15:25:38 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 901D2162439;
	Thu,  4 May 2017 11:25:37 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu,  4 May 2017 11:25:31 -0400
Message-Id: <1493911533-127779-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [oe-layersetup][PATCH 1/3] distroless-linaro-config: remove outdated file
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
 configs/distroless-linaro-config.txt | 9 ---------
 1 file changed, 9 deletions(-)
 delete mode 100644 configs/distroless-linaro-config.txt

diff --git a/configs/distroless-linaro-config.txt b/configs/distroless-linaro-config.txt
deleted file mode 100644
index 9820491..0000000
--- a/configs/distroless-linaro-config.txt
+++ /dev/null
@@ -1,9 +0,0 @@
-# This file takes repo entries in the format
-# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
-bitbake,git://git.openembedded.org/bitbake,master,HEAD,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,master,HEAD,layers=toolchain-layer
-meta-ti,git://arago-project.org/git/meta-ti.git,master,HEAD,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,master,HEAD,layers=
-oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
-OECORELAYERCONF=./sample-files/bblayers.conf.sample
-OECORELOCALCONF=./sample-files/local.conf.sample
-- 
2.7.4


