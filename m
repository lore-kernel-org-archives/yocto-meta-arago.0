Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id D97BF52A79
	for <meta-arago@arago-project.org>;
	Mon, 14 Nov 2016 23:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B182E20ADD;
	Mon, 14 Nov 2016 23:34:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 06G4rwwXmUVJ; Mon, 14 Nov 2016 23:34:40 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8673F209D7;
	Mon, 14 Nov 2016 23:34:39 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id BB92F16219E;
	Mon, 14 Nov 2016 18:34:38 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 14 Nov 2016 18:34:31 -0500
Message-Id: <1479166471-30960-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479166471-30960-1-git-send-email-denis@denix.org>
References: <1479166471-30960-1-git-send-email-denis@denix.org>
Subject: [oe-layersetup][PATCH 2/2] arago-morty-config: add config to track morty branches
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
X-List-Received-Date: Mon, 14 Nov 2016 23:34:41 -0000

From: Denys Dmytriyenko <denys@ti.com>

meta-ti and meta-arago point to master for now, until remaining issues fixed

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/arago-morty-config.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 configs/arago-morty-config.txt

diff --git a/configs/arago-morty-config.txt b/configs/arago-morty-config.txt
new file mode 100644
index 0000000..ce7dbac
--- /dev/null
+++ b/configs/arago-morty-config.txt
@@ -0,0 +1,12 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.32,HEAD,layers=
+meta-arago,git://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,HEAD,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe
+meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,HEAD,layers=meta-linaro-toolchain:meta-optee
+oe-core,git://git.openembedded.org/openembedded-core,morty,HEAD,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.7.4


