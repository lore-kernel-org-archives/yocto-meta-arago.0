Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12945CD042D
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 01:44:25 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.81200.1767663861016058075
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 Jan 2026 17:44:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 205CD40CBA;
	Tue,  6 Jan 2026 01:44:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id agZajqFQQ9na; Tue,  6 Jan 2026 01:44:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CF93F40A30;
	Tue,  6 Jan 2026 01:44:16 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 21E311774BE; Mon,  5 Jan 2026 20:44:16 -0500 (EST)
Date: Mon, 5 Jan 2026 20:44:16 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH 2/2] telnetd: Move telnet daemon
 scripts to meta-arago-test
Message-ID: <20260106014416.GI11121@denix.org>
References: <20260105221926.2503358-1-afd@ti.com>
 <20260105221926.2503358-2-afd@ti.com>
 <58492a2d-1cfb-4289-ba1a-f86939d54b36@ti.com>
 <2068f564-6855-4087-905e-c7da0c151ddb@ti.com>
 <4d22d3da-ecd4-4897-a0ca-d20ccfbf4686@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <4d22d3da-ecd4-4897-a0ca-d20ccfbf4686@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 Jan 2026 01:44:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16931

There's a standard DEBUG_BUILD variable that can be reused for this. But.=
..

It is a build-time condition, which means you end up with two separate bu=
ilds=20
for release and debugging. Do you test both? Or how can you ensure testin=
g=20
debug build also covers the release build properly?

The idea of only building release images and then installing test package=
s at=20
run-time for testing was to mitigate the above ambiguity...

That said, I don't understand why it has to drive the run-time testing ov=
er=20
telnet or ssh? Isn't the early boot testing already done over serial? Can=
 the=20
user-space Linux testing be done over serial as well?

--=20
Denys


On Mon, Jan 05, 2026 at 07:25:24PM -0600, Ryan Eatmon via lists.yoctoproj=
ect.org wrote:
>=20
>=20
> On 1/5/2026 5:36 PM, Andrew Davis wrote:
> >On 1/5/26 4:23 PM, Ryan Eatmon wrote:
> >>
> >>This one may not work.=A0 This assumes that you have ti-test
> >>intstalled (which not all images do).=A0 And without ti-test in
> >>the image, then you cannot telnet to the board during test.
> >>
> >
> >Why would you need to telnet onto a board to check on test if you are
> >not testing? If you are testing, then you would have ti-test.
>=20
> The base image is kept small to do network based tests.  They then
> install the ti-test package from the NAS.  But that assumes that the
> test framework could telnet to the board after boot in order to run
> commands...  That's the scenario I'm thinking of.
>=20
> The best solution is to update all of the tests to use ssh, but that
> still means we are still hardcoding something in the file system to
> allow connecting in a bad way.
>=20
> What if we also combined the above with a variable that we set in
> the local.conf during our builds, but is off by default.  And that
> varible override would make us include the ti-test-required.  We
> could even just add that setting to the local.conf...
>=20
>=20
> >Removing this from images that are not specifically meant for use by o=
ur
> >test automation is 100% intentional. Right now anyone can telnet into,
> >as root, without a password, all of our images. As much as we love to =
claim
> >no one should be using these images as a base for their production ima=
ge,
> >absolutly every single customer is anyway. Which means we have a huge
> >security foot-gun here, and customers *will* end up shipping devices w=
ith
> >this massive security issue.
> >
> >Andrew
> >
> >>
> >>On 1/5/2026 4:19 PM, Andrew Davis wrote:
> >>>These are only used (and only ever should be used) in testing images=
.
> >>>Move these out of the base distro images and only into images includ=
ing
> >>>the ti-test packagegroup. Move the recipes themselves also over to
> >>>meta-arago-test.
> >>>
> >>>Signed-off-by: Andrew Davis <afd@ti.com>
> >>>---
> >>>=A0 check_yocto_rules.json=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 | 4 ++--
> >>>=A0 .../recipes-core/packagegroups/packagegroup-arago-base.bb=A0=A0=A0=
=A0 | 2 --
> >>>=A0 .../initscript-telnetd/initscript-telnetd.bb=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 0
> >>>=A0 .../initscript-telnetd/initscript-telnetd/telnetd=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 | 0
> >>>=A0 .../recipes-connectivity/systemd-telnetd/systemd-telnetd.bb=A0=A0=
 | 0
> >>>=A0 .../systemd-telnetd/systemd-telnetd/telnetd.service=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 | 0
> >>>=A0 meta-arago-test/recipes-core/packagegroups/ti-test.bb=A0=A0=A0=A0=
=A0=A0=A0=A0 | 2 ++
> >>>=A0 7 files changed, 4 insertions(+), 4 deletions(-)
> >>>=A0 rename {meta-arago-distro =3D> meta-arago-test}/recipes-connecti=
vity/initscript-telnetd/initscript-telnetd.bb
> >>>(100%)
> >>>=A0 rename {meta-arago-distro =3D> meta-arago-test}/recipes-connecti=
vity/initscript-telnetd/initscript-telnetd/telnetd
> >>>(100%)
> >>>=A0 rename {meta-arago-distro =3D> meta-arago-test}/recipes-connecti=
vity/systemd-telnetd/systemd-telnetd.bb
> >>>(100%)
> >>>=A0 rename {meta-arago-distro =3D> meta-arago-test}/recipes-connecti=
vity/systemd-telnetd/systemd-telnetd/telnetd.service
> >>>(100%)
> >>>
> >>>diff --git a/check_yocto_rules.json b/check_yocto_rules.json
> >>>index 7b3e20db..26275421 100644
> >>>--- a/check_yocto_rules.json
> >>>+++ b/check_yocto_rules.json
> >>>@@ -27,8 +27,6 @@
> >>>=A0=A0=A0=A0=A0 "PV-1" :{
> >>>=A0=A0=A0=A0=A0=A0=A0=A0=A0 "skip_files" : [
> >>>"meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb",
> >>>-            "meta-arago-distro/recipes-connectivity/initscript-teln=
etd/initscript-telnetd.bb",
> >>>-            "meta-arago-distro/recipes-connectivity/systemd-telnetd=
/systemd-telnetd.bb",
> >>>"meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb=
",
> >>>"meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk-serv=
er.bb",
> >>>"meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb",
> >>>@@ -38,6 +36,8 @@
> >>>"meta-arago-extras/recipes-extended/sysrepo/nw-configurator.bb",
> >>>"meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-ducati_git.bb",
> >>>"meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-vpe_git.bb"
> >>>+            "meta-arago-test/recipes-connectivity/initscript-telnet=
d/initscript-telnetd.bb",
> >>>+            "meta-arago-test/recipes-connectivity/systemd-telnetd/s=
ystemd-telnetd.bb",
> >>>=A0=A0=A0=A0=A0=A0=A0=A0=A0 ]
> >>>=A0=A0=A0=A0=A0 }
> >>>=A0 }
> >>>diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegro=
up-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegr=
oup-arago-base.bb
> >>>index b80697e5..d36b4397 100644
> >>>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-base.bb
> >>>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-base.bb
> >>>@@ -16,8 +16,6 @@ ARAGO_BASE =3D "\
> >>>=A0=A0=A0=A0=A0 mtd-utils \
> >>>=A0=A0=A0=A0=A0 mtd-utils-ubifs \
> >>>=A0=A0=A0=A0=A0 curl \
> >>>-=A0=A0=A0 initscript-telnetd \
> >>>-=A0=A0=A0 systemd-telnetd \
> >>>=A0=A0=A0=A0=A0 ethtool \
> >>>=A0=A0=A0=A0=A0 bash \
> >>>=A0=A0=A0=A0=A0 opkg-bash-completion \
> >>>diff --git a/meta-arago-distro/recipes-connectivity/initscript-telne=
td/initscript-telnetd.bb b/meta-arago-test/recipes-connectivity/initscrip=
t-telnetd/initscript-telnetd.bb
> >>>similarity index 100%
> >>>rename from meta-arago-distro/recipes-connectivity/initscript-telnet=
d/initscript-telnetd.bb
> >>>rename to meta-arago-test/recipes-connectivity/initscript-telnetd/in=
itscript-telnetd.bb
> >>>diff --git a/meta-arago-distro/recipes-connectivity/initscript-telne=
td/initscript-telnetd/telnetd b/meta-arago-test/recipes-connectivity/init=
script-telnetd/initscript-telnetd/telnetd
> >>>similarity index 100%
> >>>rename from meta-arago-distro/recipes-connectivity/initscript-telnet=
d/initscript-telnetd/telnetd
> >>>rename to meta-arago-test/recipes-connectivity/initscript-telnetd/in=
itscript-telnetd/telnetd
> >>>diff --git a/meta-arago-distro/recipes-connectivity/systemd-telnetd/=
systemd-telnetd.bb b/meta-arago-test/recipes-connectivity/systemd-telnetd=
/systemd-telnetd.bb
> >>>similarity index 100%
> >>>rename from meta-arago-distro/recipes-connectivity/systemd-telnetd/s=
ystemd-telnetd.bb
> >>>rename to meta-arago-test/recipes-connectivity/systemd-telnetd/syste=
md-telnetd.bb
> >>>diff --git a/meta-arago-distro/recipes-connectivity/systemd-telnetd/=
systemd-telnetd/telnetd.service b/meta-arago-test/recipes-connectivity/sy=
stemd-telnetd/systemd-telnetd/telnetd.service
> >>>similarity index 100%
> >>>rename from meta-arago-distro/recipes-connectivity/systemd-telnetd/s=
ystemd-telnetd/telnetd.service
> >>>rename to meta-arago-test/recipes-connectivity/systemd-telnetd/syste=
md-telnetd/telnetd.service
> >>>diff --git
> >>>a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> >>>b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> >>>index 22957218..ebac81c2 100644
> >>>--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> >>>+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> >>>@@ -22,6 +22,7 @@ TI_TEST_BASE =3D "\
> >>>=A0=A0=A0=A0=A0 hwspinlocktest \
> >>>=A0=A0=A0=A0=A0 hdparm \
> >>>=A0=A0=A0=A0=A0 i2c-tools \
> >>>+=A0=A0=A0 initscript-telnetd \
> >>>=A0=A0=A0=A0=A0 iozone3 \
> >>>=A0=A0=A0=A0=A0 iproute2-tc \
> >>>=A0=A0=A0=A0=A0 iproute2-devlink \
> >>>@@ -57,6 +58,7 @@ TI_TEST_BASE =3D "\
> >>>=A0=A0=A0=A0=A0 stress \
> >>>=A0=A0=A0=A0=A0 stress-ng \
> >>>=A0=A0=A0=A0=A0 strongswan \
> >>>+=A0=A0=A0 systemd-telnetd \
> >>>=A0=A0=A0=A0=A0 tcpdump \
> >>>=A0=A0=A0=A0=A0 v4l-utils \
> >>>=A0=A0=A0=A0=A0 xdp-tools-arago \

