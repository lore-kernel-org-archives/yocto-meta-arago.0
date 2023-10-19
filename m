Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7668ECDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 06:33:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.21406.1697697219521524342
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 18 Oct 2023 23:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7C06440D13;
	Thu, 19 Oct 2023 06:33:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WL4-yZ-H1Svy; Thu, 19 Oct 2023 06:33:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5AA8440A20;
	Thu, 19 Oct 2023 06:33:36 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 587D8163D0A;
	Thu, 19 Oct 2023 02:33:36 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH v2] tisdk-bundle: bring this class on par with current image.bbclass
Date: Thu, 19 Oct 2023 06:33:35 +0000
Message-Id: <20231019063335.3009239-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 19 Oct 2023 06:33:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14955

From: Denys Dmytriyenko <denys@konsulko.com>

As tisdk-bundle was based on the image class long time ago, it inherited
some of its old attributes and artifacts used back in the days. There
were several updates and reworks done to this class through the years to
keep it up to date and in sync with upstream image class, but some pieces
fell through the cracks. In recent and not so recent years upstream image
class have deprecated some things, changed and extended others, such as
consolidated umask handling, improved sstate handling, expanded list of
cleaned directories and changed stamping and locking policy.

Since tisdk-bundle inherits image class, corresponding attributes for
do_rootfs, do_image and do_image_complete don't need to be modified here
and can be left to their default values, as well as the order of those
tasks.

This change addresses the issue with sstate/deploy file collisions we've
been seeing at times lately resulting in pseudo abort errors. And it
improves long term maintainability of tisdk-bundle class as well.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
v2 - drop couple more lines

 meta-arago-distro/classes/tisdk-bundle.bbclass | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-=
distro/classes/tisdk-bundle.bbclass
index 193181be..49504089 100644
--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
+++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
@@ -88,10 +88,6 @@ do_rootfs[depends] +=3D "${@string_set('%s:do_image_co=
mplete' % pn for pn in (d.ge
 do_rootfs[depends] +=3D "${@string_set('%s:do_populate_sdk' % pn for pn =
in (d.getVar("TISDK_TOOLCHAIN") or "").split())}"
 do_rootfs[mcdepends] +=3D "${@string_set('%s:do_populate_sdk' % pn for p=
n in (d.getVar("TISDK_TOOLCHAIN_K3R5") or "").split())}"
=20
-do_rootfs[nostamp] =3D "1"
-do_rootfs[lockfiles] +=3D "${IMAGE_ROOTFS}.lock"
-do_rootfs[cleandirs] +=3D "${S}"
-
 # Call the cleanup_host_packages to remove packages that should be remov=
ed from
 # the host for various reasons.  This may include licensing issues as we=
ll.
 OPKG_POSTPROCESS_COMMANDS =3D "cleanup_host_packages; "
@@ -132,9 +128,6 @@ fakeroot python do_image () {
=20
     execute_pre_post_process(d, pre_process_cmds)
 }
-do_image[dirs] =3D "${TOPDIR}"
-do_image[umask] =3D "022"
-addtask do_image after do_rootfs before do_build
=20
 fakeroot python do_image_complete () {
     from oe.utils import execute_pre_post_process
@@ -143,9 +136,6 @@ fakeroot python do_image_complete () {
=20
     execute_pre_post_process(d, post_process_cmds)
 }
-do_image_complete[dirs] =3D "${TOPDIR}"
-do_image_complete[umask] =3D "022"
-addtask do_image_complete after do_image before do_build
=20
 tisdk_image_setup () {
     set -x
@@ -345,6 +335,3 @@ tisdk_image_cleanup () {
 license_create_manifest() {
     :
 }
-
-EXPORT_FUNCTIONS do_rootfs
-addtask rootfs before do_build after do_install
--=20
2.25.1


