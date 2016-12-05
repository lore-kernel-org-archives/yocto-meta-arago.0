Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id F414952A71
	for <meta-arago@arago-project.org>;
	Mon,  5 Dec 2016 22:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0C3DC20A39;
	Mon,  5 Dec 2016 22:55:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id SlI4EfmA20sJ; Mon,  5 Dec 2016 22:55:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DCD0F20181;
	Mon,  5 Dec 2016 22:55:36 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id 69FAC1621BC;
	Mon,  5 Dec 2016 17:55:36 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon,  5 Dec 2016 17:55:26 -0500
Message-Id: <1480978526-20258-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480978526-20258-1-git-send-email-denis@denix.org>
References: <1480978526-20258-1-git-send-email-denis@denix.org>
Subject: [oe-layersetup][PATCH 2/2] coresdk-2016.05: add config file for ti2016.05 release
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
X-List-Received-Date: Mon, 05 Dec 2016 22:55:38 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/coresdk/coresdk-2016.05-config.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 configs/coresdk/coresdk-2016.05-config.txt

diff --git a/configs/coresdk/coresdk-2016.05-config.txt b/configs/coresdk/coresdk-2016.05-config.txt
new file mode 100644
index 0000000..63822f3
--- /dev/null
+++ b/configs/coresdk/coresdk-2016.05-config.txt
@@ -0,0 +1,12 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.30,e82862ba8fedb2c5cd478c731b3d259d16c6e3d8,layers=
+meta-arago,git://arago-project.org/git/meta-arago.git,krogoth,ti2016.05,layers=meta-arago-distro:meta-arago-extras
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,krogoth,2b1871f0d139dc3caaa779a32a1931409c245a36,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,851a064b53dca3b14dd33eaaaca9573b1a36bf0e,layers=meta-networking:meta-ruby:meta-python:meta-oe
+meta-ti,git://arago-project.org/git/meta-ti.git,krogoth,ti2016.05,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,9b616ce6d4293387d254f36800389b2910895420,layers=meta-linaro-toolchain:meta-optee
+oe-core,git://git.openembedded.org/openembedded-core,krogoth,28da89a20b70f2bf0c85da6e8af5d94a3b7d76c9,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.7.4


