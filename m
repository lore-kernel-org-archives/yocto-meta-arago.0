Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA0FCA0EFA
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:56 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.10049.1755127550195472336
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Rn8Vq94d;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPmVg1750895;
	Wed, 13 Aug 2025 18:25:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127548; i=@ti.com;
	bh=yv+AqxB+n3s+9kEqRArh7jv62fGcdtYNY6G9f/8nWNo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Rn8Vq94d/nu7m/GePBowO25TsdYuEnIDGuPIKXEB7Ek8JgR5CIyZA5gF1WiPrlekp
	 2CSc0QPdphDygilaqIL75jgAOhUTfgzOy7+R9hzLdK//p8A6voG9SeDCE0iYpxjUvw
	 gbf+Xr9kriwQ4pq5yP2lV8TMrvXKeaoj+mWuph54=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPm1l1412346
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:48 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:48 -0500
Received: from fllvdckhpci033.itg.ti.com (fllvdckhpci033.itg.ti.com [10.64.72.45])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPmeU3016411;
	Wed, 13 Aug 2025 18:25:48 -0500
Received: by fllvdckhpci033.itg.ti.com (Postfix, from userid 60899)
	id 4123A9F41F; Wed, 13 Aug 2025 18:25:48 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][dunfell][PATCH] optee-examples: update to 3.12.0
Date: Wed, 13 Aug 2025 18:25:48 -0500
Message-ID: <20250813232548.2175521-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20220304164540.29296-1-reatmon@ti.com>
References: <20220304164540.29296-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16421

meta-arago / na / 20220304164540.29296-1-reatmon

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
All patches passed



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
dunfell
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][dunfell][PATCH] optee-examples: update to 3.12=
.0
- Submitter: From: "Ryan Eatmon" <reatmon@ti.com>=0D
- Date: Date: Fri, 4 Mar 2022 10:45:40 -0600=0D
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 690a1969ce97b20e01df347d9df28892d=
7f7987a

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: dunfell-wip
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: meta-arago-distro: linux-firmware: remove cadence firmware
- Commit SHA: 86d19ced20934c8383c8a39f88d97c72e7e929ee

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
dunfell
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
FAIL
    ERROR: You need at least one space around the =3D for a variable assign=
ment. (ASSIGNMENT-1)
        meta-arago-distro/conf/distro/include/branding-amsdk.inc:27
            SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE =3D"${SRCIPK_GIT_COMMIT_MESSA=
GE}\\n\\nTo reduce the size of the SDK installer only a portion of the git =
commit\\nhistory has been preserved. Also links to remote branches and tags=
 do\\nnot exist in this copy of the repository.\\nTo fix this please run th=
e unshallow-repositories.sh\\nscript located in the sdk\'s bin directory\\n=
\\nThe script may take several minutes but you will then have a full copy o=
f\\nthe git repository including its entire git history.\\n"
=20=20=20=20
    ERROR: You need at least one space around the =3D for a variable assign=
ment. (ASSIGNMENT-1)
        meta-arago-distro/conf/distro/include/branding-processor-sdk.inc:26
            SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE =3D"${SRCIPK_GIT_COMMIT_MESSA=
GE}\\n\\nTo reduce the size of the SDK installer only a portion of the git =
commit\\nhistory has been preserved. Also links to remote branches and tags=
 do\\nnot exist in this copy of the repository.\\nTo fix this please run th=
e unshallow-repositories.sh\\nscript located in the sdk\'s bin directory\\n=
\\nThe script may take several minutes but you will then have a full copy o=
f\\nthe git repository including its entire git history.\\n"
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chro=
mium/chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chro=
mium/chromium-ozone-wayland/pulse.patch
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chro=
mium/chromium-ozone-wayland_%.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-benchmark/arm-benchmarks/arm-benchmarks_%=
.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-benchmark/glmark2/glmark2_git.bbappend
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-benchmark/lmbench/lmbench/0001-Makefile-A=
dd-TI-SDK-Modifications.patch
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-benchmark/nbench-byte/nbench-byte_%.bbapp=
end
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-benchmark/stream/stream_%.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-bsp/alsa-state/alsa-state.bbappend
=20=20=20=20
    ERROR: You need at least one space around the =3D for a variable assign=
ment. (ASSIGNMENT-1)
        meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0=
.bb:11
            BOOSTRAP_IMAGE=3D"tisdk-bootstrap-base-image"
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-bsp/grub/grub%.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-bsp/hplib/hplib-mod_git.bbappend
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-bsp/k2-fw-initrd/k2-fw-initrd_0.0.7.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-bsp/netboot-initrd/netboot-initrd-scripts=
_0.0.1.bb
=20=20=20=20
    ERROR: You need at least one space around the =3D for a variable assign=
ment. (ASSIGNMENT-1)
        meta-arago-distro/recipes-connectivity/initscript-telnetd/initscrip=
t-telnetd.bb:4
            PR =3D"r1"
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-connectivity/initscript-telnetd/initscrip=
t-telnetd.bb
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-connectivity/iproute2/iproute2/0013-iplin=
k-hsr-add-support-for-creating-PRP-device-simil.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-connectivity/iproute2/iproute2/0014-iplin=
k-hsr-prp-add-support-for-vlan-tagged-supervisi.patch
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-connectivity/iproute2/iproute2_5.5.0.bbap=
pend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-containers/docker/docker%.bbappend
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-core/base-files/base-files_%.bbappend
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-core/busybox/busybox/0001-rtcwake-Allow-p=
oweroff-with-rtcwake-command.patch
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-core/busybox/busybox_%.bbappend
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/busybox/softap-udhcpd-config_1.0.bb
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-core/dbus/dbus_%.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappe=
nd
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/meta/external-arm-secondary-sdk-tool=
chain.bb
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk-serv=
er.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/packagegroups/build-essential.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bas=
e-tisdk-server-extra.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bas=
e-tisdk.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bas=
e.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-con=
sole.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst=
-sdk-target.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst=
.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte=
.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sys=
vinit-boot.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons-sdk-host.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons-sdk-target.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-amsdk-sdk-host.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-amsdk.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-connectivity-sdk-target.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-connectivity.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-crypto-sdk-host.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-crypto-sdk-target.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-crypto.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-gtk-sdk-target.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-gtk.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-matrix-sdk-host.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-matrix.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-multimedia-sdk-target.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-opencl-sdk-host.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-opencl-sdk-target.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-opencl.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-qte-sdk-host.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-qte.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-recoveryfs.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-too=
lchain-tisdk-target.bb
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-core/packagegroups/packagegroup-cross-can=
adian.bbappend
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/packagegroups/ti-opencl.bb
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-core/psplash/psplash/0001-psplash-Add-Ara=
go-custom-color.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-core/psplash/psplash/0003-Updated-configu=
rability.patch.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-core/psplash/psplash/psplash-18bpp.patch
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-core/psplash/psplash_git.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-core/sysvinit/sysvinit_%.bbappend
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-core/thermal-init/thermal-init.bb
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-core/udev/eudev_%.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-devtools/cmake/cmake_%.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-devtools/opkg-utils/opkg-utils_%.bbappend
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-devtools/php/php/0001-php-native-Fix-host=
-contamination-issue.patch
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-devtools/php/php_%.bbappend
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0001-Return-non-zero=
-value-on-test-failure.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0002-cpuidle-Avoid-r=
elative-paths.patch
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-devtools/pm-qa/pm-qa_%.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-devtools/python/python3_%.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-devtools/strace/strace_5.5.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-devtools/swig/swig_%.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-extended/at/at_%.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-extended/bash/bash_%.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-extended/bc/bc_%.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappe=
nd
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-extended/shadow/shadow-securetty_%.bbappe=
nd
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-ru=
n-a-test-indefinitely.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-graphics/drm/libdrm/0001-libsync-add-supp=
ort-for-pre-v4.7-kernels.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-graphics/drm/libdrm/0002-Add-sync_fence_i=
nfo-and-sync_pt_info.patch
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-graphics/freetype/freetype_%.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-graphics/kmscube/kmscube_%.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-graphics/tslib/tslib_%.bbappend
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/00=
01-layer-add-surfaces-Add-screenId-as-an-argument.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/00=
02-layer-add-surfaces-surface-layer-management.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/fo=
rce-type-conversion.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-graphics/wayland/weston/0001-Add-soc-perf=
ormance-monitor-utilites.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-graphics/wayland/weston/0001-backend-drm-=
Select-plane-based-on-current-attached-C.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-graphics/wayland/weston/0002-weston-Allow=
-visual_id-to-be-0.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-graphics/wayland/weston/0003-weston-Fix-v=
irtual-keyboard-display-issue-for-QT5-ap.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-graphics/wayland/weston/0004-weston-Fix-t=
ouch-screen-crash-issue.patch
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-graphics/wayland/weston_8.0.0.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbapp=
end
=20=20=20=20
    ERROR: Incorrect capitialization for Upstream-Status: Upstream-status (=
UPSTREAM-STATUS-2)
        meta-arago-distro/recipes-kernel/cryptodev/files/0001-remove-VLA-us=
age-from-authenc.c.patch:10
            Upstream-status: Backport [e8263d2d682b06a1ee7bcb2791a7cf27a4af=
38e0]
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-kernel/kexec/kexec-tools_%.bbappend
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-kernel/linux/linux-arago.bb
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappe=
nd
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.b=
bappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bb=
append
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-head=
ers_5.10.bb
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-kernel/make-mod-scripts/make-mod-scripts_=
1.0.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-bad_1.16.%.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-base_1.16.%.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-good_1.16.%.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-multimedia/libtiff/tiff_%.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-protocols/net-snmp/net-snmp_%.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-qt/examples/qtwebbrowser_1.0.bbappend
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-qt/qt5/qtbase/0001-calculator-Add-exit-bu=
tton-for-non-window-environmen.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-qt/qt5/qtbase/0001-deform-Fix-how-control=
s-are-shown.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-qt/qt5/qtbase/0001-qtbase-plugins-platfor=
ms-eglfs_kms-fix-compiler-erro.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-qt/qt5/qtbase/0002-animatedtiles-Add-exit=
-button-for-non-window-environ.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-qt/qt5/qtbase/0002-deform-disable-opengl-=
button.patch
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-qt/qt5/qtdeclarative/0001-touchinteractio=
n.qml-Add-exit-button.patch
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-qt/qt5/qtdeclarative_git.bbappend
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-qt/qt5/qtwayland/0001-plugins-decorations=
-bradient-display-window-icon-onl.patch
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsContext3DQt.cpp.p=
atch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp=
.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-qt/qt5/qtwebkit/qttestbrowser.cpp.patch
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-security/optee/optee-examples_git.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-support/cifs/cifs-utils_6.10.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-support/libnl/libnl_3.5.0.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-support/opencv/opencv_%.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-support/rng-tools/rng-tools_%.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-support/syslog-ng/syslog-ng_%.bbappend
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-tisdk/ocl-rtos/opencl-examples-rtos_git.b=
bappend
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
_1.0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-re=
positories_1.0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.bb
=20=20=20=20
    ERROR: SUMMARY cannot be longer than 72 characters. (SUMMARY-2)
        meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb:1
            SUMMARY =3D "HMI demo for electronic vehicle charging station (=
EVSE) using QT QWidget tools"
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-apps/image-gallery/image-gallery_git.bb
=20=20=20=20
    ERROR: SUMMARY cannot be longer than 72 characters. (SUMMARY-2)
        meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-de=
tection_git.bb:1
            SUMMARY =3D "Predictive maintenance demo for anomaly detection =
using Recurrent Neural Network (RNN)"
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewe=
r_git.bb
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat/0002-Replac=
e-QtGui-with-QtWidgets-per-Qt5-migration-guide.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat/0003-Replac=
e-fromAscii-toAscii-with-fromLatin1-toLatin1-p.patch
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv-openc=
l-opengl-multithreaded_git.bb
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-=
of-tree-config.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/0001-headers.=
h-remove-math.h-include-that-breaks-aarch64.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool=
-size-m4.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_M=
anPage.patch
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/=
0001-hostapd-change-conf-file-for-better-oob-startup.patch
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.=
bb
=20=20=20=20
    ERROR: You need at least one space around the =3D for a variable assign=
ment. (ASSIGNMENT-1)
        meta-arago-extras/recipes-connectivity/hostap/hostap.inc:17
            INITSCRIPT_NAME=3D"hostapd"
=20=20=20=20
    ERROR: Incorrect capitialization for Upstream-Status: Upstream-status (=
UPSTREAM-STATUS-2)
        meta-arago-extras/recipes-connectivity/open62541/open62541/0001-CMa=
keLists-do-not-install-git-directories.patch:8
            Upstream-status: Pending
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-connectivity/vtun/vtun/08-gcc5-inline.pat=
ch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-connectivity/vtun/vtun/Add_search_path.pa=
tch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-connectivity/vtun/vtun/remove_strip.patch
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplican=
t/crypto_openssl.patch
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-extras/recipes-core/llvm/llvm-common.bbappend
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-core/llvm/ti-llvm3.6/0001-configure-Do-no=
t-check-build-executable-extension.patch
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_comma=
nd-Stop-matrix-when-running-a-GUI-demo.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_comma=
nd-workaround-for-GUI-apps-with-weston.patch
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/matrix/matrix-gui-analytics-demos_2.=
0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/matrix/matrix-gui-apps-images_2.0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-demo=
s_2.0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/matrix/matrix-gui-camera-loopback_2.=
0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/matrix/matrix-gui-display-control_2.=
0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-demos_2.0=
.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/matrix/matrix-gui-generic-pm_2.0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/matrix/matrix-gui-helper-scripts.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demo=
s_2.0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/matrix/matrix-gui-mc-demos_2.0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2=
.0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/matrix/matrix-gui-opencl-demos_2.0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0=
.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/matrix/matrix-gui-pru-demos_2.0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/matrix/matrix-gui-qt4-demos_2.0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.0=
.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/matrix/matrix-gui-touch-demos_2.0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/matrix/matrix-gui-usb-demos_2.0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/matrix/matrix-gui-utility-demos_2.0.=
bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/matrix/matrix-gui-v4l2-demos_2.0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/matrix/matrix-gui-video-analytics-de=
mos_2.0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/matrix/matrix-gui-wifi-demos_2.0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/meta/external-arm-sdk-toolchain.bb
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy=
.bbappend
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/oprofile-example/oprofile-example_gi=
t.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup=
-arago-qte-toolchain-host.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte=
-toolchain-target.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-sta=
ndalone-sdk-target.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-example=
s_git.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/ti-pru-sw-app-loader/ti-pru-sw-app-l=
oader_1.00.00.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/ti-pru-sw-edma-library/ti-pru-sw-edm=
a-library_1.00.00.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-core/ti-pru-sw-examples/ti-pru-sw-example=
s_1.00.00.bb
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules/0001-S=
earch-within-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-for-q.patch
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-devtools/dt/dt/no_aio.patch
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-devtools/dt/dt_17.07.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-devtools/flash-utility/flash-utility_1.6.=
0.0.bb
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-devtools/input-utils/input-utils/0001-aut=
oconf-fix-for-cross-compilation-for-ARM.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-devtools/input-utils/input-utils/fix-ftbf=
s-echo.patch
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-devtools/input-utils/input-utils_1.0.bb
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-devtools/ion/ion-tests/0001-CMakeLists.tx=
t-disable-phys-addr-for-now.patch
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-extras/recipes-devtools/mtd/mtd-utils_git.bbappend
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_1.=
0.1076.3.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2.=
5.2.0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.=
bb
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-graphics/devil/files/Remove-ILUT-dependen=
cy.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-graphics/glfw/glfw/0001-HACK-CMakeList.tx=
t-remove-check-for-Wayland-Egl-prov.patch
=20=20=20=20
    ERROR: You need at least one space around the =3D for a variable assign=
ment. (ASSIGNMENT-1)
        meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example=
-apps.bb:17
            SRCREV=3D"52466430609c402a9f1c0667ccf727d096336d0d"
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-Makefile.=
am-lblah-flags-belong-to-LDADD-not-LDFLAGS.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-graphics/ti-gc320-tests/files/0001-makefi=
le.linux.def-relax-assignment-of-CC-and-other-.patch
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.=
0.11.p7.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-graphics/wayland/wayland-protocols/0001-w=
ayland-drm-Add-wayland-drm-protocol-to-stable.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-graphics/wayland/wayland-protocols/0002-w=
ayland-drm-Update-to-version-2.patch
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-extras/recipes-graphics/wayland/wayland-protocols_%.bbap=
pend
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-kernel/recovery-kernel/recovery-kernel_1.=
0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_=
1.4.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-multimedia/demo-image-proc/demo-image-pro=
c_git.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-d=
emo_1.0.bb
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-dsp66/0001-Makefile-correct-use-of-CPP-CXX-and-other-standard-v.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-dsp66/0001-configure.ac-stop-using-export-symbols-regex.patch
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-dsp66_git.bb
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-ducati/0001-gstducati-configure.ac-stop-using-export-symbols-reg.patch
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-ducati_git.bb
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-hevc/0001-configure.ac-stop-using-export-symbols-regex.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-vpe/0001-gstvpe-configure.ac-stop-using-export-symbols-regex.patch
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-vpe_git.bb
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-bad/0001-gstdrmallocator-Add-DRM-allocator-support.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-bad/0001-waylandsink-Add-mouse-drag-and-drop-support.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-bad/0002-parsers-bug-fixes-on-parsers.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-bad/0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-bad/0004-waylandsink-Add-drm-support-in-waylandsink.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-bad/0005-waylandsink-Add-input-device-support.patch
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-bad_1.16.%.bbappend
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-good/0001-v4l2src-Check-for-drm-memory-support-in-try_import.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-good/0001-v4l2src-Increase-minimum-num-buffers-by-3.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-good/0002-v4l2src-Use-generic-dmabuf-import-in-v4l2src.patch
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-good_1.16.%.bbappend
=20=20=20=20
    ERROR: You need at least one space around the =3D for a variable assign=
ment. (ASSIGNMENT-1)
        meta-arago-extras/recipes-support/crash-recovery/crash-recovery.bb:6
            PR =3D"r1"
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-support/crash-recovery/crash-recovery.bb
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-support/devmem2/devmem2/0001-devmem2-supp=
ort-different-page-sizes-at-run-time.patch
=20=20=20=20
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-extras/recipes-support/devmem2/devmem2.bbappend
=20=20=20=20
    ERROR: You need at least one space around the =3D for a variable assign=
ment. (ASSIGNMENT-1)
        meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc:2
            BRANCH=3D"master"
=20=20=20=20
    ERROR: You need at least one space around the =3D for a variable assign=
ment. (ASSIGNMENT-1)
        meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb:12
            BRANCH=3D"hawking_dev"
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-support/loki/libloki/0001-include-loki-Th=
reads.h-return-statement-with-a-value.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-support/loki/libloki/0002-test-Function-F=
unctionTest.cpp-reference-to-bad_func.patch
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-support/makedumpfile/makedumpfile_1.5.0.bb
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-support/tensorflow-lite/files/apply-modif=
ication-for-tflite-1.15-to-eigen.patch
=20=20=20=20
    ERROR: SUMMARY cannot be longer than 72 characters. (SUMMARY-2)
        meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-d=
emo_git.bb:1
            SUMMARY =3D "Tensorflow Lite Demo with input and display via Op=
enCV and TIDL acceleration for AM5"
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1=
.15.bb
=20=20=20=20
    ERROR: You need at least one space around the =3D for a variable assign=
ment. (ASSIGNMENT-1)
        meta-arago-extras/recipes-ti/fftlib/fftlib_git.bb:63
            XDCPATH.=3D"${XDCCGROOT}/include;"
=20=20=20=20
    ERROR: You need at least one space around the =3D for a variable assign=
ment. (ASSIGNMENT-1)
        meta-arago-extras/recipes-ti/fftlib/fftlib_git.bb:64
            XDCPATH.=3D"${XDAIS_INSTALL_DIR}/packages;"
=20=20=20=20
    ERROR: You need at least one space around the =3D for a variable assign=
ment. (ASSIGNMENT-1)
        meta-arago-extras/recipes-ti/fftlib/fftlib_git.bb:65
            XDCPATH.=3D"${XDC_INSTALL_DIR}/packages;"
=20=20=20=20
    ERROR: You need at least one space around the =3D for a variable assign=
ment. (ASSIGNMENT-1)
        meta-arago-extras/recipes-ti/fftlib/fftlib_git.bb:66
            XDCPATH.=3D"${FFTLIB_INSTALL_DIR};"
=20=20=20=20
    ERROR: You need at least one space around the =3D for a variable assign=
ment. (ASSIGNMENT-1)
        meta-arago-extras/recipes-ti/fftlib/fftlib_git.bb:67
            XDCPATH.=3D"${FC_INSTALL_DIR}/packages;"
=20=20=20=20
    ERROR: You need at least one space around the =3D for a variable assign=
ment. (ASSIGNMENT-1)
        meta-arago-extras/recipes-ti/fftlib/fftlib_git.bb:68
            XDCPATH.=3D"${OMP_INSTALL_DIR}/packages;"
=20=20=20=20
    ERROR: You need at least one space around the =3D for a variable assign=
ment. (ASSIGNMENT-1)
        meta-arago-extras/recipes-ti/fftlib/fftlib_git.bb:69
            XDCPATH.=3D"${PDK_INSTALL_DIR}/packages;"
=20=20=20=20
    ERROR: You need at least one space around the =3D for a variable assign=
ment. (ASSIGNMENT-1)
        meta-arago-extras/recipes-ti/fftlib/fftlib_git.bb:70
            XDCPATH.=3D"${BIOS_INSTALL_DIR}/packages;"
=20=20=20=20
    ERROR: You need at least one space around the =3D for a variable assign=
ment. (ASSIGNMENT-1)
        meta-arago-extras/recipes-ti/fftlib/fftlib_git.bb:71
            XDCPATH.=3D"${EDMA3_LLD_INSTALL_DIR}/packages;"
=20=20=20=20
    ERROR: You need at least one space around the =3D for a variable assign=
ment. (ASSIGNMENT-1)
        meta-arago-extras/recipes-ti/fftlib/fftlib_git.bb:72
            XDCPATH.=3D"${DSPLIB_C66_INSTALL_DIR}/packages;"
=20=20=20=20
    ERROR: You need at least one space around the =3D for a variable assign=
ment. (ASSIGNMENT-1)
        meta-arago-extras/recipes-ti/fftlib/fftlib_git.bb:73
            XDCPATH.=3D"${IPC_INSTALL_DIR}/packages;"
=20=20=20=20
    ERROR: You need at least one space around the =3D for a variable assign=
ment. (ASSIGNMENT-1)
        meta-arago-extras/recipes-ti/fftlib/fftlib_git.bb:74
            XDCPATH.=3D"${LIBARCH_INSTALL_DIR}/packages;"
=20=20=20=20
    ERROR: You need at least one space around the =3D for a variable assign=
ment. (ASSIGNMENT-1)
        meta-arago-extras/recipes-ti/fftlib/fftlib_git.bb:75
            XDCPATH.=3D"${TI_OCL_INSTALL_DIR};"
=20=20=20=20
    ERROR: You need at least one space around the =3D for a variable assign=
ment. (ASSIGNMENT-1)
        meta-arago-extras/recipes-ti/fftlib/fftlib_git.bb:77
            XDCPATH.=3D"${FFTLIB_ROOT}"
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-ti/libarch/libarch-examples_git.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-ti/libarch/libarch_git.bb
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-ti/linalg/files/0001-Makefile-fix-toolcha=
in-variables.patch
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-ti/linalg/files/0001-Makefile-pass-PARALL=
EL_MAKE-variable-to-overwrite-j8.patch
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-ti/linalg/linalg-examples_git.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-ti/linalg/linalg_git.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-ti/netapi/netapi-test_git.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-ti/netapi/netapi_git.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-ti/ocl/clocl_git.bb
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-ti/ocl/ocl/0001-float_compute-matmpy-Link=
-with-libdl-to-resolve-link.patch
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-ti/ocl/ocl-gl-headers_git.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
=20=20=20=20
    ERROR: You must have a SUMMARY =3D "...". (SUMMARY-1)
        meta-arago-extras/recipes-ti/ocl/opencl_git.bb
=20=20=20=20
    ERROR: You need at least one space around the =3D for a variable assign=
ment. (ASSIGNMENT-1)
        meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb:36
            CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Dow=
nership"
=20=20=20=20
    ERROR: You need at least one space around the =3D for a variable assign=
ment. (ASSIGNMENT-1)
        meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb:37
            CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Dow=
nership"
=20=20=20=20
    ERROR: SUMMARY cannot be longer than 72 characters. (SUMMARY-2)
        meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb:1
            SUMMARY =3D "TIDL import tool for conversion of Caffe and TF mo=
dels into TI custom network format"
=20=20=20=20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-extras/recipes-ti/tiovx/files/0001-Fix-paths-for-Yocto-b=
uild-and-add-RTOS-build-var.patch
=20=20=20=20
    ERROR: SUMMARY cannot be longer than 72 characters. (SUMMARY-2)
        meta-arago-extras/recipes-ti/tiovx/tiovx-app-host.bb:1
            SUMMARY =3D "TI OpenVX HOST (Linux A15) conformance verificatio=
n application, Khronos tutorial example, and Host side IPC implementation"
=20=20=20=20
    ERROR: SUMMARY cannot be longer than 72 characters. (SUMMARY-2)
        meta-arago-extras/recipes-ti/tiovx/tiovx-sys-iface.bb:1
            SUMMARY =3D "TI OpenVX interface header files between TIOVX lib=
rary and HOST, DSP IPC side implementation"
=20=20=20=20
    ERROR: You need at least one space around the =3D for a variable assign=
ment. (ASSIGNMENT-1)
        meta-arago-extras/recipes-ti/tiovx/tiovx-sys.inc:3
            BRANCH=3D"master"
=20=20=20=20
=20=20=20=20
    Code Summary
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20=20=20=20
    ASSIGNMENT-1
    -------------------------------------------
      Variable assignments require whitespace around the assignment
      operator.
        FOO =3D "1"   not  FOO=3D"1"
        BAR +=3D "1"  not  BAR+=3D"1"
=20=20=20=20
    GUARD-1
    -------------------------------------------
      To maintain Yocto Compatibility, we need to add a guard around the
      .bbappend files for upstream recipes.  In the event that a layer
      is simply included in a build, it should not make changes to the
      recipe in a way that breaks the upstream recipe from doing what it
      sets out to do.  In order for our .bbappends to actually make
      changes, we need to gate them behind building something either the
      Arago distribution or building a TI machine.
=20=20=20=20
    SUMMARY-1
    -------------------------------------------
      All recipes require a SUMMARY.
=20=20=20=20
    SUMMARY-2
    -------------------------------------------
      The max length of the SUMMARY must be no more than 72 characters.
=20=20=20=20
    UPSTREAM-STATUS-1
    -------------------------------------------
      A recipe patch file is missing the required Upstream-Status.
=20=20=20=20
    UPSTREAM-STATUS-2
    -------------------------------------------
      The Upstream-Status is not correctly capitalized.




