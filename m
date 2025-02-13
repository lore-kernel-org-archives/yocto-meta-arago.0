Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23BB2C0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 15:11:12 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.13297.1739459466295560490
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Feb 2025 07:11:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=o7tPZauq;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51DFB5jQ4136742
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Feb 2025 09:11:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739459465;
	bh=MVpNMuFPLzU7v5z2Yv62/4dJKyOH/S0kss4kamo+ZbQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=o7tPZauqovCeroQ/UNS4oVO4hSOmX8yI68ctvfFlPXXOK/r6AZwwZoMnVqUyRugwx
	 tU0SkSZimgRg61Br2nX7woERAp8pCDIDutt60wQMF+m4o96BkoVmd7z0GL6lIpYx+6
	 YBIGXXhNOsCaQmjvOpico1UL/dRNwbpXaJo1VQ0k=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51DFB5Ct031900
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Feb 2025 09:11:05 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Feb 2025 09:11:05 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Feb 2025 09:11:04 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51DFB4ce031848;
	Thu, 13 Feb 2025 09:11:04 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tiaro-0007GH-RM; Thu, 13 Feb 2025 09:11:04 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v3] meta-arago-test: ltp-ddt: Update to 20250130
Date: Thu, 13 Feb 2025 09:11:04 -0600
Message-ID: <20250213151104.27858-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250213151104.27858-1-reatmon@ti.com>
References: <20250213151104.27858-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Feb 2025 15:11:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15847

Update the version of ltp-ddt to 2025.10.

In order to work towards Yocto compliance for this repository we need to
address the manner in which ltp-ddt was setup.  Copying in the ltp
recipe can create a situation where we are providing an alternative and
maybe newer version of ltp that would violate the compliance checks.  We
also do not want to copy all of the settings from the ltp recipe.  So we
can change it from a .bb to a .inc file which we can still require and
maintain the ltp-ddt recipe as an overlay on top the ltp settings.

Additionally, remove the PROVIDES for ltp since technically we are not
ltp proper.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v3: Limit this patch to master.  Send another patch for scarthgap.
v2: Rebase patch off of current master/scarthgap layout.
    Fix branch back to master post testing.
.../{ltp-ddt_20240129.bb => ltp-ddt_20250130.bb}  |  6 ++----
 .../ltp-ddt/ltp_20250130.inc}                     | 15 ++++++---------
 2 files changed, 8 insertions(+), 13 deletions(-)
 copy meta-arago-test/recipes-devtools/ltp-ddt/{ltp-ddt_20240129.bb => ltp-ddt_20250130.bb} (90%)
 copy meta-arago-test/{recipes-extended/ltp/ltp_20240129.bb => recipes-devtools/ltp-ddt/ltp_20250130.inc} (88%)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
similarity index 90%
copy from meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb
copy to meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
index f6861e0c..e78c40ac 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
@@ -1,20 +1,18 @@
 FILESEXTRAPATHS:prepend := "${COREBASE}/meta/recipes-extended/ltp/ltp:"
 FILESEXTRAPATHS:prepend := "${TITESTBASE}/recipes-extended/ltp/ltp:"
 
-require recipes-extended/ltp/ltp_${PV}.bb
+require ltp_${PV}.inc
 
 SUMMARY = "Embedded Linux Device Driver Tests based on Linux Test Project"
 HOMEPAGE = "https://git.ti.com/cgit/test-automation/ltp-ddt/"
 
-PROVIDES += "ltp"
-
 DEPENDS += "alsa-lib"
 
 PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "34602e4308a8c276bddfc0b4984b387037574f5c"
+SRCREV = "551467bce4c38af24c9c98843770fdfe45e1e253"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
diff --git a/meta-arago-test/recipes-extended/ltp/ltp_20240129.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20250130.inc
similarity index 88%
copy from meta-arago-test/recipes-extended/ltp/ltp_20240129.bb
copy to meta-arago-test/recipes-devtools/ltp-ddt/ltp_20250130.inc
index f8e6d398..1a353a19 100644
--- a/meta-arago-test/recipes-extended/ltp/ltp_20240129.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20250130.inc
@@ -24,31 +24,28 @@ TUNE_CCARGS:remove:x86-64 = "-mfpmath=sse"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "68737d20556d37364c95776044b1119c0912a36a"
+SRCREV = "a7c31dff7edc089a32e990765e12952cc4d7666a"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
-           file://0001-scenario_groups-default-remove-connectors.patch \
-           file://0001-sched_stress-Use-time_t-instead-of-long-for-type.patch \
            "
 
 S = "${WORKDIR}/git"
 
 inherit autotools-brokensep pkgconfig
 
-# Version 20220527 added KVM test infrastructure which currently fails to build with gold due to
+# Version 20220527 added KVM test infrastructure which currently fails to build with lld due to
 # SORT_NONE in linker script which isn't supported by gold:
 # https://sourceware.org/bugzilla/show_bug.cgi?id=18097
 # https://github.com/linux-test-project/ltp/commit/3fce2064b54843218d085aae326c8f7ecf3a8c41#diff-39268f0855c634ca48c8993fcd2c95b12a65b79e8d9fa5ccd6b0f5a8785c0dd6R36
-LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd', '', d)}"
-LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -fuse-ld=bfd', '', d)}"
+LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', '-fuse-ld=bfd', '', d)}"
 
 # After 0002-kvm-use-LD-instead-of-hardcoding-ld.patch
 # https://github.com/linux-test-project/ltp/commit/f94e0ef3b7280f886384703ef9019aaf2f2dfebb
-# it fails with gold also a bit later when trying to use *-payload.bin
+# it fails with lld also a bit later when trying to use *-payload.bin
 # http://errors.yoctoproject.org/Errors/Details/663094/
-# work around this by forcing .bfd linked in LD when ld-is-gold is in DISTRO_FEATURES
-KVM_LD = "${@bb.utils.contains_any('DISTRO_FEATURES', 'ld-is-gold ld-is-lld', '${HOST_PREFIX}ld.bfd${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}', '${LD}', d)}"
+# work around this by forcing .bfd linked in LD when ld-is-lld is in DISTRO_FEATURES
+KVM_LD = "${@bb.utils.contains_any('DISTRO_FEATURES', 'ld-is-lld', '${HOST_PREFIX}ld.bfd${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}', '${LD}', d)}"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-- 
2.17.1


