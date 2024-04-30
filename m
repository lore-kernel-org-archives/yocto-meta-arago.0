Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C82EC4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 16:42:51 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.20833.1714495363874402207
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 09:42:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ll/kLsvW;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43UGgfuq091140;
	Tue, 30 Apr 2024 11:42:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714495361;
	bh=HZ3DiZlefCeHwref9QLWX2CR3vsS28thA+en7bvNB5E=;
	h=Date:To:CC:Subject:From:References:In-Reply-To;
	b=ll/kLsvWhe/UxpJ1Ki0faI10UnOCiQhTFvXo2aFtL9y88q4qqaNFrLUQRI9fVTh+6
	 0GFWV+e27egQoXyM/bvPCQ8sM2QndAq6ubmMYsKaY1KMPkvyGTztUNUtAEeJ1ToX6Z
	 9/qq9QbJn6Q0i2JeNZZHS1ndassBhUkT67qMBzSo=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43UGgfW4124536
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 Apr 2024 11:42:41 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 Apr 2024 11:42:40 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 30 Apr 2024 11:42:40 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43UGgeZL086059;
	Tue, 30 Apr 2024 11:42:40 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 30 Apr 2024 11:42:40 -0500
Message-ID: <D0XLVRCCX6H7.3AC5C1WCY6E1U@ti.com>
To: Andrew Davis <afd@ti.com>, <reatmon@ti.com>, <denis@denix.org>,
        <dannenberg@ti.com>, <mbhatnagar@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <k-bhargav@ti.com>,
        <detheridge@ti.com>
Subject: Re: [meta-arago][master][PATCH] all: purge matrix ui and all
 dependent packages
From: Randolph Sapp <rs@ti.com>
X-Mailer: aerc 0.17.0
References: <20240430160302.3350718-2-rs@ti.com>
 <0fa6d2c2-a18b-4838-a592-aaff3cee8888@ti.com>
In-Reply-To: <0fa6d2c2-a18b-4838-a592-aaff3cee8888@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 30 Apr 2024 16:42:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15316

On Tue Apr 30, 2024 at 11:29 AM CDT, Andrew Davis wrote:
> On 4/30/24 11:03 AM, rs@ti.com wrote:
> > From: Randolph Sapp <rs@ti.com>
> >=20
> > Purge the old Matrix UI. This thing was cool but it required modifying
> > too many other packages, does not have a dedicated maintainer, and
> > relied on deprecated components.
> >=20
> > There have been 2 replacements for this tool that have cropped up in th=
e
> > last year alone. Surely one of those is suitable for the task now. If
> > not, now there is proper motivation.
> >=20
> > Signed-off-by: Randolph Sapp <rs@ti.com>
> > ---
> >   meta-arago-demos/conf/layer.conf              |   12 -
> >   .../image-gallery/image-gallery_git.bb        |   31 -
> >   ...th-QtWidgets-per-Qt5-migration-guide.patch |  232 ---
> >   ...i-toAscii-with-fromLatin1-toLatin1-p.patch |   71 -
> >   .../thermostat-demo/qt-tstat_2.0.bb           |   38 -
> >   .../matrix/matrix-gui-3d-demos_2.0.bb         |   47 -
> >   .../matrix/matrix-gui-analytics-demos_2.0.bb  |   26 -
> >   .../matrix/matrix-gui-apps-git.inc            |   14 -
> >   .../matrix/matrix-gui-apps-images_2.0.bb      |   16 -
> >   .../recipes-core/matrix/matrix-gui-apps.inc   |   43 -
> >   .../matrix-gui-armbenchmarks-demos_2.0.bb     |   17 -
> >   .../matrix/matrix-gui-browser-demos_2.0.bb    |   15 -
> >   .../matrix/matrix-gui-browser_2.0.bb          |   23 -
> >   .../matrix/matrix-gui-camera-loopback_2.0.bb  |   12 -
> >   .../matrix/matrix-gui-clocks_2.0.bb           |   26 -
> >   .../matrix/matrix-gui-crypto-demos_2.0.bb     |   14 -
> >   .../matrix/matrix-gui-display-control_2.0.bb  |   14 -
> >   .../udhcpd_eth1.conf                          |  128 --
> >   .../matrix/matrix-gui-ethernet-demos_2.0.bb   |   30 -
> >   .../matrix/matrix-gui-generic-pm_2.0.bb       |   16 -
> >   .../matrix/matrix-gui-helper-scripts.bb       |   16 -
> >   .../matrix/matrix-gui-hmi-demos_2.0.bb        |   46 -
> >   .../matrix-gui-machinevision-demos_2.0.bb     |   58 -
> >   .../matrix/matrix-gui-mc-demos_2.0.bb         |   27 -
> >   .../matrix/matrix-gui-multimedia-demos_2.0.bb |   70 -
> >   .../matrix/matrix-gui-opencl-demos_2.0.bb     |   36 -
> >   .../matrix/matrix-gui-oprofile-demos_2.0.bb   |   14 -
> >   .../recipes-core/matrix/matrix-gui-paths.inc  |    3 -
> >   .../matrix/matrix-gui-pm-demos_2.0.bb         |   35 -
> >   .../matrix/matrix-gui-pru-demos_2.0.bb        |   14 -
> >   .../matrix/matrix-gui-qt4-demos_2.0.bb        |   14 -
> >   .../matrix/matrix-gui-qt5-demos_2.0.bb        |   33 -
> >   .../matrix/matrix-gui-settings-demos_2.0.bb   |   23 -
> >   .../matrix/matrix-gui-submenus_2.0.bb         |  106 --
> >   .../matrix/matrix-gui-tidl-demos_2.0.bb       |   96 --
> >   .../matrix/matrix-gui-touch-demos_2.0.bb      |   14 -
> >   .../matrix/matrix-gui-usb-demos_2.0.bb        |   14 -
> >   .../matrix/matrix-gui-utility-demos_2.0.bb    |   31 -
> >   .../matrix/matrix-gui-v4l2-demos_2.0.bb       |   14 -
> >   .../matrix-gui-video-analytics-demos_2.0.bb   |   28 -
> >   .../matrix/matrix-gui-wifi-demos_2.0.bb       |   14 -
> >   ...-Stop-matrix-when-running-a-GUI-demo.patch |   84 --
> >   ...-workaround-for-GUI-apps-with-weston.patch |  126 --
> >   .../recipes-core/matrix/matrix-gui/init       |   49 -
> >   .../recipes-core/matrix/matrix-gui/init.eglfs |   60 -
> >   .../matrix/matrix-gui/matrix-gui-2.0.service  |   18 -
> >   .../recipes-core/matrix/matrix-gui/php.ini    | 1342 ----------------=
-
> >   .../recipes-core/matrix/matrix-gui_2.0.bb     |   69 -
> >   .../matrix/matrix-lighttpd-config.bb          |   32 -
> >   .../matrix/matrix-lighttpd-config/COPYING     |   31 -
> >   .../lighttpd.conf.matrix                      |  344 -----
> >   .../recipes-core/matrix/refresh-screen_2.0.bb |   20 -
> >   .../images/tisdk-default-image.bb             |    2 -
> >   .../packagegroup-arago-tisdk-matrix.bb        |  197 ---
> >   .../packagegroup-arago-tisdk-qte.bb           |    1 -
> >   .../recipes-core/packagegroups/ti-world.bb    |    2 -
> >   ...-native-Fix-host-contamination-issue.patch |   55 -
> >   .../recipes-devtools/php/php_%.bbappend       |   29 -
> >   58 files changed, 3992 deletions(-)
> >   delete mode 100644 meta-arago-demos/recipes-apps/image-gallery/image-=
gallery_git.bb
> >   delete mode 100644 meta-arago-demos/recipes-apps/thermostat-demo/qt-t=
stat/0002-Replace-QtGui-with-QtWidgets-per-Qt5-migration-guide.patch
> >   delete mode 100644 meta-arago-demos/recipes-apps/thermostat-demo/qt-t=
stat/0003-Replace-fromAscii-toAscii-with-fromLatin1-toLatin1-p.patch
> >   delete mode 100644 meta-arago-demos/recipes-apps/thermostat-demo/qt-t=
stat_2.0.bb
>
> I wonder if we could keep the thermostat-demo around. Even if there was s=
ome
> cross dependencies it could probably be made stand alone. Same for severa=
l of these.
>
> On one hand I do like several of these demos, and I hope some are later s=
aved by
> fixing and moving them to the new demo launchers. Guess that is what git =
history
> is for, no need to keep them around until that mythical "free time" happe=
ns
> for us to go fix them up.
>
> Anyway, the removal of our matrix demo launcher has been a long time comi=
ng.
> Many of these demos are simply broken and should have been removed many c=
ycles
> ago. Having customers greeted by broken demos on their newly bought EVMs =
is
> a bad look.
>
> Technical details aside, for the concept here:
>
> Acked-by: Andrew Davis <afd@ti.com>


Yeah, we'll look at untangling these demos later. They were removed in this
because they rely on assets currently packaged as part of the Matrix UI.

They will be unlinked before actually removal, or we can pull this as is an=
d
re-add the demo recipes once the assets have been moved into the correspond=
ing
upstream project. The thermostat demo is already containerized and accessib=
le
through one of the two Matrix alternatives (Seva) though so it should not b=
e a
blocker here.


> >   delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-3d=
-demos_2.0.bb
> >   [snip]


