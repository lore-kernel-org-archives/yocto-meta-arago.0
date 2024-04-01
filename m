Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D78CD1288
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 21:15:16 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.49775.1712006110966635942
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 01 Apr 2024 14:15:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=u+XNnia+;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 431LF9oB061449;
	Mon, 1 Apr 2024 16:15:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1712006109;
	bh=NLWpeyySks5+wBn2Hy3iJrFE4JsaGEIliXZKQMgMqNo=;
	h=From:To:Subject:Date;
	b=u+XNnia+6fpMrwPm2GEdJO+NwdYV52PPovh7N9Itjvox/6x8if+JiyrK97CbUqZOg
	 W/uXS/mUm5R9Y9GCL0aFQVRahK5VnAVovTrStFgxjgA6+lxsDbntwv2FVYm5+wfser
	 IsU0qp+/KbznF4zlnsgTFKh5nC9A9YFAx+WS3fZc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 431LF93M129414
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 1 Apr 2024 16:15:09 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 1
 Apr 2024 16:15:08 -0500
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 1 Apr 2024 16:15:08 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 431LF8lx129338;
	Mon, 1 Apr 2024 16:15:08 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rrOzk-0003W3-HS; Mon, 01 Apr 2024 16:15:08 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] configs: Add initial scarthgap configs
Date: Mon, 1 Apr 2024 16:15:08 -0500
Message-ID: <20240401211508.13475-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 01 Apr 2024 21:15:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15255

We are going to start testing our scarthgap layers (meta-arago and
meta-ti), so we need configs to work against.  All of the other layers
than have not created scarthgap yet are locked into master.  We will
update these files once the other layers have added support.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 configs/arago-scarthgap-config.txt      | 16 +++++++++
 configs/arago-scarthgap-next-config.txt | 47 +++++++++++++++++++++++++
 configs/arago-scarthgap-wip-config.txt  | 16 +++++++++
 3 files changed, 79 insertions(+)
 create mode 100644 configs/arago-scarthgap-config.txt
 create mode 100644 configs/arago-scarthgap-next-config.txt
 create mode 100644 configs/arago-scarthgap-wip-config.txt

diff --git a/configs/arago-scarthgap-config.txt b/configs/arago-scarthgap-config.txt
new file mode 100644
index 0000000..9af018c
--- /dev/null
+++ b/configs/arago-scarthgap-config.txt
@@ -0,0 +1,16 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,d3d16b47e17dc899e5298cff698dc32e5e639ab4,layers=meta-chromium
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,HEAD,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/arago-scarthgap-next-config.txt b/configs/arago-scarthgap-next-config.txt
new file mode 100644
index 0000000..3e1791c
--- /dev/null
+++ b/configs/arago-scarthgap-next-config.txt
@@ -0,0 +1,47 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+MOTD: NOTE:
+MOTD: NOTE: This config is reserved for CI/CD testing and requires manual intervention to build
+MOTD: NOTE:
+MOTD: NOTE: A few SRCREVs in the recipes might refer to commits on cicd/next branches for their
+MOTD: NOTE: repos.  These recipes will not build correctly without also a change in your local.conf
+MOTD: NOTE: to point the recipe to the appropriate cicd/next branch for that recipe.
+MOTD: NOTE:
+
+bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-next,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,d3d16b47e17dc899e5298cff698dc32e5e639ab4,layers=meta-chromium
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap-next,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,HEAD,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
+
+LOCALCONF:BRANCH:pn-ltp-ddt = "cicd"
+LOCALCONF:BRANCH:pn-cadence-mhdp-fw = "ti-linux-firmware-next"
+LOCALCONF:BRANCH:pn-cnm-wave-fw = "ti-linux-firmware-next"
+LOCALCONF:BRANCH:pn-goodix-fw = "ti-linux-firmware-next"
+LOCALCONF:BRANCH:pn-linux-ti-staging = "ti-linux-6.6.y-cicd"
+LOCALCONF:BRANCH:pn-linux-ti-staging-rt = "ti-rt-linux-6.6.y-cicd"
+LOCALCONF:BRANCH:pn-linux-ti-staging-systest = "ti-linux-6.6.y-cicd"
+LOCALCONF:BRANCH:pn-prueth-fw = "ti-linux-firmware-next"
+LOCALCONF:BRANCH:pn-prueth-fw-am65x = "ti-linux-firmware-next"
+LOCALCONF:BRANCH:pn-prueth-fw-am65x-sr2 = "ti-linux-firmware-next"
+LOCALCONF:BRANCH:pn-pruhsr-fw = "ti-linux-firmware-next"
+LOCALCONF:BRANCH:pn-pruhsr-fw-am65x-sr2 = "ti-linux-firmware-next"
+LOCALCONF:BRANCH:pn-pruprp-fw = "ti-linux-firmware-next"
+LOCALCONF:BRANCH:pn-prusw-fw = "ti-linux-firmware-next"
+LOCALCONF:BRANCH:pn-prusw-fw-am65x-sr2 = "ti-linux-firmware-next"
+LOCALCONF:BRANCH:pn-ti-dm-fw = "ti-linux-firmware-next"
+LOCALCONF:BRANCH:pn-ti-eth-fw = "ti-linux-firmware-next"
+LOCALCONF:GIT_BRANCH:pn-ti-k3-secdev = "master-next"
+LOCALCONF:BRANCH:pn-ti-rtos-firmware = "ti-linux-firmware-next"
+LOCALCONF:BRANCH:pn-ti-sci-fw = "ti-linux-firmware-next"
+LOCALCONF:BRANCH:pn-u-boot-ti-staging = "ti-u-boot-2024.04-next"
+LOCALCONF:BRANCH:pn-vxd-dec-fw = "ti-linux-firmware-next"
diff --git a/configs/arago-scarthgap-wip-config.txt b/configs/arago-scarthgap-wip-config.txt
new file mode 100644
index 0000000..20a407d
--- /dev/null
+++ b/configs/arago-scarthgap-wip-config.txt
@@ -0,0 +1,16 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-wip,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,d3d16b47e17dc899e5298cff698dc32e5e639ab4,layers=meta-chromium
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap-wip,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,HEAD,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
-- 
2.17.1


