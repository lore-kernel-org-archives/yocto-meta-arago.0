Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 147FB529D4
	for <meta-arago@arago-project.org>;
	Wed,  6 Nov 2019 19:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9B19840BD2;
	Wed,  6 Nov 2019 19:02:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id cT-xM8YGnHYQ; Wed,  6 Nov 2019 19:02:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7FFD640BF0;
	Wed,  6 Nov 2019 19:02:30 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id A09D4170390;
	Wed,  6 Nov 2019 14:02:28 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  6 Nov 2019 14:02:15 -0500
Message-Id: <1573066944-48181-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [RFC][PATCH 0/9] Cleanup of packagegroups/images #1
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
X-List-Received-Date: Wed, 06 Nov 2019 19:03:54 -0000

This is the first set of patches that cleanup packagegroup and image recipes
for review. More to come...

Denys Dmytriyenko (9):
  packagegroup-arago-cross-canadian: deprecate in favor of upstream
    packagegroup-cross-canadian
  nativesdk-packagegroup-arago-sdk-host: deprecate in favor of upstream
    nativesdk-packagegroup-sdk-host
  arago-console-image: drop unused image recipe
  arago-console-image: drop unused image recipe
  arago-test-image: drop unused image recipe
  tisdk-recovery-rootfs-image: drop unused image recipe
  arago-core-tisdk-bundle: add missing deployment of J7 SYSFW binary
  arago-tiny-image: simplify by re-using arago-image.inc
  arago-image.inc: unbreak populate_sdk task

 .../recipes-core/images/arago-base-image.bb        |  8 -----
 .../recipes-core/images/arago-console-image.bb     | 13 --------
 .../recipes-core/images/arago-core-tisdk-bundle.bb |  3 +-
 .../recipes-core/images/arago-image.inc            |  9 +++---
 .../recipes-core/images/arago-test-image.bb        | 19 ------------
 .../recipes-core/images/arago-tiny-image.bb        | 35 ++--------------------
 .../images/tisdk-recovery-rootfs-image.bb          | 10 -------
 ...append => packagegroup-cross-canadian.bbappend} |  0
 .../recipes-core/meta/meta-toolchain-arago.bb      | 10 ++-----
 .../nativesdk-packagegroup-arago-sdk-host.bb       | 21 -------------
 .../nativesdk-packagegroup-arago-tisdk-host.bb     |  5 +++-
 .../packagegroup-arago-cross-canadian.bb           | 20 -------------
 12 files changed, 16 insertions(+), 137 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/images/arago-base-image.bb
 delete mode 100644 meta-arago-distro/recipes-core/images/arago-console-image.bb
 delete mode 100644 meta-arago-distro/recipes-core/images/arago-test-image.bb
 delete mode 100644 meta-arago-distro/recipes-core/images/tisdk-recovery-rootfs-image.bb
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-cross-canadian.bbappend => packagegroup-cross-canadian.bbappend} (100%)
 delete mode 100644 meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
 delete mode 100644 meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bb

-- 
2.7.4


