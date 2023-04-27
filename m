Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F14E7C77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 20:33:23 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.3061.1682627600512981526
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 13:33:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=BZqLb5UI;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33RKXGhN063349;
	Thu, 27 Apr 2023 15:33:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682627596;
	bh=H7jd3mgLB1dSZDaZp7CHzZFeKzbj/ga21KhpF9Za2Mo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=BZqLb5UIWpuTSE8hEEL1AWgMiyX6F9tlj7zPo6/JdpJoZ3HA3IiLUDil5cAeIQaHy
	 3G8K6+fWtslm1p8FlpE6Yw2BHZKqjetYhqzAKDKi79v+zb9EKevgimWJIbdtatfChl
	 jQXdQbBUc2BOdf8tluMuPikSXzkuvGpCTIiAnOvQ=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33RKXGWp105920
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Apr 2023 15:33:16 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Apr 2023 15:33:16 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Apr 2023 15:33:16 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33RKXGB1032723;
	Thu, 27 Apr 2023 15:33:16 -0500
Message-ID: <d744f32c-1cdf-0f4d-29c0-a9635388264f@ti.com>
Date: Thu, 27 Apr 2023 15:33:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [EXTERNAL] Re: [meta-arago][kirkstone][PATCHv2 4/5] qtwayland:
 drop the plugins-decorations patch
To: Denys Dmytriyenko <denis@denix.org>
CC: <afd@ti.com>, <detheridge@ti.com>, <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20230427172036.863789-1-rs@ti.com>
 <20230427172036.863789-5-rs@ti.com> <20230427195321.GN9226@denix.org>
Content-Language: en-US, en-US-large
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <20230427195321.GN9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 27 Apr 2023 20:33:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14371

On 4/27/23 14:53, Denys Dmytriyenko wrote:
> On Thu, Apr 27, 2023 at 12:20:35PM -0500, rs@ti.com wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> This seems like it was a needless patch to guard against garbage from
>> being shown if the window icon request failed to return any useful icon.
>> Not necessary.
>>
>> Add some info about why this bbappend still exists. It's to prefer
>> wayland over x11 and remove some unoptimized components.
>>
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>>   ...ons-bradient-display-window-icon-onl.patch | 42 -------------------
>>   .../recipes-qt/qt5/qtwayland_git.bbappend     |  8 ++--
>>   2 files changed, 3 insertions(+), 47 deletions(-)
>>   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwayland/0001-plugins-decorations-bradient-display-window-icon-onl.patch
>>
>> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-plugins-decorations-bradient-display-window-icon-onl.patch b/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-plugins-decorations-bradient-display-window-icon-onl.patch
>> deleted file mode 100644
>> index 33f28390..00000000
>> --- a/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-plugins-decorations-bradient-display-window-icon-onl.patch
>> +++ /dev/null
>> @@ -1,42 +0,0 @@
>> -From 547fd678ba55025c3578f021b40c96b1e91b839e Mon Sep 17 00:00:00 2001
>> -From: Eric Ruei <e-ruei1@ti.com>
>> -Date: Fri, 9 Sep 2016 16:54:02 -0400
>> -Subject: [PATCH] plugins/decorations/bradient: display window icon only if
>> - icon.pixmap not null
>> -
>> -Signed-off-by: Eric Ruei <e-ruei1@ti.com>
>> ----
>> - src/plugins/decorations/bradient/main.cpp | 17 ++++++++++-------
>> - 1 file changed, 10 insertions(+), 7 deletions(-)
>> -
>> -diff --git a/src/plugins/decorations/bradient/main.cpp b/src/plugins/decorations/bradient/main.cpp
>> -index ea29869..279bff1 100644
>> ---- a/src/plugins/decorations/bradient/main.cpp
>> -+++ b/src/plugins/decorations/bradient/main.cpp
>> -@@ -222,13 +222,16 @@ void QWaylandBradientDecoration::paint(QPaintDevice *device)
>> -     // Window icon
>> -     QIcon icon = waylandWindow()->windowIcon();
>> -     if (!icon.isNull()) {
>> --        QPixmap pixmap = icon.pixmap(QSize(128, 128));
>> --        QPixmap scaled = pixmap.scaled(22, 22, Qt::IgnoreAspectRatio, Qt::SmoothTransformation);
>> --
>> --        QRectF iconRect(0, 0, 22, 22);
>> --        p.drawPixmap(iconRect.adjusted(margins().left() + BUTTON_SPACING, 4,
>> --                                       margins().left() + BUTTON_SPACING, 4),
>> --                     scaled, iconRect);
>> -+        QPixmap pixmap = icon.pixmap(QSize(128, 128));
>> -+        if(!pixmap.isNull())
>> -+        {
>> -+            QPixmap scaled = pixmap.scaled(22, 22, Qt::IgnoreAspectRatio, Qt::SmoothTransformation);
>> -+
>> -+            QRectF iconRect(0, 0, 22, 22);
>> -+            p.drawPixmap(iconRect.adjusted(margins().left() + BUTTON_SPACING, 4,
>> -+                                           margins().left() + BUTTON_SPACING, 4),
>> -+                         scaled, iconRect);
>> -+        }
>> -     }
>> -
>> -     // Window title
>> ---
>> -1.9.1
>> -
>> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
>> index df8b5eff..11d8e2ce 100644
>> --- a/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
>> +++ b/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
>> @@ -1,8 +1,6 @@
>> -FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
>> -PR:append = ".arago2"
>> +# This append exists to modify the PACKAGECONFIG such that the wayland backend
>> +# is preferred over x11 and unoptimized components are removed.
> 
> If changing PACKAGECONFIG is the only need for a bbappend, then you should
> rather do it in the distro config:
> 
> https://git.yoctoproject.org/meta-arago/tree/meta-arago-distro/conf/distro/arago.conf#n72
> 

Fair enough. Expect a v3.

> 
>> -SRC_URI += " \
>> -    file://0001-plugins-decorations-bradient-display-window-icon-onl.patch \
>> -"
>> +PR:append = ".arago3"
>>   
>>   PACKAGECONFIG:remove = "xcomposite-egl xcomposite-glx"
>> -- 
>> 2.40.0


