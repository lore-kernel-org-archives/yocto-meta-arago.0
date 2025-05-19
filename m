Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED08AC54E93
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 17:01:04 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.414.1747674058580831930
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 19 May 2025 10:00:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Iuh7QltG;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54JH0up5517727
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 May 2025 12:00:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747674056;
	bh=MKB1HTVwnryZEUMYt22fgCmh7/xBzRVZ3aJolDJ3bYQ=;
	h=From:To:Subject:Date;
	b=Iuh7QltG1Hmmby+gVvdCf1COEmNhmAqeBlXkN5aIcFUcljaKKxf4ZC+EyVknUIVi8
	 C9PmJdMwAtw5ObHja2V0mh9UwLl5+2XO5iBCRSG5swgxU1GWQTnj8te1jrEvWanjHh
	 +K5NI15VZI7meUHxqyYM18AQJeN7wB6Flvwo0Ot0=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54JH0uRc085215
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 May 2025 12:00:56 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 May 2025 12:00:56 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 May 2025 12:00:56 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54JH0uNE110963;
	Mon, 19 May 2025 12:00:56 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uH3rD-0005pZ-WA; Mon, 19 May 2025 12:00:56 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 0/9] Cleanup for auto checking
Date: Mon, 19 May 2025 12:00:46 -0500
Message-ID: <20250519170055.22364-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 19 May 2025 17:01:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16212

We are going to be turning on an automated patch checker for the
meta-arago mailing list soon.  This is a series of small cleanups to
address issues that the checker is looking for so that everything is
clean at the start.

Ryan Eatmon (9):
  CLEANUP: Add missing SUMMARY
  CLEANUP: :append needs a space
  CLEANUP: Variable assignments need spaces
  chromium-ozone-wayland: Wrap the bbappend in a compliant manner
  nativesdk-buildtools-perl-dummy: Wrap the bbappend in a compliant
    manner
  qtbase: Wrap the bbappend in a compliant manner
  nbench-byte: Wrap the bbappend in a compliant manner
  kernel-selftest: Wrap the bbappend in a compliant manner
  check_yocto_rules: Add new config file

 check_yocto_rules.json                        | 27 ++++++++++
 .../distro/include/branding-processor-sdk.inc |  2 +-
 ...ppend => chromium-ozone-wayland-arago.inc} |  2 +-
 ...omium-ozone-wayland_130.0.6723.91.bbappend |  9 ++--
 .../initscript-telnetd/initscript-telnetd.bb  |  2 +-
 .../arago-gpl-notice/arago-gpl-notice.bb      |  2 +-
 .../meta/meta-toolchain-arago-tisdk.bb        |  2 +
 .../recipes-core/meta/meta-toolchain-arago.bb |  2 +
 .../packagegroups/build-essential.bb          |  2 +-
 ...kagegroup-arago-base-tisdk-server-extra.bb |  2 +-
 .../packagegroup-arago-console.bb             |  2 +-
 .../packagegroup-arago-gst-sdk-target.bb      |  2 +-
 .../packagegroups/packagegroup-arago-gst.bb   |  2 +-
 .../packagegroup-arago-initramfs.bb           |  1 +
 ...kagegroup-arago-tisdk-addons-sdk-target.bb |  2 +-
 .../packagegroup-arago-tisdk-addons.bb        |  2 +-
 ...packagegroup-arago-tisdk-amsdk-sdk-host.bb |  2 +-
 ...oup-arago-tisdk-connectivity-sdk-target.bb |  2 +-
 .../packagegroup-arago-tisdk-connectivity.bb  |  2 +-
 ...kagegroup-arago-tisdk-crypto-sdk-target.bb |  2 +-
 .../packagegroup-arago-tisdk-crypto.bb        |  2 +-
 ...packagegroup-arago-tisdk-gtk-sdk-target.bb |  2 +-
 .../packagegroup-arago-tisdk-gtk.bb           |  2 +-
 ...group-arago-tisdk-multimedia-sdk-target.bb |  2 +-
 ...ckagegroup-arago-toolchain-tisdk-target.bb |  2 +-
 .../wayland/weston-init-arago.inc             |  2 +-
 .../recipes-tisdk/tisdk-uenv/tisdk-uenv.bb    |  2 +-
 .../hostap/hostap-daemon-wl18xx.bb            |  5 +-
 .../recipes-connectivity/vtun/vtun_3.0.3.bb   |  1 +
 ...nativesdk-buildtools-perl-dummy-arago.inc} |  0
 .../nativesdk-buildtools-perl-dummy.bbappend  | 11 ++---
 .../oprofile-example/oprofile-example_git.bb  |  2 +-
 ...ackagegroup-arago-standalone-sdk-target.bb |  2 +-
 .../cmake/extra-cmake-modules.bb              |  2 +-
 .../ti-gc320-tests_5.0.11.p7.bb               |  2 +-
 .../tslib/ts-calibrate-init_1.0.bb            |  2 +-
 .../gstreamer1.0-plugins-ducati_git.bb        |  2 +-
 .../gstreamer1.0-plugins-vpe_git.bb           |  2 +-
 .../qt6/{qtbase_%.bbappend => qtbase-ti.inc}  |  0
 .../recipes-qt/qt6/qtbase_%.bbappend          |  5 +-
 .../recipes-benchmark/iperf/iperf_2.0.5.bb    |  1 +
 ...nch-byte_%.bbappend => nbench-byte-ti.inc} |  0
 .../nbench-byte/nbench-byte_%.bbappend        |  5 +-
 .../recipes-benchmark/stream/stream_5.10.bb   |  2 +-
 .../switch-config/switch-config_git.bb        |  2 +-
 .../openntpd/openntpd_6.8p1.bb                |  4 +-
 .../cpuloadgen/cpuloadgen_git.bb              |  2 +-
 .../input-utils/input-utils_1.0.bb            |  2 +-
 ...lftest.bbappend => kernel-selftest-ti.inc} |  0
 .../kernel-selftest/kernel-selftest.bbappend  | 49 ++-----------------
 50 files changed, 89 insertions(+), 99 deletions(-)
 create mode 100644 check_yocto_rules.json
 copy meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/{chromium-ozone-wayland_130.0.6723.91.bbappend => chromium-ozone-wayland-arago.inc} (66%)
 copy meta-arago-extras/recipes-core/meta/{nativesdk-buildtools-perl-dummy.bbappend => nativesdk-buildtools-perl-dummy-arago.inc} (100%)
 copy meta-arago-test/dynamic-layers/qt6-layer/recipes-qt/qt6/{qtbase_%.bbappend => qtbase-ti.inc} (100%)
 copy meta-arago-test/recipes-benchmark/nbench-byte/{nbench-byte_%.bbappend => nbench-byte-ti.inc} (100%)
 copy meta-arago-test/recipes-kernel/kernel-selftest/{kernel-selftest.bbappend => kernel-selftest-ti.inc} (100%)

-- 
2.17.1


