Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id B67D652A71
	for <meta-arago@arago-project.org>;
	Mon,  5 Dec 2016 22:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E26B920A39;
	Mon,  5 Dec 2016 22:55:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 2pp8WSQwxD7j; Mon,  5 Dec 2016 22:55:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CA00620181;
	Mon,  5 Dec 2016 22:55:41 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id 5BFE316218A;
	Mon,  5 Dec 2016 17:55:36 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon,  5 Dec 2016 17:55:25 -0500
Message-Id: <1480978526-20258-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [oe-layersetup][PATCH 1/2] coresdk-2016.04: add missed out meta-optee layer required for HS devices
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
X-List-Received-Date: Mon, 05 Dec 2016 22:55:42 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/coresdk/coresdk-2016.04-config.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/coresdk/coresdk-2016.04-config.txt b/configs/coresdk/coresdk-2016.04-config.txt
index 89963a5..a659cac 100644
--- a/configs/coresdk/coresdk-2016.04-config.txt
+++ b/configs/coresdk/coresdk-2016.04-config.txt
@@ -6,7 +6,7 @@ meta-arago,git://arago-project.org/git/meta-arago.git,krogoth,ti2016.04,layers=m
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,krogoth,48b4084675a15fe3fd10b58f54728dfaa2bd6c72,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,851a064b53dca3b14dd33eaaaca9573b1a36bf0e,layers=meta-networking:meta-ruby:meta-python:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,krogoth,ti2016.04,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,85faf6c6824597e7fd9e2d35fc9d8da2e9f90bc7,layers=meta-linaro-toolchain
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,85faf6c6824597e7fd9e2d35fc9d8da2e9f90bc7,layers=meta-linaro-toolchain:meta-optee
 oe-core,git://git.openembedded.org/openembedded-core,krogoth,a8f44dff13481feaa97e494a3aeafb5b63d40f3f,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.7.4


