Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B6AB9529B6
	for <meta-arago@arago-project.org>;
	Fri,  2 Oct 2015 19:53:29 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t92JrTtA008330
	for <meta-arago@arago-project.org>; Fri, 2 Oct 2015 14:53:29 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t92JrTZj015438
	for <meta-arago@arago-project.org>; Fri, 2 Oct 2015 14:53:29 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 2 Oct 2015 14:53:29 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t92JrS92022410;	Fri, 2 Oct 2015 14:53:28 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 2 Oct 2015 15:53:26 -0400
Message-ID: <1443815606-4011-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [oe-layersetup][PATCH] configs: Add config for mcsdk 3.1.4 release
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
X-List-Received-Date: Fri, 02 Oct 2015 19:53:30 -0000
Content-Type: text/plain

- This release is based on daisy branch

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 configs/mcsdk/mcsdk-03.01.04.07-config.txt |   14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 configs/mcsdk/mcsdk-03.01.04.07-config.txt

diff --git a/configs/mcsdk/mcsdk-03.01.04.07-config.txt b/configs/mcsdk/mcsdk-03.01.04.07-config.txt
new file mode 100644
index 0000000..4dc03e4
--- /dev/null
+++ b/configs/mcsdk/mcsdk-03.01.04.07-config.txt
@@ -0,0 +1,14 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.26,ed30f4ee1cef8db9ea422c5e54b2375c4f3b1d6f,layers=
+meta-mcsdk,git://arago-project.org/git/projects/meta-mcsdk.git,daisy,3ae8cecea6cd076587fb4498ae431bc42489dd9d,layers=
+meta-arago,git://arago-project.org/git/meta-arago.git,daisy,dc89e06d2a64f33d9e9662e6f7fe1f8466ff167c,layers=meta-arago-distro:meta-arago-extras
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,c29c317e0f22202bfaa85329a580564bbc179089,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,daisy,d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
+meta-ti,git://arago-project.org/git/meta-ti.git,daisy,090b02a104924886afd0fa79be7b5d08eebf071f,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,daisy,06008235ca752fea678953e85adaa29a491d246b,layers=meta-linaro-toolchain
+meta-java,git://git.yoctoproject.org/meta-java,master,66c97ae7461f4c1a13917131787bb76dc34e6b6f,layers=
+oe-core,git://git.openembedded.org/openembedded-core,daisy,e1a2540227250d854d5bba278634bcc9e7572cda,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago.conf.sample
-- 
1.7.9.5


