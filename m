Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id CBBFD52982
	for <meta-arago@arago-project.org>;
	Thu, 24 Sep 2020 00:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 509C640BD1;
	Thu, 24 Sep 2020 00:46:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id CE55AosXTcsC; Thu, 24 Sep 2020 00:46:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3E1F040B96;
	Thu, 24 Sep 2020 00:46:38 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 02E15173BAD;
	Wed, 23 Sep 2020 20:46:38 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 23 Sep 2020 20:46:37 -0400
Message-Id: <1600908397-39055-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [dunfell/master][PATCH] README: document dependency on meta-arm and meta-arm-toolchain, drop meta-linaro
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
X-List-Received-Date: Thu, 24 Sep 2020 00:49:37 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/README | 16 ++++++++--------
 meta-arago-extras/README | 12 ++++++------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta-arago-distro/README b/meta-arago-distro/README
index 42d189d..0e09d31 100644
--- a/meta-arago-distro/README
+++ b/meta-arago-distro/README
@@ -8,28 +8,28 @@ branch: master
 revision: HEAD
 layers: meta
 
-URI: git://git.openembedded.org/meta-openembedded
+URI: git://git.yoctoproject.org/meta-ti
 branch: master
 revision: HEAD
-layers: meta-oe, meta-networking, meta-python
 
-URI: git://git.yoctoproject.org/meta-ti
+URI: git://git.yoctoproject.org/meta-arm
 branch: master
 revision: HEAD
+layers: meta-arm, meta-arm-toolchain
 
-URI: https://github.com/meta-qt5/meta-qt5
+URI: git://git.openembedded.org/meta-openembedded
 branch: master
 revision: HEAD
+layers: meta-oe, meta-networking, meta-python
 
-URI: git://arago-project.org/git/meta-arago
+URI: https://github.com/meta-qt5/meta-qt5
 branch: master
 revision: HEAD
-layers: meta-arago-extras
 
-URI: git://git.linaro.org/openembedded/meta-linaro
+URI: git://arago-project.org/git/meta-arago
 branch: master
 revision: HEAD
-layers: meta-linaro-toolchain, meta-optee
+layers: meta-arago-extras
 
 Send pull requests to meta-arago@arago-project.org
 
diff --git a/meta-arago-extras/README b/meta-arago-extras/README
index ed7af0b..25d564e 100644
--- a/meta-arago-extras/README
+++ b/meta-arago-extras/README
@@ -8,23 +8,23 @@ branch: master
 revision: HEAD
 layers: meta
 
-URI: git://git.openembedded.org/meta-openembedded
+URI: git://git.yoctoproject.org/meta-ti
 branch: master
 revision: HEAD
-layers: meta-oe, meta-networking, meta-python
 
-URI: git://git.yoctoproject.org/meta-ti
+URI: git://git.yoctoproject.org/meta-arm
 branch: master
 revision: HEAD
+layers: meta-arm, meta-arm-toolchain
 
-URI: https://github.com/meta-qt5/meta-qt5
+URI: git://git.openembedded.org/meta-openembedded
 branch: master
 revision: HEAD
+layers: meta-oe, meta-networking, meta-python
 
-URI: git://git.linaro.org/openembedded/meta-linaro
+URI: https://github.com/meta-qt5/meta-qt5
 branch: master
 revision: HEAD
-layers: meta-linaro-toolchain
 
 Send pull requests to meta-arago@arago-project.org
 
-- 
2.7.4


