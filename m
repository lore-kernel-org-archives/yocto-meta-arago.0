Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A6E9C47088
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 21:41:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.224.1667598073314418619
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 14:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C1A5940D81
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:41:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k5i6f-q2_2cT for <meta-arago@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 21:41:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B35DE40D52
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:41:12 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 4DF97162035
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 17:41:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 00/14] 2022.10 sync up with Dunfell
Date: Fri,  4 Nov 2022 21:40:58 +0000
Message-Id: <20221104214112.1221365-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 04 Nov 2022 21:41:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14097

From: Denys Dmytriyenko <denys@konsulko.com>

Latest (as of end of October 2022) sync up of Dunfell changes to Kirkston=
e/master

Mostly cleanup of outdated components and general updates.

Andreas Dannenberg (1):
  meta-toolchain-arago: update executable fixup for Ubuntu 20.04+
    compatibility

Andrew Davis (9):
  ti-crypto-examples: Remove ti-crypto-examples
  big-data-ipc-demo: Merge include file and rename
  cmem: Remove Makefile_cmem-mod and cmem refrences
  ti-pru-sw: Remove old TI-PRU-SW examples and helpers
  ti-tisdk: Remove uio-module-drv kernel module
  packagegroup-arago-tisdk-addons: Make ti-rtos-firmware available for
    k3
  meta-arago: Use new J7 SoC names over specific board names
  qtbase-conf: fix name of WAYLAND_SHELL_INTEGRATION
  arago.conf: Specify omapl138 directly instead of omapl1

Denys Dmytriyenko (3):
  ltp-ddt: update to the latest
  HACK: packagegroup: disable tensorflow-lite
  HACK: packagegroup: disable HEVC gstreamer plugin

Randolph Sapp (1):
  img-pvr-sdk: Drop img-pvr-sdk and update matrix

 meta-arago-distro/conf/distro/arago.conf      |  2 +-
 .../recipes-core/images/tisdk-core-bundle.bb  |  3 +-
 .../recipes-core/images/tisdk-core-bundle.inc |  4 +-
 .../packagegroup-arago-gst-sdk-target.bb      |  2 +-
 .../packagegroups/packagegroup-arago-gst.bb   |  2 +-
 ...kagegroup-arago-tisdk-addons-sdk-target.bb | 51 +++++-------
 .../packagegroup-arago-tisdk-addons.bb        | 35 ++------
 .../packagegroup-arago-tisdk-crypto.bb        |  1 -
 .../packagegroup-arago-tisdk-matrix.bb        |  4 -
 .../recipes-core/packagegroups/ti-test.bb     |  4 +-
 .../recipes-qt/qt5/qtbase-conf/qt_env.sh      |  2 +-
 .../qt5/qtbase-conf/ti33x/qt_env.sh           |  2 +-
 .../big-data-ipc-demo/big-data-ipc-demo.inc   | 30 -------
 ...-linux_git.bb =3D> big-data-ipc-demo_git.bb} | 30 ++++---
 .../matrix/matrix-gui-3d-demos_2.0.bb         | 49 ++---------
 .../recipes-core/meta/meta-toolchain-arago.bb |  2 +-
 .../ti-crypto-examples_git.bb                 | 30 -------
 .../ti-pru-sw-app-loader_1.00.00.bb           | 26 ------
 .../ti-pru-sw-edma-library_1.00.00.bb         | 30 -------
 .../ti-pru-sw-examples_1.00.00.bb             | 31 -------
 .../ltp-ddt/ltp-ddt_20210524.bb               |  2 +-
 .../img-pvr-sdk/img-pvr-sdk_3.3.2.bb          | 83 -------------------
 .../gstreamer1.0-plugins-bad_1.16.%.bbappend  |  6 +-
 23 files changed, 67 insertions(+), 364 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-apps/big-data-ipc-demo/big-=
data-ipc-demo.inc
 rename meta-arago-extras/recipes-apps/big-data-ipc-demo/{big-data-ipc-de=
mo-linux_git.bb =3D> big-data-ipc-demo_git.bb} (54%)
 delete mode 100644 meta-arago-extras/recipes-core/ti-crypto-examples/ti-=
crypto-examples_git.bb
 delete mode 100644 meta-arago-extras/recipes-core/ti-pru-sw-app-loader/t=
i-pru-sw-app-loader_1.00.00.bb
 delete mode 100644 meta-arago-extras/recipes-core/ti-pru-sw-edma-library=
/ti-pru-sw-edma-library_1.00.00.bb
 delete mode 100644 meta-arago-extras/recipes-core/ti-pru-sw-examples/ti-=
pru-sw-examples_1.00.00.bb
 delete mode 100644 meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pv=
r-sdk_3.3.2.bb

--=20
2.25.1


