Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1880FC07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 11:00:59 +0000 (UTC)
Received: from egress-ip12b.ess.de.barracuda.com (egress-ip12b.ess.de.barracuda.com [18.185.115.216])
 by mx.groups.io with SMTP id smtpd.web10.10609.1700046048922097814
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 15 Nov 2023 03:00:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=CTz2mXAp;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.216, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199]) by mx-outbound40-15.eu-central-1c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 15 Nov 2023 11:00:45 +0000
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1cc252cbde2so74105865ad.0
        for <meta-arago@lists.yoctoproject.org>; Wed, 15 Nov 2023 03:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google; t=1700046045; x=1700650845; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWsj+sJic7IL5mYBmvMdsFL6e8X3PrSOQFblasSmZz8=;
        b=CTz2mXApJiI8J2L615S+Eg+ymKT/TbLEifzosl1lWpVMiInFXRVuwqKM5KR0gDTxP2
         GEemFfDfZ/GyeCNLIp+xPQpw6IxNl2LMjRWrUovKJn19Ev4Kb21j1pJ9X2bWvl/MJ/6c
         tNlHifNgSzhfnacfKZIcAKa/f/f2Bov/Oh8UI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700046045; x=1700650845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CWsj+sJic7IL5mYBmvMdsFL6e8X3PrSOQFblasSmZz8=;
        b=sDCP3GrT2Y+NhFiewJHdrUH8J3b0zu7p07xzTSofW+MEI7QWF94JHhiMZsLji5Loa1
         /aealxRZNwMdA1ne+uC+V5LjcryowJsdmkHNC4pTy45V5WY3UWMwnG5zt9w9rt2K5RQN
         l/N0hbCOOOQtSlnx2kvbejRem7GU5Ay3VJ9hxivN1spijGrkC7nDf7B17FBhuZd3Vpoz
         fNkhRQeDM5iuFRX8W8PFJv02uxNPOpsSTNH2rf+1Uhmm1GNl+ATiYk1wE9GLIpVfFFcu
         6X6i16T5S+46qwfQ71llO5OAjm/OFf7lsusoCnQr4qrUoTPYsOjr90/85pYSRNXmOYsM
         n5kA==
X-Gm-Message-State: AOJu0Yzpfhg5NkuVjgnIehQMnpzO/nm05dxRdBa5tOpGMRrAevAkz40e
	E1lpEwVo9WH2ruivL0GxVHNL1c3BrEEvbe5cPzfYuy8Egch8qHYjzbZ3MV02HQHmxWVg2gQfyqh
	SjlsYW2kO88GA759btOZ00+65gnpgkIz3IAHgqim6XTzhRi7tjVchNP8WONUjNXxEUC0=
X-Received: by 2002:a17:902:e744:b0:1cc:6e8f:c14d with SMTP id p4-20020a170902e74400b001cc6e8fc14dmr6073620plf.50.1700046044833;
        Wed, 15 Nov 2023 03:00:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuHWfn0hhP42q8ajNNjxdcGLmUjSKPh+2bbs/5zz7o60b6LNpwcNnxd6sFhgUPUQRpdVVJvg==
X-Received: by 2002:a17:902:e744:b0:1cc:6e8f:c14d with SMTP id p4-20020a170902e74400b001cc6e8fc14dmr6073601plf.50.1700046044534;
        Wed, 15 Nov 2023 03:00:44 -0800 (PST)
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id k7-20020a170902c40700b001bc2831e1a8sm7207427plk.80.2023.11.15.03.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 03:00:43 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: reatmon@ti.com,
	denys@ti.com,
	detheridge@ti.com,
	meta-arago@lists.yoctoproject.org
Cc: Sinthu Raja <sinthu.raja@ti.com>
Subject: [meta-arago][krikstone][PATCH 2/2] images: Add support to pack the gc320 device libraries
Date: Wed, 15 Nov 2023 16:30:33 +0530
Message-Id: <20231115110033.4746-3-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20231115110033.4746-1-sinthu.raja@ti.com>
References: <20231115110033.4746-1-sinthu.raja@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1700046045-310255-12353-3680-1
X-BESS-VER: 2019.1_20231114.2339
X-BESS-Apparent-Source-IP: 209.85.214.199
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUirNy1bSUcovVrIyNDC2BLIygIJppommZgYpiW
	kmZuamKWYmqWmJBmnGqZbmlqaGqcYWhkq1sQDO6IULQQAAAA==
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.252154 [from 
	cloudscan9-22.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
	0.50 BSF_RULE7568M          META: Custom Rule 7568M 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_SC0_MISMATCH_TO, BSF_RULE7568M, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 15 Nov 2023 11:00:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15011

From: Sinthu Raja <sinthu.raja@ti.com>

The gc320 driver requires the supporting device libraries to render the
frames. Add support to install the ti-gc320-libs-dev into the final
package

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-default-image.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index 33ed0f57..baad409a 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -31,6 +31,7 @@ IMAGE_INSTALL += "\
     ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
     ti-analytics \
     ti-demos \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'gc320', 'ti-gc320-libs-dev', '', d)} \
     ${ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL} \
     packagegroup-arago-tisdk-sysrepo \
 "
-- 
2.36.1


