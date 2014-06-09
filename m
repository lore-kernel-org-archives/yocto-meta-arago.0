Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 7C25C52A1E
	for <meta-arago@arago-project.org>;
	Mon,  9 Jun 2014 13:59:53 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s59DxqII032764
	for <meta-arago@arago-project.org>; Mon, 9 Jun 2014 08:59:52 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s59Dxqbi030045
	for <meta-arago@arago-project.org>; Mon, 9 Jun 2014 08:59:52 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 9 Jun 2014 08:59:52 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s59DxpHF014267;	Mon, 9 Jun 2014 08:59:51 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 9 Jun 2014 09:59:49 -0400
Message-ID: <1402322389-22164-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] configs: mcsdk 3.1.0: Add configuration for mcsdk 3.1.0
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
X-List-Received-Date: Mon, 09 Jun 2014 13:59:53 -0000
Content-Type: text/plain

- Add release configuration for upcoming release
  MCSDK 3.1.0

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 configs/mcsdk/mcsdk-3.1.0-config.txt |   14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 configs/mcsdk/mcsdk-3.1.0-config.txt

diff --git a/configs/mcsdk/mcsdk-3.1.0-config.txt b/configs/mcsdk/mcsdk-3.1.0-config.txt
new file mode 100644
index 0000000..44feb12
--- /dev/null
+++ b/configs/mcsdk/mcsdk-3.1.0-config.txt
@@ -0,0 +1,14 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
+meta-mcsdk,git://arago-project.org/git/projects/meta-mcsdk.git,master,HEAD,layers=
+meta-arago,git://arago-project.org/git/meta-arago.git,dylan,370ed5e9f68afd0937e01f6cd69863e45ba19c1f,layers=meta-arago-distro:meta-arago-extras
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,ed05b91f137cb229e9ebababf9f72748aece1bf3,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,70ebe86f193decd17d6295bcd4d4e5589585c0cc,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
+meta-ti,git://arago-project.org/git/meta-ti.git,dylan,0056050410c1d5f8627c509490a5650eb082261c,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
+meta-java,git://github.com/woglinde/meta-java,master,ac8c0604d1ed63b1ae0e05f870f53b8241e6dda1,layers=
+oe-core,git://git.openembedded.org/openembedded-core,dylan,7ff1924674871d604f9656f3928b91dc417c7246,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago.conf.sample
-- 
1.7.9.5


