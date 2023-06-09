Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB78AC7EE2E
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 16:11:09 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.17426.1686327064356494342
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Jun 2023 09:11:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3F85640C16;
	Fri,  9 Jun 2023 16:11:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P9UFSOxKIfp0; Fri,  9 Jun 2023 16:11:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D6CBF40A2F;
	Fri,  9 Jun 2023 16:10:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5F0C91639DE; Fri,  9 Jun 2023 12:10:07 -0400 (EDT)
Date: Fri, 9 Jun 2023 12:10:07 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: "Raghavendra, Vignesh" <vigneshr@ti.com>,
	Chirag Shilwant <c-shilwant@ti.com>,
	Praneeth Bajjuri <praneeth@ti.com>,
	meta-arago@lists.yoctoproject.org,
	Sai Sree Kartheek Adivi <s-adivi@ti.com>,
	Paresh Bhagat <p-bhagat@ti.com>, Gyan Gupta <g-gupta@ti.com>
Subject: Re: [meta-arago][kirkstone][PATCH] meta-arago-distro:
 recipes-kernel: Remove docker configs
Message-ID: <20230609161007.GH9226@denix.org>
References: <20230609052346.414726-1-c-shilwant@ti.com>
 <5f2acd49-c6aa-17c2-dccb-5de66dc29458@ti.com>
 <c186b77e-e7ea-3c2b-f6f5-ced482a9db4f@ti.com>
 <b3e61d81-f568-347a-a936-dcc3b0da3aec@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <b3e61d81-f568-347a-a936-dcc3b0da3aec@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Jun 2023 16:11:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14576

On Fri, Jun 09, 2023 at 10:39:06AM -0500, Ryan Eatmon wrote:
>=20
>=20
> On 6/9/2023 9:42 AM, Raghavendra, Vignesh wrote:
> >
> >
> >On 6/9/2023 7:01 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> >>
> >>
> >>On 6/9/2023 12:23 AM, Chirag Shilwant wrote:
> >>>The necessary configs required for running docker containers have be=
en
> >>>enabled in ti-linux-6.1
> >>
> >>
> >>Generally speaking I support this patch, but from a practical point o=
f
> >>view we still have the 5.10 kernel in kirkstone/master.=A0 And applyi=
ng
> >>this patch as is will break docker support in those kernels.
> >>
> >>We need to modify this patch to rename the bbappend files to just app=
ly
> >>to the 5.10 kernels instead of % (all) kernels.
> >>
> >
> >I dont know why this was needed in meta-arago-distro for 5.10 either.

Vignesh,

Docker support with kernel config fragment was in Processor SDK since 201=
8.=20
Later it got moved to meta-arago to be more generic and used in Core SDK.=
 And=20
then eventually a similar config fragment got added to TI kernel about a =
year=20
ago for 5.10. I guess nobody went back and cleaned it up in meta-arago up=
=20
until now... Yes, it is not 6.1 specific.


> >ti_sdk_*_defconfigs include containers.cfg fragment that has all these
> >configs [0][1]
> >
> >[0] https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/ti_co=
nfig_fragments/v8_defconfig_map.txt?h=3Dti-linux-5.10.y-cicd#n2
> >[1] https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/ti_co=
nfig_fragments/containers.cfg?h=3Dti-linux-5.10.y-cicd
> >
> >IMO, this patch should not affect 5.10 either
>=20
> If that is the case, then we just need to reword the commit message
> to not be so 6.1 specific.
>=20
>=20
> >>
> >>>Ref -
> >>>https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/patch/?id=3D=
ca7f239d0814e6a49804b76c0984d6ca5eea0924
> >>>
> >>>Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> >>>---
> >>> =A0 .../recipes-kernel/linux/docker.inc=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 |=A0 4 ----
> >>> =A0 .../recipes-kernel/linux/files/docker.cfg=A0=A0=A0=A0 | 20 ----=
---------------
> >>> =A0 .../linux/linux-ti-staging-rt_%.bbappend=A0=A0=A0=A0=A0 |=A0 2 =
--
> >>> =A0 .../linux/linux-ti-staging-systest_%.bbappend |=A0 2 --
> >>> =A0 .../linux/linux-ti-staging_%.bbappend=A0=A0=A0=A0=A0=A0=A0=A0 |=
=A0 2 --
> >>> =A0 5 files changed, 30 deletions(-)
> >>> =A0 delete mode 100644 meta-arago-distro/recipes-kernel/linux/docke=
r.inc
> >>> =A0 delete mode 100644
> >>>meta-arago-distro/recipes-kernel/linux/files/docker.cfg
> >>>
> >>>diff --git a/meta-arago-distro/recipes-kernel/linux/docker.inc
> >>>b/meta-arago-distro/recipes-kernel/linux/docker.inc
> >>>deleted file mode 100644
> >>>index e926b219..00000000
> >>>--- a/meta-arago-distro/recipes-kernel/linux/docker.inc
> >>>+++ /dev/null
> >>>@@ -1,4 +0,0 @@
> >>>-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
> >>>-
> >>>-SRC_URI +=3D "file://docker.cfg"
> >>>-KERNEL_CONFIG_FRAGMENTS +=3D "${WORKDIR}/docker.cfg"
> >>>diff --git a/meta-arago-distro/recipes-kernel/linux/files/docker.cfg
> >>>b/meta-arago-distro/recipes-kernel/linux/files/docker.cfg
> >>>deleted file mode 100644
> >>>index 9ac604b8..00000000
> >>>--- a/meta-arago-distro/recipes-kernel/linux/files/docker.cfg
> >>>+++ /dev/null
> >>>@@ -1,20 +0,0 @@
> >>>-CONFIG_VETH=3Dm
> >>>-CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=3Dm
> >>>-CONFIG_NETFILTER_XT_MATCH_CONNTRACK=3Dm
> >>>-CONFIG_NETFILTER_XT_MATCH_IPVS=3Dm
> >>>-CONFIG_NET_CLS_CGROUP=3Dm
> >>>-CONFIG_IP_VS=3Dm
> >>>-CONFIG_IP_VS_RR=3Dm
> >>>-CONFIG_VXLAN=3Dm
> >>>-CONFIG_IPVLAN=3Dm
> >>>-CONFIG_MACVLAN=3Dm
> >>>-CONFIG_DUMMY=3Dm
> >>>-CONFIG_NF_NAT_FTP=3Dm
> >>>-CONFIG_NF_CONNTRACK_FTP=3Dm
> >>>-CONFIG_NF_NAT_TFTP=3Dm
> >>>-CONFIG_NF_CONNTRACK_TFTP=3Dm
> >>>-CONFIG_AUFS_FS=3Dm
> >>>-CONFIG_BTRFS_FS=3Dm
> >>>-CONFIG_BLK_DEV_DM=3Dm
> >>>-CONFIG_DM_THIN_PROVISIONING=3Dm
> >>>-CONFIG_OVERLAY_FS=3Dm
> >>>diff --git
> >>>a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbapp=
end b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappe=
nd
> >>>index df55594e..06f33291 100644
> >>>---
> >>>a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbapp=
end
> >>>+++
> >>>b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbapp=
end
> >>>@@ -2,6 +2,4 @@ MACHINE_KERNEL_PR:append =3D ".arago1"
> >>> =A0 =A0 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
> >>> =A0 -require docker.inc
> >>>-
> >>> =A0 ALLOW_EMPTY:kernel-devicetree =3D "1"
> >>>diff --git
> >>>a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.=
bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systes=
t_%.bbappend
> >>>index df55594e..06f33291 100644
> >>>---
> >>>a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.=
bbappend
> >>>+++
> >>>b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.=
bbappend
> >>>@@ -2,6 +2,4 @@ MACHINE_KERNEL_PR:append =3D ".arago1"
> >>> =A0 =A0 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
> >>> =A0 -require docker.inc
> >>>-
> >>> =A0 ALLOW_EMPTY:kernel-devicetree =3D "1"
> >>>diff --git
> >>>a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
> >>>b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
> >>>index 031a8b05..9d9a3593 100644
> >>>--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbap=
pend
> >>>+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbap=
pend
> >>>@@ -2,6 +2,4 @@ MACHINE_KERNEL_PR:append =3D ".arago5"
> >>> =A0 =A0 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
> >>> =A0 -require docker.inc
> >>>-
> >>> =A0 ALLOW_EMPTY:kernel-devicetree =3D "1"
> >>

