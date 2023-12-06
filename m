Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8258BC10DC1
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 14:36:38 +0000 (UTC)
Received: from egress-ip12a.ess.de.barracuda.com (egress-ip12a.ess.de.barracuda.com [18.184.203.235])
 by mx.groups.io with SMTP id smtpd.web11.32826.1701873396847335702
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 06 Dec 2023 06:36:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=SotuWwWU;
 spf=pass (domain: mistralsolutions.com, ip: 18.184.203.235, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199]) by mx-outbound47-82.eu-central-1c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 06 Dec 2023 14:36:34 +0000
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-35d61a3a0d8so45185305ab.2
        for <meta-arago@lists.yoctoproject.org>; Wed, 06 Dec 2023 06:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google; t=1701873393; x=1702478193; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmI9tdmmiByGVRRdRtlXhgJ9hZVszu/vAha6WqKNGS4=;
        b=SotuWwWUZjU6rfgN64X297NVHT3EXDC8EKOMCXXHLilX2Zta49ARH5TheEhguXiQe5
         PKLWvcckTwN1H8oExjwr13gPIyVwhgkQtszr/NBDU0mT9Cx0TuwUpRVlcXsbwCUlXHZS
         63i4R5cUTrb7jSTCzBsgdfxBi1Km2q9qjqV3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701873393; x=1702478193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mmI9tdmmiByGVRRdRtlXhgJ9hZVszu/vAha6WqKNGS4=;
        b=rLhGdVPug42A9uJdyNu6zh6lbfM79t4sAooxAiING3MMpwyV1GJGMoROhK+ZApHgbz
         MvbNUBem8z6hVwwl8McUS0LwflepM+jhXnDAq0llkWctg9RKyg0OTjtq2T4zt641+9rx
         uQQo1emWdefXEOT3wax1H8XNw8gP/9x/0pClMscbmaLcaPn2Sa5k/8VsCbdPAcvrpmhj
         EbO9hXBOlTaL4qC2hktIA6YZXv7QR3Nq+4ufhVUO+s2CRBpEoHgRLDQsbiOykNjVt5cs
         bePx6GksH4tY2Jv99et2pVKvaEex2q6pCVtBx/kujFts6w//8jtKNwKYgm10YrhYkACH
         vzAQ==
X-Gm-Message-State: AOJu0YwXDDrNnZo/ROcqeD5kBu4+8739PEGTE5PP4BT0VMVhO/zGimwa
	lg9YRx/gpIHgRRe+k3ceUzqUa/mgZiOPO6h7C8SZfesQs0k5mQMHgIeJN0PBulSqQkRP+BLh7rd
	xVQiYtLsKd9vPDRs5TQ234hfavQFvtYPeXToTqpMiiTwrTXbnlYzPavR3+WnM/4LK6LA=
X-Received: by 2002:a05:6e02:1522:b0:35d:59a2:be1 with SMTP id i2-20020a056e02152200b0035d59a20be1mr1190723ilu.119.1701873393443;
        Wed, 06 Dec 2023 06:36:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEoObYrmm5+mmnX/0yWkZf3vUyWWzY3wG1TRjCnYTRgd5bHln8aZQo/tdkHy4goDZ86hxwWKw==
X-Received: by 2002:a05:6e02:1522:b0:35d:59a2:be1 with SMTP id i2-20020a056e02152200b0035d59a20be1mr1190713ilu.119.1701873393193;
        Wed, 06 Dec 2023 06:36:33 -0800 (PST)
Received: from LAP568U.mistral.in ([106.51.69.35])
        by smtp.gmail.com with ESMTPSA id s25-20020a639e19000000b005c67ca3c2c2sm265pgd.21.2023.12.06.06.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 06:36:32 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: reatmon@ti.com,
	denys@konsulko.com,
	praneeth@ti.com
Cc: meta-arago@lists.yoctoproject.org,
	u-kumar1@ti.com,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: [meta-arago][krikstone][PATCH RFC 2/4] gst-plugins-ti: Enable network task flag for do_configure
Date: Wed,  6 Dec 2023 20:06:16 +0530
Message-Id: <20231206143618.27770-3-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20231206143618.27770-1-sinthu.raja@ti.com>
References: <20231206143618.27770-1-sinthu.raja@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1701873394-312114-12327-21971-1
X-BESS-VER: 2019.1_20231116.1739
X-BESS-Apparent-Source-IP: 209.85.166.199
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUirNy1bSUcovVrIyNDMzB7IygIIGZklGZhaGSe
	aWycbmhoYGyamJhilppiZmxqmWSYbGpkq1sQCwviWDQQAAAA==
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.252636 [from 
	cloudscan18-156.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, BSF_SC0_MISMATCH_TO
X-BESS-BRTS-Status: 1
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 06 Dec 2023 14:36:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15035

From: Sinthu Raja <sinthu.raja@ti.com>

The Ducati and VPE gst plugins requires network during the do_configure task
so, enable the network task flag for the same.

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---
 .../gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb           | 2 ++
 .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb              | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
index 1ff2dfb0..99a5615c 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
@@ -18,4 +18,6 @@ SRC_URI = " \
     file://0001-gstducati-configure.ac-stop-using-export-symbols-reg.patch \
 "
 
+do_configure[network] = "1"
+
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
index 237031b1..25d4d9c2 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
@@ -15,3 +15,5 @@ SRCREV = "b9dba5a8bc7d14d55125abdce04672e3dc30bbdf"
 SRC_URI = "git://git.ti.com/git/glsdk/gst-plugin-vpe.git;protocol=https \
            file://0001-gstvpe-configure.ac-stop-using-export-symbols-regex.patch \
 "
+
+do_configure[network] = "1"
-- 
2.36.1


