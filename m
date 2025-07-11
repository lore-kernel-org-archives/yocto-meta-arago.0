Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1849EC83F1A
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 18:25:40 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.20804.1752258332298375265
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 11 Jul 2025 11:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E5D2A40CC0;
	Fri, 11 Jul 2025 18:25:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 81xQCxFai3yK; Fri, 11 Jul 2025 18:25:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8F3A640C81;
	Fri, 11 Jul 2025 18:25:26 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id DF03716BB6F; Fri, 11 Jul 2025 14:25:25 -0400 (EDT)
Date: Fri, 11 Jul 2025 14:25:25 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Andrew Davis <afd@ti.com>
Cc: reatmon@ti.com, Aniket Limaye <a-limaye@ti.com>, c-vankar@ti.com,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][scarthgap][PATCH] meta-arago-distro: ethtool: Add
 patch to dump CPSW registers for K3 SoCs
Message-ID: <20250711182525.GE24899@denix.org>
References: <20250707090720.750031-1-a-limaye@ti.com>
 <20250711003211.GC24899@denix.org>
 <18510E7F95B2F518.7957@lists.yoctoproject.org>
 <845800a0-5291-4d12-b7ae-541172c8f32a@ti.com>
 <cb777985-0a8f-4c04-b204-a8dcf2fb47e8@ti.com>
 <989ddb02-8935-4ee8-a41c-c6aea2df4047@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <989ddb02-8935-4ee8-a41c-c6aea2df4047@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 11 Jul 2025 18:25:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16292

On Fri, Jul 11, 2025 at 01:10:58PM -0500, Andrew Davis wrote:
> On 7/11/25 12:31 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> >
> >
> >On 7/10/2025 9:35 PM, Aniket Limaye wrote:
> >>Denys, Ryan,
> >>
> >>On 11/07/25 07:04, Aniket Limaye via lists.yoctoproject.org wrote:
> >>>
> >>>
> >>>On 11/07/25 06:02, Denys Dmytriyenko wrote:
> >>>>I wonder if the patch itself is malformed - specifically if it has =
windows
> >>>>newlines that result in interlaced empty lines in mutt on Linux, as=
 seen
> >>>>below. While .inc and .bbappend seem fine.
> >>>>
> >>>
> >>>Chintan, Yeah looks like the patchfile I added was not properly form=
atted. I will try resending this one quickly.
> >>>
> >>
> >>Not sure what caused the weird encoding in the first place...
> >>
> >>Sent v2 here: https://lists.yoctoproject.org/g/meta-arago/message/162=
82
> >
> >What's really odd is that applying the v1 patch resulted in a perfectl=
y fine file in the repo.=A0 I applied this patch yesterday and the patch =
file looks fine.=A0 Or am I wrong.=A0 The issue is that this patch is alr=
eady on next and is going through CICD promotion right now.=A0 If this is=
 a problem we may need to submit a follow on patch to fix it.=A0 Can some=
one check the current file in the repo and verify?
> >
> >
>=20
> $ git checkout 83558083
> $ file meta-arago-distro/recipes-extended/ethtool/ethtool/0001-pretty-a=
dd-support-for-ti-k3-cpsw-registers-and-ale-table-dump.patch
> meta-arago-distro/recipes-extended/ethtool/ethtool/0001-pretty-add-supp=
ort-for-ti-k3-cpsw-registers-and-ale-table-dump.patch: unified diff outpu=
t, ASCII text
>=20
> Looks fine to me, all those odd newlines must have been removed by
> whatever tool you used to apply the email.

Patchwork might have handled those. I see the issue locally in mutt and o=
n the=20
list, but not in patchwork.

v1 with extra newlines:
https://lists.yoctoproject.org/g/meta-arago/message/16277

v2 fixed:
https://lists.yoctoproject.org/g/meta-arago/message/16282

patchwork for v1 that doesn't show extra newlines in the patch, but shows=
=20
them in all comments:
https://patchwork.yoctoproject.org/project/arago/patch/20250707090720.750=
031-1-a-limaye@ti.com/


> Andrew
>=20
> >
> >>
> >>>Thanks,
> >>>Aniket
> >>>
> >>>>
> >>>>On Mon, Jul 07, 2025 at 02:37:20PM +0530, Aniket Limaye via lists.y=
octoproject.org wrote:
> >>>>>Add support for TI K3 CPSW register and ALE table dump through the
> >>>>>ethtool userspace utility.
> >>>>>
> >>>>>Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> >>>>>---
> >>>>>=A0 .../ethtool/ethtool-arago.inc=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0=A0 8 +
> >>>>>=A0 ...k3-cpsw-registers-and-ale-table-dump.patch | 574 ++++++++++=
++++++++
> >>>>>=A0 .../ethtool/ethtool_%.bbappend=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 |=A0=A0 4 +
> >>>>>=A0 3 files changed, 586 insertions(+)
> >>>>>=A0 create mode 100644 meta-arago-distro/recipes-extended/ethtool/=
ethtool-arago.inc
> >>>>>=A0 create mode 100644 meta-arago-distro/recipes-extended/ethtool/=
ethtool/pretty-add-support-for-ti-k3-cpsw-registers-and-ale-table-dump.pa=
tch
> >>>>>=A0 create mode 100644 meta-arago-distro/recipes-extended/ethtool/=
ethtool_%.bbappend
> >>>>>
> >>>>>diff --git a/meta-arago-distro/recipes-extended/ethtool/ethtool-ar=
ago.inc b/meta-arago-distro/recipes-extended/ethtool/ethtool-arago.inc
> >>>>>new file mode 100644
> >>>>>index 00000000..5fd05a85
> >>>>>--- /dev/null
> >>>>>+++ b/meta-arago-distro/recipes-extended/ethtool/ethtool-arago.inc
> >>>>>@@ -0,0 +1,8 @@
> >>>>>+PR:append =3D ".arago0"
> >>>>>+
> >>>>>+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/ethtool:"
> >>>>>+
> >>>>>+SRC_URI:append =3D " \
> >>>>>+ file://pretty-add-support-for-ti-k3-cpsw-registers-and-ale-table=
-dump.patch \
> >>>>>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "
> >>>>>+
> >>>>>diff --git a/meta-arago-distro/recipes-extended/ethtool/ethtool/pr=
etty-add-support-for-ti-k3-cpsw-registers-and-ale-table-dump.patch b/meta=
-arago-distro/recipes-extended/ethtool/ethtool/pretty-add-support-for-ti-=
k3-cpsw-registers-and-ale-table-dump.patch
> >>>>>new file mode 100644
> >>>>>index 00000000..a14089b4
> >>>>>--- /dev/null
> >>>>>+++ b/meta-arago-distro/recipes-extended/ethtool/ethtool/pretty-ad=
d-support-for-ti-k3-cpsw-registers-and-ale-table-dump.patch
> >>>>>@@ -0,0 +1,574 @@
> >>>>>+From: Chintan Vankar <c-vankar@ti.com>
> >>>>>
> >>>>>+Subject: [PATCH] pretty: Add support for TI K3 CPSW registers and=
 ALE table dump
> >>>>>
> >>>>>+Date: Thu, 3 Jul 2025 12:02:46 +0530
> >>>>>
> >>>>>+
> >>>>>
> >>>>>+Add support to dump CPSW registers and ALE table for the CPSW ins=
tances on
> >>>>>
> >>>>>+K3 SoCs that are configured using the am65-cpsw-nuss.c device-dri=
ver in
> >>>>>
> >>>>>+Linux.
> >>>>>
> >>>>>+
> >>>>>
> >>>>>+Upstream-Status: Submitted [https://lore.kernel.org/all/202507051=
34807.3514891-1-c-vankar@ti.com/]
> >>>>>
> >>>>>+Signed-off-by: Chintan Vankar <c-vankar@ti.com>
> >>>>>
> >>>>>+---
> >>>>>
> >>>>>+ Makefile.am=A0=A0=A0=A0=A0 |=A0=A0 2 +-
> >>>>>
> >>>>>+ am65-cpsw-nuss.c | 510 +++++++++++++++++++++++++++++++++++++++++=
++++++
> >>>>>
> >>>>>+ ethtool.c=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 1 +
> >>>>>
> >>>>>+ internal.h=A0=A0=A0=A0=A0=A0 |=A0=A0 3 +
> >>>>>
> >>>>>+ 4 files changed, 515 insertions(+), 1 deletion(-)
> >>>>>
> >>>>>+ create mode 100644 am65-cpsw-nuss.c
> >>>>>
> >>>>>+
> >>>>>
> >>>>>+diff --git a/Makefile.am b/Makefile.am
> >>>>>
> >>>>>+index b9e06ad..fe6afcb 100644
> >>>>>
> >>>>>+--- a/Makefile.am
> >>>>>
> >>>>>++++ b/Makefile.am
> >>>>>
> >>>>>+@@ -23,7 +23,7 @@ ethtool_SOURCES +=3D \
> >>>>>
> >>>>>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 smsc911x.c at76c50x-usb.c sfc.c st=
mmac.c=A0=A0=A0 \
> >>>>>
> >>>>>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sff-common.c sff-common.h sfpid.c =
sfpdiag.c=A0=A0=A0 \
> >>>>>
> >>>>>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ixgbevf.c tse.c vmxnet3.c qsfp.c q=
sfp.h fjes.c lan78xx.c \
> >>>>>
> >>>>>+-=A0=A0=A0=A0=A0=A0=A0=A0=A0 igc.c cmis.c cmis.h bnxt.c cpsw.c la=
n743x.c hns3.c
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0 igc.c cmis.c cmis.h bnxt.c cpsw.c la=
n743x.c hns3.c am65-cpsw-nuss.c
> >>>>>
> >>>>>+ endif
> >>>>>
> >>>>>+
> >>>>>
> >>>>>+ if ENABLE_BASH_COMPLETION
> >>>>>
> >>>>>+diff --git a/am65-cpsw-nuss.c b/am65-cpsw-nuss.c
> >>>>>
> >>>>>+new file mode 100644
> >>>>>
> >>>>>+index 0000000..de8e3e9
> >>>>>
> >>>>>+--- /dev/null
> >>>>>
> >>>>>++++ b/am65-cpsw-nuss.c
> >>>>>
> >>>>>+@@ -0,0 +1,510 @@
> >>>>>
> >>>>>++// SPDX-License-Identifier: GPL-2.0-only OR MIT
> >>>>>
> >>>>>++/* Code to dump registers and ALE table for the CPSW instances o=
n K3 SoCs that are configured using
> >>>>>
> >>>>>++ * the am65-cpsw-nuss device-driver in Linux.
> >>>>>
> >>>>>++ *
> >>>>>
> >>>>>++ * Copyright (C) 2025 Texas Instruments
> >>>>>
> >>>>>++ * Author: Chintan Vankar <c-vankar@ti.com>
> >>>>>
> >>>>>++ */
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++#include <stdio.h>
> >>>>>
> >>>>>++#include <string.h>
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++#include "internal.h"
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++#define ALE_ENTRY_BITS=A0=A0=A0=A0=A0=A0=A0=A0=A0 74
> >>>>>
> >>>>>++#define ALE_ENTRY_WORDS=A0=A0=A0=A0=A0=A0=A0=A0 DIV_ROUND_UP(ALE=
_ENTRY_BITS, 32)
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++#define ALE_ENTRY_FREE=A0=A0=A0=A0=A0=A0=A0 0x0
> >>>>>
> >>>>>++#define ALE_ENTRY_ADDR=A0=A0=A0=A0=A0=A0=A0 0x1
> >>>>>
> >>>>>++#define ALE_ENTRY_VLAN=A0=A0=A0=A0=A0=A0=A0 0x2
> >>>>>
> >>>>>++#define ALE_ENTRY_VLAN_ADDR=A0=A0=A0 0x3
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++#define BIT(nr)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (1 << (nr))
> >>>>>
> >>>>>++#define BITMASK(bits)=A0=A0=A0=A0=A0=A0=A0 (BIT(bits) - 1)
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++/* ALE word specifiers */
> >>>>>
> >>>>>++#define NUM_ALE_WORDS=A0=A0=A0 2
> >>>>>
> >>>>>++#define ALE_WORD_LEN=A0=A0=A0 32
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++/* MAC address specifiers */
> >>>>>
> >>>>>++#define MAC_START_BIT=A0=A0=A0 40
> >>>>>
> >>>>>++#define MAC_OCTET_LEN=A0=A0=A0 8
> >>>>>
> >>>>>++#define NUM_MAC_OCTET=A0=A0=A0 6
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++/* RTL version specifiers */
> >>>>>
> >>>>>++#define RTL_VERSION_MASK=A0=A0=A0 0xF800
> >>>>>
> >>>>>++#define CPSW2G_RTL_VERSION=A0=A0=A0 0x3800
> >>>>>
> >>>>>++#define CPSW3G_RTL_VERSION=A0=A0=A0 0x0
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++/* OUI address uses format xx:xx:xx, use OUI shift as 16 bits an=
d MASK as 0xFF to parse the same*/
> >>>>>
> >>>>>++#define OUI_ADDR_SHIFT=A0=A0=A0=A0=A0=A0=A0 16
> >>>>>
> >>>>>++#define OUI_ADDR_MASK=A0=A0=A0=A0=A0=A0=A0 0xFF
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++/* VLAN entry specifiers */
> >>>>>
> >>>>>++#define VLAN_INNER_ENTRY=A0=A0=A0 0x0
> >>>>>
> >>>>>++#define VLAN_OUTER_ENTRY=A0=A0=A0 0x2
> >>>>>
> >>>>>++#define VLAN_ETHERTYPE_ENTRY=A0=A0=A0 0x4
> >>>>>
> >>>>>++#define VLAN_IPV4_ENTRY=A0=A0=A0=A0=A0=A0=A0 0x6
> >>>>>
> >>>>>++#define VLAN_IPV6_ENTRY_MASK=A0=A0=A0 0x1
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++/* VLAN Inner/Outer table entry MASKs and SHIFTs*/
> >>>>>
> >>>>>++#define NOLEARN_FLAG_SHIFT=A0=A0=A0=A0=A0=A0=A0 2
> >>>>>
> >>>>>++#define NOLEARN_FLAG_MASK=A0=A0=A0=A0=A0=A0=A0 0x1FF
> >>>>>
> >>>>>++#define INGRESS_CHECK_SHIFT=A0=A0=A0=A0=A0=A0=A0 1
> >>>>>
> >>>>>++#define INGRESS_CHECK_MASK=A0=A0=A0=A0=A0=A0=A0 0x1
> >>>>>
> >>>>>++#define VLAN_ID_SHIFT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 16
> >>>>>
> >>>>>++#define VLAN_ID_MASK=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0xFFF
> >>>>>
> >>>>>++#define NOFRAG_FLAG_SHIFT_2G=A0=A0=A0=A0=A0=A0=A0 12
> >>>>>
> >>>>>++#define NOFRAG_FLAG_MASK_2G=A0=A0=A0=A0=A0=A0=A0 0x1
> >>>>>
> >>>>>++#define NOFRAG_FLAG_SHIFT=A0=A0=A0=A0=A0=A0=A0 15
> >>>>>
> >>>>>++#define NOFRAG_FLAG_MASK=A0=A0=A0=A0=A0=A0=A0 0x1
> >>>>>
> >>>>>++#define REG_MASK_SHIFT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4
> >>>>>
> >>>>>++#define REG_MASK_MASK=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x1FF
> >>>>>
> >>>>>++#define PKT_EGRESS_W1_MASK=A0=A0=A0=A0=A0=A0=A0 0x1
> >>>>>
> >>>>>++#define PKT_EGRESS_W1_OFFSET=A0=A0=A0=A0=A0=A0=A0 512
> >>>>>
> >>>>>++#define PKT_EGRESS_SHIFT=A0=A0=A0=A0=A0=A0=A0 24
> >>>>>
> >>>>>++#define PKT_EGRESS_MASK_2G=A0=A0=A0=A0=A0=A0=A0 0x3
> >>>>>
> >>>>>++#define PKT_EGRESS_MASK=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x1FF
> >>>>>
> >>>>>++#define UNREG_MASK_SHIFT_2G=A0=A0=A0=A0=A0=A0=A0 20
> >>>>>
> >>>>>++#define UNREG_MASK_MASK_2G=A0=A0=A0=A0=A0=A0=A0 0x7
> >>>>>
> >>>>>++#define UNREG_MASK_SHIFT=A0=A0=A0=A0=A0=A0=A0 12
> >>>>>
> >>>>>++#define UNREG_MASK_MASK=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x1FF
> >>>>>
> >>>>>++#define NXT_HDR_CTRL_SHIFT_2G=A0=A0=A0=A0=A0=A0=A0 19
> >>>>>
> >>>>>++#define NXT_HDR_CTRL_MASK_2G=A0=A0=A0=A0=A0=A0=A0 0x1
> >>>>>
> >>>>>++#define NXT_HDR_CTRL_SHIFT=A0=A0=A0=A0=A0=A0=A0 23
> >>>>>
> >>>>>++#define NXT_HDR_CTRL_MASK=A0=A0=A0=A0=A0=A0=A0 0x1
> >>>>>
> >>>>>++#define VLAN_MEMBER_LIST_MASK_2G=A0=A0=A0 0x3
> >>>>>
> >>>>>++#define VLAN_MEMBER_LIST_MASK=A0=A0=A0=A0=A0=A0=A0 0x1FF
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++/* VLAN IPv4 entry MASKs and SHIFTs*/
> >>>>>
> >>>>>++#define IPV4_ADDR_OCT1_SHIFT=A0=A0=A0 24
> >>>>>
> >>>>>++#define IPV4_ADDR_OCT2_SHIFT=A0=A0=A0 16
> >>>>>
> >>>>>++#define IPV4_ADDR_OCT3_SHIFT=A0=A0=A0 8
> >>>>>
> >>>>>++#define IPV4_ADDR_MASK=A0=A0=A0=A0=A0=A0=A0 0xFF
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++/* VLAN IPv6 entry MASKs and SHIFTs*/
> >>>>>
> >>>>>++#define IPV6_HIGH_ENTRY_FLAG=A0=A0=A0 0x40
> >>>>>
> >>>>>++#define IPV6_IGNMCBITS_MASK=A0=A0=A0 0xFF
> >>>>>
> >>>>>++#define IPV6_HADDR_W1_SHIFT=A0=A0=A0 12
> >>>>>
> >>>>>++#define IPV6_HADDR_W1_MASK_1=A0=A0=A0 0xFFFF
> >>>>>
> >>>>>++#define IPV6_HADDR_W1_MASK_2=A0=A0=A0 0xFFF
> >>>>>
> >>>>>++#define IPV6_HADDR_W0_SHIFT_1=A0=A0=A0 28
> >>>>>
> >>>>>++#define IPV6_HADDR_W0_MASK_1=A0=A0=A0 0xF
> >>>>>
> >>>>>++#define IPV6_HADDR_W0_SHIFT_2=A0=A0=A0 12
> >>>>>
> >>>>>++#define IPV6_HADDR_W0_MASK_2=A0=A0=A0 0xFFFF
> >>>>>
> >>>>>++#define IPV6_LADDR_W2_SHIFT=A0=A0=A0 4
> >>>>>
> >>>>>++#define IPV6_LADDR_W2_MAKS=A0=A0=A0 0xF
> >>>>>
> >>>>>++#define IPV6_LADDR_W1_SHIFT=A0=A0=A0 16
> >>>>>
> >>>>>++#define IPV6_LADDR_W1_MASK_1=A0=A0=A0 0xFFF
> >>>>>
> >>>>>++#define IPV6_LADDR_W1_MASK=A0=A0=A0 0xFFFF
> >>>>>
> >>>>>++#define IPV6_LADDR_W0_SHIFT=A0=A0=A0 16
> >>>>>
> >>>>>++#define IPV6_LADDR_W0_MASK=A0=A0=A0 0xFFFF
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++/**
> >>>>>
> >>>>>++ * Since there are different instances of CPSW (namely cpsw2g, c=
psw3g, cpsw5g and cpsw9g)
> >>>>>
> >>>>>++ * some register offsets differ to get some parameters for ALE t=
able, parse rtl_version
> >>>>>
> >>>>>++ * from ALE_MOD_VER register to determine which instance is bein=
g used.
> >>>>>
> >>>>>++ */
> >>>>>
> >>>>>++u32 rtl_version;
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++static inline int cpsw_ale_get_field(u32 *ale_entry, u32 start, =
u32 bits)
> >>>>>
> >>>>>++{
> >>>>>
> >>>>>++=A0=A0=A0 int idx;
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0 idx=A0=A0=A0 =3D start / ALE_WORD_LEN;
> >>>>>
> >>>>>++=A0=A0=A0 start -=3D idx * ALE_WORD_LEN;
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0 /**
> >>>>>
> >>>>>++=A0=A0=A0=A0 * ALE words are stored in order word2, word1 and wo=
rd0, flip the word to parse in numeric
> >>>>>
> >>>>>++=A0=A0=A0=A0 * order
> >>>>>
> >>>>>++=A0=A0=A0=A0 */
> >>>>>
> >>>>>++=A0=A0=A0 idx=A0=A0=A0 =3D NUM_ALE_WORDS - idx; /* flip */
> >>>>>
> >>>>>++=A0=A0=A0 return (ale_entry[idx] >> start) & BITMASK(bits);
> >>>>>
> >>>>>++}
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++#define DEFINE_ALE_FIELD(name, start, bits)=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 \
> >>>>>
> >>>>>++static inline int cpsw_ale_get_##name(u32 *ale_entry)=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 \
> >>>>>
> >>>>>++{=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
> >>>>>
> >>>>>++=A0=A0=A0 return cpsw_ale_get_field(ale_entry, start, bits);=A0=A0=
=A0=A0=A0=A0=A0 \
> >>>>>
> >>>>>++}
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++DEFINE_ALE_FIELD(entry_type,=A0=A0=A0=A0=A0=A0=A0 60,=A0=A0=A0 2=
)
> >>>>>
> >>>>>++DEFINE_ALE_FIELD(vlan_id,=A0=A0=A0=A0=A0=A0=A0 48,=A0=A0=A0 12)
> >>>>>
> >>>>>++DEFINE_ALE_FIELD(mcast_state,=A0=A0=A0=A0=A0=A0=A0 62,=A0=A0=A0 =
2)
> >>>>>
> >>>>>++DEFINE_ALE_FIELD(port_mask,=A0=A0=A0=A0=A0=A0=A0 66,=A0=A0=A0 9)
> >>>>>
> >>>>>++DEFINE_ALE_FIELD(super,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 65,=A0=A0=
=A0 1)
> >>>>>
> >>>>>++DEFINE_ALE_FIELD(agable,=A0=A0=A0=A0=A0=A0=A0 62,=A0=A0=A0 1)
> >>>>>
> >>>>>++DEFINE_ALE_FIELD(touched,=A0=A0=A0=A0=A0=A0=A0 63,=A0=A0=A0 1)
> >>>>>
> >>>>>++DEFINE_ALE_FIELD(ucast_type,=A0=A0=A0=A0=A0=A0=A0 62,=A0=A0=A0 2=
)
> >>>>>
> >>>>>++DEFINE_ALE_FIELD(port_num,=A0=A0=A0=A0=A0=A0=A0 66,=A0=A0=A0 4)
> >>>>>
> >>>>>++DEFINE_ALE_FIELD(port_num_2g,=A0=A0=A0=A0=A0=A0=A0 66,=A0=A0=A0 =
1)
> >>>>>
> >>>>>++DEFINE_ALE_FIELD(port_num_3g,=A0=A0=A0=A0=A0=A0=A0 66,=A0=A0=A0 =
2)
> >>>>>
> >>>>>++DEFINE_ALE_FIELD(blocked,=A0=A0=A0=A0=A0=A0=A0 65,=A0=A0=A0 1)
> >>>>>
> >>>>>++DEFINE_ALE_FIELD(secure,=A0=A0=A0=A0=A0=A0=A0 64,=A0=A0=A0 1)
> >>>>>
> >>>>>++DEFINE_ALE_FIELD(oui_entry,=A0=A0=A0=A0=A0=A0=A0 62,=A0=A0=A0 2)
> >>>>>
> >>>>>++DEFINE_ALE_FIELD(oui_addr,=A0=A0=A0=A0=A0=A0=A0 4,=A0=A0=A0 24)
> >>>>>
> >>>>>++DEFINE_ALE_FIELD(mcast,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 40,=A0=A0=
=A0 1)
> >>>>>
> >>>>>++DEFINE_ALE_FIELD(vlan_entry_type,=A0=A0=A0 62,=A0=A0=A0 3)
> >>>>>
> >>>>>++DEFINE_ALE_FIELD(ethertype,=A0=A0=A0=A0=A0=A0=A0 0,=A0=A0=A0 16)
> >>>>>
> >>>>>++DEFINE_ALE_FIELD(ipv4_addr,=A0=A0=A0=A0=A0=A0=A0 0,=A0=A0=A0 32)
> >>>>>
> >>>>>++DEFINE_ALE_FIELD(ingress_bits,=A0=A0=A0=A0=A0=A0=A0 65,=A0=A0=A0=
 5)
> >>>>>
> >>>>>++DEFINE_ALE_FIELD(ipv6_addr_low,=A0=A0=A0=A0=A0=A0=A0 0,=A0=A0=A0=
 60)
> >>>>>
> >>>>>++DEFINE_ALE_FIELD(ipv6_addr_mid,=A0=A0=A0=A0=A0=A0=A0 63,=A0=A0=A0=
 8)
> >>>>>
> >>>>>++DEFINE_ALE_FIELD(ipv6_addr_high,=A0=A0=A0 0,=A0=A0=A0 60)
> >>>>>
> >>>>>++DEFINE_ALE_FIELD(entry_word0,=A0=A0=A0=A0=A0=A0=A0 0,=A0=A0=A0 3=
2)
> >>>>>
> >>>>>++DEFINE_ALE_FIELD(entry_word1,=A0=A0=A0=A0=A0=A0=A0 32,=A0=A0=A0 =
32)
> >>>>>
> >>>>>++DEFINE_ALE_FIELD(entry_word2,=A0=A0=A0=A0=A0=A0=A0 64,=A0=A0=A0 =
12)
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++static inline void cpsw_ale_get_addr(u32 *ale_entry, u8 *addr)
> >>>>>
> >>>>>++{
> >>>>>
> >>>>>++=A0=A0=A0 int i;
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0 for (i =3D 0; i < NUM_MAC_OCTET; i++)
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 addr[i] =3D cpsw_ale_get_field(ale_entry, =
MAC_START_BIT - MAC_OCTET_LEN * i,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 MAC_OCTET_LEN);
> >>>>>
> >>>>>++}
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++struct k3_cpsw_regdump_hdr {
> >>>>>
> >>>>>++=A0=A0=A0 u32 module_id;
> >>>>>
> >>>>>++=A0=A0=A0 u32 len;
> >>>>>
> >>>>>++};
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++enum {
> >>>>>
> >>>>>++=A0=A0=A0 K3_CPSW_REGDUMP_MOD_NUSS =3D 1,
> >>>>>
> >>>>>++=A0=A0=A0 K3_CPSW_REGDUMP_MOD_RGMII_STATUS =3D 2,
> >>>>>
> >>>>>++=A0=A0=A0 K3_CPSW_REGDUMP_MOD_MDIO =3D 3,
> >>>>>
> >>>>>++=A0=A0=A0 K3_CPSW_REGDUMP_MOD_CPSW =3D 4,
> >>>>>
> >>>>>++=A0=A0=A0 K3_CPSW_REGDUMP_MOD_CPSW_P0 =3D 5,
> >>>>>
> >>>>>++=A0=A0=A0 K3_CPSW_REGDUMP_MOD_CPSW_PN =3D 6,
> >>>>>
> >>>>>++=A0=A0=A0 K3_CPSW_REGDUMP_MOD_CPSW_CPTS =3D 7,
> >>>>>
> >>>>>++=A0=A0=A0 K3_CPSW_REGDUMP_MOD_CPSW_ALE =3D 8,
> >>>>>
> >>>>>++=A0=A0=A0 K3_CPSW_REGDUMP_MOD_CPSW_ALE_TBL =3D 9,
> >>>>>
> >>>>>++=A0=A0=A0 K3_CPSW_REGDUMP_MOD_LAST,
> >>>>>
> >>>>>++};
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++static const char *mod_names[K3_CPSW_REGDUMP_MOD_LAST] =3D {
> >>>>>
> >>>>>++=A0=A0=A0 [K3_CPSW_REGDUMP_MOD_NUSS] =3D "cpsw-nuss",
> >>>>>
> >>>>>++=A0=A0=A0 [K3_CPSW_REGDUMP_MOD_RGMII_STATUS] =3D "cpsw-nuss-rgmi=
i-status",
> >>>>>
> >>>>>++=A0=A0=A0 [K3_CPSW_REGDUMP_MOD_MDIO] =3D "cpsw-nuss-mdio",
> >>>>>
> >>>>>++=A0=A0=A0 [K3_CPSW_REGDUMP_MOD_CPSW] =3D "cpsw-nu",
> >>>>>
> >>>>>++=A0=A0=A0 [K3_CPSW_REGDUMP_MOD_CPSW_P0] =3D "cpsw-nu-p0",
> >>>>>
> >>>>>++=A0=A0=A0 [K3_CPSW_REGDUMP_MOD_CPSW_PN] =3D "cpsw-nu-pn",
> >>>>>
> >>>>>++=A0=A0=A0 [K3_CPSW_REGDUMP_MOD_CPSW_CPTS] =3D "cpsw-nu-cpts",
> >>>>>
> >>>>>++=A0=A0=A0 [K3_CPSW_REGDUMP_MOD_CPSW_ALE] =3D "cpsw-nu-ale",
> >>>>>
> >>>>>++=A0=A0=A0 [K3_CPSW_REGDUMP_MOD_CPSW_ALE_TBL] =3D "cpsw-nu-ale-tb=
l",
> >>>>>
> >>>>>++};
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++static void cpsw_ale_dump_oui_entry(int index, u32 *ale_entry)
> >>>>>
> >>>>>++{
> >>>>>
> >>>>>++=A0=A0=A0 u32 oui_addr;
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0 oui_addr =3D cpsw_ale_get_oui_addr(ale_entry);
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0 fprintf(stdout, "%d: Type: OUI Unicast\n, \tOUI =3D %0=
2x:%02x:%02x\n",
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 index, (oui_addr >> OUI_ADDR_SHIFT) & OUI_=
ADDR_MASK,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 (oui_addr >> OUI_ADDR_SHIFT) & OUI_ADDR_MA=
SK, oui_addr & OUI_ADDR_MASK);
> >>>>>
> >>>>>++}
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++static void cpsw_ale_dump_addr(int index, u32 *ale_entry)
> >>>>>
> >>>>>++{
> >>>>>
> >>>>>++=A0=A0=A0 u8 addr[NUM_MAC_OCTET];
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0 cpsw_ale_get_addr(ale_entry, addr);
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0 if (cpsw_ale_get_mcast(ale_entry)) {
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 static const char * const str_mcast_state[=
] =3D {"Forwarding",
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "Blocking/Forwarding/Learning",
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "Learning/Forwarding",
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "Forwarding"};
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 u16 port_mask =3D cpsw_ale_get_port_mask(a=
le_entry);
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 u8 state =3D cpsw_ale_get_mcast_state(ale_=
entry);
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 u8 super =3D cpsw_ale_get_super(ale_entry)=
;
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 fprintf(stdout, "%d: Type: Multicast\n \tA=
ddress =3D %02x:%02x:%02x:%02x:%02x:%02x, Multicast_State =3D %s, %sSuper=
, port_mask =3D 0x%x\n",
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 index, addr[0], addr[1], addr[=
2], addr[3], addr[4], addr[5],
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 str_mcast_state[state], super =
? "" : "No ", port_mask);
> >>>>>
> >>>>>++=A0=A0=A0 } else {
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 static const char * const s_ucast_type[] =3D=
 {"Persistent", "Untouched", "OUI",
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 "Touched"};
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 u8 ucast_type =3D cpsw_ale_get_ucast_type(=
ale_entry);
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 u8 port_num =3D cpsw_ale_get_port_num(ale_=
entry);
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 u8 blocked =3D cpsw_ale_get_blocked(ale_en=
try);
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 u8 touched =3D cpsw_ale_get_touched(ale_en=
try);
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 u8 secure =3D cpsw_ale_get_secure(ale_entr=
y);
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 u8 agable =3D cpsw_ale_get_agable(ale_entr=
y);
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 fprintf(stdout, "%d: Type: Unicast\n \tUpd=
ated Address =3D %02x:%02x:%02x:%02x:%02x:%02x, Unicast Type =3D %s, Port=
_num =3D 0x%x, Secure: %d, Blocked: %d, Touch =3D %d, Agable =3D %d\n",
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 index, addr[0], addr[1], addr[=
2], addr[3], addr[4], addr[5],
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 s_ucast_type[ucast_type], port=
_num, secure, blocked, touched, agable);
> >>>>>
> >>>>>++=A0=A0=A0 }
> >>>>>
> >>>>>++}
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++static void cpsw_ale_dump_inner_vlan_entry(int index, u32 *ale_e=
ntry)
> >>>>>
> >>>>>++{
> >>>>>
> >>>>>++=A0=A0=A0 u32 vlan_entry_word0 =3D cpsw_ale_get_entry_word0(ale_=
entry);
> >>>>>
> >>>>>++=A0=A0=A0 u32 vlan_entry_word1 =3D cpsw_ale_get_entry_word1(ale_=
entry);
> >>>>>
> >>>>>++=A0=A0=A0 u16 vlan_entry_word2 =3D cpsw_ale_get_entry_word2(ale_=
entry);
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0 fprintf(stdout, "%d: Type: Inner VLAN\n \tNolearn Mask=
 =3D 0x%x, Ingress Check =3D %d\n",
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 index, (vlan_entry_word2 >> NOLEARN_FLAG_S=
HIFT) & NOLEARN_FLAG_MASK,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word2 >> INGRESS_CHECK_SHIFT) =
& INGRESS_CHECK_MASK);
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0 if (rtl_version =3D=3D CPSW2G_RTL_VERSION) {
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 fprintf(stdout, "\tVLAN ID =3D %d, No Frag=
 =3D %d, Registered Mask =3D 0x%x\n",
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word1 >> VLAN_ID_S=
HIFT) & VLAN_ID_MASK,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word1 >> NOFRAG_FL=
AG_SHIFT_2G) & NOFRAG_FLAG_MASK_2G,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word1 >> REG_MASK_=
SHIFT) & REG_MASK_MASK);
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 fprintf(stdout, "\tForce Untagged Packet E=
gress =3D 0x%x, Unregistered Mask =3D 0x%x, Limit Next Header Control =3D=
 %d, Members =3D 0x%x\n",
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word0 >> PKT_EGRES=
S_SHIFT) & PKT_EGRESS_MASK_2G,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word0 >> UNREG_MAS=
K_SHIFT_2G) & UNREG_MASK_MASK_2G,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word0 >> NXT_HDR_C=
TRL_SHIFT_2G) & NXT_HDR_CTRL_MASK_2G,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word0 & VLAN_MEMBE=
R_LIST_MASK_2G));
> >>>>>
> >>>>>++=A0=A0=A0 } else {
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 fprintf(stdout, "\tVLAN ID =3D %d, Registe=
red Mask =3D 0x%x, No Frag =3D %d\n",
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word1 >> VLAN_ID_S=
HIFT) & VLAN_ID_MASK,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word1 >> REG_MASK_=
SHIFT) & REG_MASK_MASK,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word1 >> NOFRAG_FL=
AG_SHIFT) & NOFRAG_FLAG_MASK);
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 fprintf(stdout, "\tForce Untagged Packet E=
gress =3D 0x%x, Limit Next Header Control =3D %d, Unregistered Mask =3D 0=
x%x, Members =3D 0x%x\n",
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word1 & PKT_EGRESS=
_W1_MASK) * PKT_EGRESS_W1_OFFSET +
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ((vlan_entry_word0 >> PKT_EGRE=
SS_SHIFT) & PKT_EGRESS_MASK),
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word0 >> NXT_HDR_C=
TRL_SHIFT) & NXT_HDR_CTRL_MASK,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word0 >> UNREG_MAS=
K_SHIFT) & UNREG_MASK_MASK,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word0 & VLAN_MEMBE=
R_LIST_MASK));
> >>>>>
> >>>>>++=A0=A0=A0 }
> >>>>>
> >>>>>++}
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++static void cpsw_ale_dump_outer_vlan_entry(int index, u32 *ale_e=
ntry)
> >>>>>
> >>>>>++{
> >>>>>
> >>>>>++=A0=A0=A0 u32 vlan_entry_word0 =3D cpsw_ale_get_entry_word0(ale_=
entry);
> >>>>>
> >>>>>++=A0=A0=A0 u32 vlan_entry_word1 =3D cpsw_ale_get_entry_word1(ale_=
entry);
> >>>>>
> >>>>>++=A0=A0=A0 u16 vlan_entry_word2 =3D cpsw_ale_get_entry_word2(ale_=
entry);
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0 fprintf(stdout, "%d: Type: Outer VLAN\n \tNolearn Mask=
 =3D 0x%x, Ingress Check =3D %d\n",
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 index, (vlan_entry_word2 >> NOLEARN_FLAG_S=
HIFT) & NOLEARN_FLAG_MASK,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word2 >> INGRESS_CHECK_SHIFT) =
& INGRESS_CHECK_MASK);
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0 if (rtl_version =3D=3D CPSW2G_RTL_VERSION) {
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 fprintf(stdout, "\tVLAN ID =3D %d, No Frag=
 =3D %d, Registered Mask =3D 0x%x\n",
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word1 >> VLAN_ID_S=
HIFT) & VLAN_ID_MASK,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word1 >> NOFRAG_FL=
AG_SHIFT_2G) & NOFRAG_FLAG_MASK_2G,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word1 >> REG_MASK_=
SHIFT) & REG_MASK_MASK);
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 fprintf(stdout, "\tForce Untagged Packet E=
gress =3D 0x%x, Unregistered Mask =3D 0x%x, Limit Next Header Control =3D=
 %d, Members =3D 0x%x\n",
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word0 >> PKT_EGRES=
S_SHIFT) & PKT_EGRESS_MASK_2G,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word0 >> UNREG_MAS=
K_SHIFT_2G) & UNREG_MASK_MASK_2G,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word0 >> NXT_HDR_C=
TRL_SHIFT_2G) & NXT_HDR_CTRL_MASK_2G,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word0 & VLAN_MEMBE=
R_LIST_MASK_2G));
> >>>>>
> >>>>>++=A0=A0=A0 } else {
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 fprintf(stdout, "\tVLAN ID =3D %d, No Frag=
 =3D %d, Registered Mask =3D 0x%x\n",
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word1 >> VLAN_ID_S=
HIFT) & VLAN_ID_MASK,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word1 >> NOFRAG_FL=
AG_SHIFT) & NOFRAG_FLAG_MASK,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word1 >> REG_MASK_=
SHIFT) & REG_MASK_MASK);
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 fprintf(stdout, "\tForce Untagged Packet E=
gress =3D 0x%x, Limit Next Header Control =3D %d, Unregistered Mask =3D 0=
x%x Members =3D 0x%x\n",
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word1 & PKT_EGRESS=
_W1_MASK) * PKT_EGRESS_W1_OFFSET +
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ((vlan_entry_word0 >> PKT_EGRE=
SS_SHIFT) & PKT_EGRESS_MASK),
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word0 >> NXT_HDR_C=
TRL_SHIFT) & NXT_HDR_CTRL_MASK,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word0 >> UNREG_MAS=
K_SHIFT) & UNREG_MASK_MASK,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word0 & VLAN_MEMBE=
R_LIST_MASK));
> >>>>>
> >>>>>++=A0=A0=A0 }
> >>>>>
> >>>>>++}
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++static void cpsw_ale_dump_ethertype_entry(int index, u32 *ale_en=
try)
> >>>>>
> >>>>>++{
> >>>>>
> >>>>>++=A0=A0=A0 u16 ethertype =3D cpsw_ale_get_ethertype(ale_entry);
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0 fprintf(stdout, "%d: Type: VLAN Ethertype\n \tEthertyp=
e =3D 0x%x\n", index, ethertype);
> >>>>>
> >>>>>++}
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++static void cpsw_ale_dump_ipv4_entry(int index, u32 *ale_entry)
> >>>>>
> >>>>>++{
> >>>>>
> >>>>>++=A0=A0=A0 u8 ingress_bits =3D cpsw_ale_get_ingress_bits(ale_entr=
y);
> >>>>>
> >>>>>++=A0=A0=A0 u32 ipv4_addr =3D cpsw_ale_get_ipv4_addr(ale_entry);
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0 fprintf(stdout, "%d: Type: VLAN IPv4\n \tIngress Bits:=
 0x%x IPv4 Address =3D %u.%u.%u.%u\n",
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 index, ingress_bits, ipv4_addr >> IPV4_ADD=
R_OCT1_SHIFT & IPV4_ADDR_MASK,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 ipv4_addr >> IPV4_ADDR_OCT2_SHIFT & IPV4_A=
DDR_MASK,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 ipv4_addr >> IPV4_ADDR_OCT3_SHIFT & IPV4_A=
DDR_MASK, ipv4_addr & IPV4_ADDR_MASK);
> >>>>>
> >>>>>++}
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++static void cpsw_ale_dump_ipv6_entry(int index, u32 *ale_entry)
> >>>>>
> >>>>>++{
> >>>>>
> >>>>>++=A0=A0=A0 u32 vlan_entry_word0 =3D cpsw_ale_get_entry_word0(ale_=
entry);
> >>>>>
> >>>>>++=A0=A0=A0 u32 vlan_entry_word1 =3D cpsw_ale_get_entry_word1(ale_=
entry);
> >>>>>
> >>>>>++=A0=A0=A0 u16 vlan_entry_word2 =3D cpsw_ale_get_entry_word2(ale_=
entry);
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0 if (index & IPV6_HIGH_ENTRY_FLAG) {
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 fprintf(stdout, "%d: Type: VLAN IPv6 Highe=
r Entry (Lower Bit entry at %04u)\n \tIgnored Multicast bits: 0x%x, IPv6 =
Address (Bits [127:68]) =3D %04x:%03x%01x:%04x:%03x\n",
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 index, (index & (~IPV6_HIGH_EN=
TRY_FLAG)),
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vlan_entry_word2 & IPV6_IGNMCB=
ITS_MASK,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word1 >> IPV6_HADD=
R_W1_SHIFT) & IPV6_HADDR_W1_MASK_1,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vlan_entry_word1 & IPV6_HADDR_=
W1_MASK_2,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word0 >> IPV6_HADD=
R_W0_SHIFT_1) & IPV6_HADDR_W0_MASK_1,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word0 >> IPV6_HADD=
R_W0_SHIFT_2) & IPV6_HADDR_W0_MASK_2,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vlan_entry_word0 & IPV6_HADDR_=
W0_MASK_2);
> >>>>>
> >>>>>++=A0=A0=A0 } else {
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 fprintf(stdout, "%d: Type: VLAN IPv6 Lower=
 Entry (Higher Bit entry at %04u)\n \tIPv6 Address (Bits [127:68]) =3D %0=
1x:%01x%03x:%04x:%04x:%04x\n",
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 index, (index | IPV6_HIGH_ENTR=
Y_FLAG),
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word2 >> IPV6_LADD=
R_W2_SHIFT) & IPV6_LADDR_W2_MAKS,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vlan_entry_word2 & IPV6_LADDR_=
W2_MAKS,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word1 >> IPV6_LADD=
R_W1_SHIFT) & IPV6_LADDR_W1_MASK_1,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vlan_entry_word1 & IPV6_LADDR_=
W1_MASK,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (vlan_entry_word0 >> IPV6_LADD=
R_W0_SHIFT) & IPV6_LADDR_W0_MASK,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vlan_entry_word0 & IPV6_LADDR_=
W0_MASK);
> >>>>>
> >>>>>++=A0=A0=A0 }
> >>>>>
> >>>>>++}
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++static void cpsw_ale_dump_vlan_addr(int index, u32 *ale_entry)
> >>>>>
> >>>>>++{
> >>>>>
> >>>>>++=A0=A0=A0 u8 addr[NUM_MAC_OCTET];
> >>>>>
> >>>>>++=A0=A0=A0 int vlan =3D cpsw_ale_get_vlan_id(ale_entry);
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0 cpsw_ale_get_addr(ale_entry, addr);
> >>>>>
> >>>>>++=A0=A0=A0 if (cpsw_ale_get_mcast(ale_entry)) {
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 static const char * const str_mcast_state[=
] =3D {"Forwarding",
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "Blocking/Forwarding/Learning",
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "Learning/Forwarding",
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "Forwarding"};
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 u16 port_mask =3D cpsw_ale_get_port_mask(a=
le_entry);
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 u8 state =3D cpsw_ale_get_mcast_state(ale_=
entry);
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 u8 super =3D cpsw_ale_get_super(ale_entry)=
;
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 fprintf(stdout, "%d: Type: Multicast\n \tV=
ID =3D %d, Address =3D %02x:%02x:%02x:%02x:%02x:%02x, Multicast_state =3D=
 %s, %s Super, port_mask =3D 0x%x\n",
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 index, vlan, addr[0], addr[1],=
 addr[2], addr[3], addr[4], addr[5],
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 str_mcast_state[state], super =
? "" : "No ", port_mask);
> >>>>>
> >>>>>++=A0=A0=A0 } else {
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 static const char * const s_ucast_type[] =3D=
 {"Persistent", "Untouched", "OUI",
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 "Touched"};
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 u8 ucast_type =3D cpsw_ale_get_ucast_type(=
ale_entry);
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 u8 blocked =3D cpsw_ale_get_blocked(ale_en=
try);
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 u8 touched =3D cpsw_ale_get_touched(ale_en=
try);
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 u8 secure =3D cpsw_ale_get_secure(ale_entr=
y);
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 u8 agable =3D cpsw_ale_get_agable(ale_entr=
y);
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 int port_num;
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 if (rtl_version =3D=3D CPSW2G_RTL_VERSION)
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 port_num =3D cpsw_ale_get_port=
_num_2g(ale_entry);
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 else if (rtl_version =3D=3D CPSW3G_RTL_VER=
SION)
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 port_num =3D cpsw_ale_get_port=
_num_3g(ale_entry);
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 else
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 port_num =3D cpsw_ale_get_port=
_num(ale_entry);
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 fprintf(stdout, "%d: Type: Unicast\n \tVID=
 =3D %d, Address =3D %02x:%02x:%02x:%02x:%02x:%02x, Unicast_type =3D %s, =
port_num =3D 0x%x, Secure =3D %d, Blocked =3D %d, Touch =3D %d, Agable =3D=
 %d\n",
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 index, vlan, addr[0], addr[1],=
 addr[2], addr[3], addr[4], addr[5],
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 s_ucast_type[ucast_type], port=
_num, secure, blocked, touched, agable);
> >>>>>
> >>>>>++=A0=A0=A0 }
> >>>>>
> >>>>>++}
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++void cpsw_dump_ale(struct k3_cpsw_regdump_hdr *ale_hdr, u32 *ale=
_pos)
> >>>>>
> >>>>>++{
> >>>>>
> >>>>>++=A0=A0=A0 int i, ale_entries;
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0 if (!ale_hdr)
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 return;
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0 ale_entries =3D (ale_hdr->len - sizeof(struct k3_cpsw_=
regdump_hdr)) /
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ALE_ENTRY_WORDS / sizeof=
(u32);
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0 printf("Number of ALE entries: %d\n", ale_entries);
> >>>>>
> >>>>>++=A0=A0=A0 ale_pos +=3D 2;
> >>>>>
> >>>>>++=A0=A0=A0 for (i =3D 0; i < ale_entries; i++) {
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 int type;
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 type =3D cpsw_ale_get_entry_type(ale_pos);
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 switch (type) {
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 case ALE_ENTRY_FREE:
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 case ALE_ENTRY_ADDR:
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u32 oui_entry =3D cpsw_ale_get=
_oui_addr(ale_pos);
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (oui_entry =3D=3D 0x2)
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cpsw_ale_dump_oui_=
entry(i, ale_pos);
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 else
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cpsw_ale_dump_addr=
(i, ale_pos);
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 case ALE_ENTRY_VLAN:
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u32 vlan_entry_type =3D cpsw_a=
le_get_vlan_entry_type(ale_pos);
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (vlan_entry_type =3D=3D VLA=
N_INNER_ENTRY)
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cpsw_ale_dump_inne=
r_vlan_entry(i, ale_pos);
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 else if (vlan_entry_type =3D=3D=
 VLAN_OUTER_ENTRY)
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cpsw_ale_dump_oute=
r_vlan_entry(i, ale_pos);
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 else if (vlan_entry_type =3D=3D=
 VLAN_ETHERTYPE_ENTRY)
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cpsw_ale_dump_ethe=
rtype_entry(i, ale_pos);
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 else if (vlan_entry_type =3D=3D=
 VLAN_IPV4_ENTRY)
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cpsw_ale_dump_ipv4=
_entry(i, ale_pos);
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 else if (vlan_entry_type & VLA=
N_IPV6_ENTRY_MASK)
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cpsw_ale_dump_ipv6=
_entry(i, ale_pos);
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 case ALE_ENTRY_VLAN_ADDR:
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cpsw_ale_dump_vlan_addr(i, ale=
_pos);
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 default:
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 }
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 ale_pos +=3D ALE_ENTRY_WORDS;
> >>>>>
> >>>>>++=A0=A0=A0 }
> >>>>>
> >>>>>++}
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++int am65_cpsw_dump_regs(struct=A0 ethtool_drvinfo *info __maybe_=
unused,
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct ethtool_regs *regs)
> >>>>>
> >>>>>++{
> >>>>>
> >>>>>++=A0=A0=A0 struct k3_cpsw_regdump_hdr *dump_hdr, *ale_hdr =3D NUL=
L;
> >>>>>
> >>>>>++=A0=A0=A0 u32 *reg =3D (u32 *)regs->data, *ale_pos;
> >>>>>
> >>>>>++=A0=A0=A0 u32 mod_id;
> >>>>>
> >>>>>++=A0=A0=A0 int i, regdump_len =3D info->regdump_len;
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0 fprintf(stdout, "K3 CPSW dump version: %d, len: %d\n",
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 regs->version, info->regdump_len);
> >>>>>
> >>>>>++=A0=A0=A0 fprintf(stdout, "(Missing registers in memory space ca=
n be considered as zero valued)\n");
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0 /* Line break before register dump */
> >>>>>
> >>>>>++=A0=A0=A0 fprintf(stdout, "-------------------------------------=
-------------------------------\n");
> >>>>>
> >>>>>++=A0=A0=A0 i =3D 0;
> >>>>>
> >>>>>++=A0=A0=A0 do {
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 u32 *tmp, j;
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 u32 num_items;
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 dump_hdr =3D (struct k3_cpsw_regdump_hdr *=
)reg;
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 mod_id =3D dump_hdr->module_id;
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 num_items =3D dump_hdr->len / sizeof(u32);
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 if (mod_id =3D=3D K3_CPSW_REGDUMP_MOD_CPSW=
_ALE)
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 rtl_version =3D reg[3] & RTL_V=
ERSION_MASK;
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 if (mod_id =3D=3D K3_CPSW_REGDUMP_MOD_CPSW=
_ALE_TBL) {
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ale_hdr =3D dump_hdr;
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ale_pos =3D reg;
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 }
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 fprintf(stdout, "%s regdump: number of Reg=
isters:(%d)\n",
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mod_names[mod_id], num_items -=
 2);
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 tmp =3D reg;
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 /* Values are stored in pair as reg_offset=
-reg_val, hence parse the same way*/
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 for (j =3D 2; j < num_items; j +=3D 2) {
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (tmp[j + 1] !=3D 0x0)
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fprintf(stdout, "%=
08x:reg(%08X)\n", tmp[j], tmp[j + 1]);
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 }
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 reg +=3D num_items;
> >>>>>
> >>>>>++=A0=A0=A0=A0=A0=A0=A0 i +=3D dump_hdr->len;
> >>>>>
> >>>>>++=A0=A0=A0 } while (i < regdump_len);
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0 /* Adding a boundary in between Register dump and ALE =
table */
> >>>>>
> >>>>>++=A0=A0=A0 fprintf(stdout, "--------------------------\n");
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0 cpsw_dump_ale(ale_hdr, ale_pos);
> >>>>>
> >>>>>++
> >>>>>
> >>>>>++=A0=A0=A0 return 0;
> >>>>>
> >>>>>++};
> >>>>>
> >>>>>+diff --git a/ethtool.c b/ethtool.c
> >>>>>
> >>>>>+index 3ac15a7..a383eb6 100644
> >>>>>
> >>>>>+--- a/ethtool.c
> >>>>>
> >>>>>++++ b/ethtool.c
> >>>>>
> >>>>>+@@ -1162,6 +1162,7 @@ static const struct {
> >>>>>
> >>>>>+=A0=A0=A0=A0 { "fsl_enetc", fsl_enetc_dump_regs },
> >>>>>
> >>>>>+=A0=A0=A0=A0 { "fsl_enetc_vf", fsl_enetc_dump_regs },
> >>>>>
> >>>>>+=A0=A0=A0=A0 { "hns3", hns3_dump_regs },
> >>>>>
> >>>>>++=A0=A0=A0 { "am65-cpsw-nuss", am65_cpsw_dump_regs },
> >>>>>
> >>>>>+ };
> >>>>>
> >>>>>+ #endif
> >>>>>
> >>>>>+
> >>>>>
> >>>>>+diff --git a/internal.h b/internal.h
> >>>>>
> >>>>>+index 4b994f5..81212b4 100644
> >>>>>
> >>>>>+--- a/internal.h
> >>>>>
> >>>>>++++ b/internal.h
> >>>>>
> >>>>>+@@ -410,4 +410,7 @@ int cpsw_dump_regs(struct ethtool_drvinfo *in=
fo, struct ethtool_regs *regs);
> >>>>>
> >>>>>+ /* Microchip Ethernet Controller */
> >>>>>
> >>>>>+ int lan743x_dump_regs(struct ethtool_drvinfo *info, struct ethto=
ol_regs *regs);
> >>>>>
> >>>>>+
> >>>>>
> >>>>>++/* TI K3 CPSW Ethernet Switch */
> >>>>>
> >>>>>++int am65_cpsw_dump_regs(struct ethtool_drvinfo *info, struct eth=
tool_regs *regs);
> >>>>>
> >>>>>++
> >>>>>
> >>>>>+ #endif /* ETHTOOL_INTERNAL_H__ */
> >>>>>
> >>>>>+--
> >>>>>
> >>>>>+2.34.1
> >>>>>
> >>>>>+
> >>>>>
> >>>>>diff --git a/meta-arago-distro/recipes-extended/ethtool/ethtool_%.=
bbappend b/meta-arago-distro/recipes-extended/ethtool/ethtool_%.bbappend
> >>>>>new file mode 100644
> >>>>>index 00000000..3b388151
> >>>>>--- /dev/null
> >>>>>+++ b/meta-arago-distro/recipes-extended/ethtool/ethtool_%.bbappen=
d
> >>>>>@@ -0,0 +1,4 @@
> >>>>>+ETHTOOL_ARAGO =3D ""
> >>>>>+ETHTOOL_ARAGO:arago =3D "ethtool-arago.inc"
> >>>>>+
> >>>>>+require ${ETHTOOL_ARAGO}
> >>>>>--=20
> >>>>>2.34.1
> >>>
> >>>
> >>>
> >>>
> >>>
> >

