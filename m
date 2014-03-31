Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id E632B52A2D
	for <meta-arago@arago-project.org>;
	Mon, 31 Mar 2014 17:30:09 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2VHU9Yf021500
	for <meta-arago@arago-project.org>; Mon, 31 Mar 2014 12:30:09 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2VHU7xp017174
	for <meta-arago@arago-project.org>; Mon, 31 Mar 2014 12:30:09 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 31 Mar 2014 12:30:08 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s2VHU8v0025334;	Mon, 31 Mar 2014 12:30:08 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 31 Mar 2014 13:30:07 -0400
Message-ID: <1396287007-16285-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] configs: Add release config mcsdk/mcsdk-03.00.04.18
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
X-List-Received-Date: Mon, 31 Mar 2014 17:30:10 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 configs/mcsdk/mcsdk-03.00.04.18-config.txt |   14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 configs/mcsdk/mcsdk-03.00.04.18-config.txt

diff --git a/configs/mcsdk/mcsdk-03.00.04.18-config.txt b/configs/mcsdk/mcsdk-03.00.04.18-config.txt
new file mode 100644
index 0000000..2f69ebb
--- /dev/null
+++ b/configs/mcsdk/mcsdk-03.00.04.18-config.txt
@@ -0,0 +1,14 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
+meta-mcsdk,git://arago-project.org/git/projects/meta-mcsdk.git,master,HEAD,layers=
+meta-arago,git://arago-project.org/git/meta-arago.git,dylan,608fd3be257002256d13422daf0b593b55463d4d,layers=meta-arago-distro:meta-arago-extras
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,1fa7f364f682e5cfaa9d6e565b7ae6b8ec2a90ff,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,cb182019c4f7485713cb50623240c01882448ffd,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
+meta-ti,git://arago-project.org/git/meta-ti.git,dylan,14858daa694a559b89881741ad9033acd925143c,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
+meta-java,git://github.com/woglinde/meta-java,master,20fa82037c93e6814f1b76c0b8adc73616be8aa2,layers=
+oe-core,git://git.openembedded.org/openembedded-core,dylan,58b479f4d4d283e590a55a71151fca481fbe3c24,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago.conf.sample
-- 
1.7.9.5


