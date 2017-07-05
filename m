Return-Path: <jake@udc0866934>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 6248A529B0
	for <meta-arago@arago-project.org>;
	Wed,  5 Jul 2017 11:53:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v65BrXhL015612
	for <meta-arago@arago-project.org>; Wed, 5 Jul 2017 06:53:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499255613;
	bh=snXGN/8kHdtlPwnq/06dsCaJ7bnU67yM+d7tYQp3K4Q=;
	h=From:To:CC:Subject:Date;
	b=QRbHOB+syO7Nq6VnKo3UPdUFJ+ZGbI5Jql8SISot2ht6HXzxtE3ALkThbF9JZX2aC
	1i2oySOojt6LJGzI5CnHg1xQzbrQCSoi9lVyi6IfXtRouy3bwhuGfjQWnslDSfgMIH
	oUxspYcwY8chLZNS2tQUJpRd/6DEYk8MNtp1mStc=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v65BrXZI008214
	for <meta-arago@arago-project.org>; Wed, 5 Jul 2017 06:53:33 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 5 Jul 2017 06:53:32 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v65BrWOd013897;
	Wed, 5 Jul 2017 06:53:32 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1dSis8-0005of-AX; Wed, 05 Jul 2017 07:53:32 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 5 Jul 2017 07:53:29 -0400
Message-ID: <1499255609-22251-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [oe-layersetup][PATCH v2] processor-sdk-04.00.00.04: add Processor SDK 4.0.0.4 release config
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
X-List-Received-Date: Wed, 05 Jul 2017 11:53:33 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes:
* update meta-processor-sdk commit
* fetch meta-ti from git.yoctoproject.org

 configs/processor-sdk/processor-sdk-04.00.00.04-config.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-04.00.00.04-config.txt

diff --git a/configs/processor-sdk/processor-sdk-04.00.00.04-config.txt b/configs/processor-sdk/processor-sdk-04.00.00.04-config.txt
new file mode 100644
index 0000000..733ad99
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-04.00.00.04-config.txt
@@ -0,0 +1,14 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.32,bdf7a362ecdafd47f309b7a21feac4b94624f287,layers=
+meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,3d2f620a6a98b1b6abb1103d7dc986921436ed19,layers=
+meta-arago,git://arago-project.org/git/meta-arago.git,morty,b727bf8fce8e9cb5a6b5d5b48c45f0088e67eb53,layers=meta-arago-distro:meta-arago-extras
+meta-browser,git://github.com/OSSystems/meta-browser.git,master,880a7bd1d3b9a1b2003f5b0620350f03158bbd43,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,3601fd2c5306ac6d5d0d536e0be8cbb90da9b4c1,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,fe5c83312de11e80b85680ef237f8acb04b4b26e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
+meta-ti,git://git.yoctoproject.org/meta-ti,morty,41d6fdc0fe5ea6054616cfccda13baac3ff33791,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,d84874bad834657dd04ea69c35a74dd9dbd535b8,layers=meta-linaro-toolchain:meta-optee
+oe-core,git://git.openembedded.org/openembedded-core,morty,ddf907ca95a19f54785079b4396935273b3747f6,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
-- 
1.9.1


