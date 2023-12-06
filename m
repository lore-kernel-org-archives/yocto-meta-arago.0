Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED24C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 14:36:48 +0000 (UTC)
Received: from egress-ip12a.ess.de.barracuda.com (egress-ip12a.ess.de.barracuda.com [18.184.203.235])
 by mx.groups.io with SMTP id smtpd.web11.32828.1701873404751747006
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 06 Dec 2023 06:36:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=Dcr7ZpZX;
 spf=pass (domain: mistralsolutions.com, ip: 18.184.203.235, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197]) by mx-outbound47-82.eu-central-1c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 06 Dec 2023 14:36:42 +0000
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1d0737b7262so25818665ad.1
        for <meta-arago@lists.yoctoproject.org>; Wed, 06 Dec 2023 06:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google; t=1701873400; x=1702478200; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wwFnt8323wLNijdbMjSGKEz9lL3z2FAormBxERw3SQ=;
        b=Dcr7ZpZXfL234ERLOs1Uu4aF2j0BOc616wzzqxm1XHuH4oWximTNa48fA9qjqlj1bH
         BaiUMMwuX84U808hwhmOrQGYSJpDbMJsU9Y8CfFwUL/DgaKmJC+ONp9Oh+WQRq2z6Bjs
         l/pcNbjUVZsdVkjYEsqJMOBFU8BswkDd3mPp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701873400; x=1702478200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7wwFnt8323wLNijdbMjSGKEz9lL3z2FAormBxERw3SQ=;
        b=Fn/Z/qMoAVBrSQl5NcWtdCGzlMErHYhpVbKa4UapTZIOi9cNk/ib2Z0woELs72zeK/
         B9DLYwAN4OpyVCn+9bZz/bsljG88MyyoJMNth/2LWoqlhWM8jEf3JTCfEoWJRu87ICiM
         ZhCW9MYyeVN2ifQV2ROiX8uSj+Gxhu9mE/OgIorBSujP7A0vPhImUtPZQgehj6aFgdSW
         oVsOFo1sveLX2TfVtGTPIPGEfe3vpGJbw1c04mxlh093EWxy0yDwhjQkKFIE2777t37r
         qPCLRqnXXazjGNuXKoWHzKfqWz9miKHv696VqZuBMHcqc8+AG9yvqF6PMnKmNC7Waaze
         zMkQ==
X-Gm-Message-State: AOJu0Yxlqx/fWhRw+g43Hg6IocbT2vodezyq1ikAKKz5tbEY8JOL+eW/
	ZZGJDh9p8zzoJ0RKn6Nz9+E9HaeZ1RkqH7zzdLvPHm/TKhIeI/7cn19nrbqu8iDAzM0DJ8juV/A
	oDe6qL+cuXo63wIdPMbsdkaVMgJkrQBgm+NZw++Mv1cwIJHBtj1zu1U2WG3+zDfPyTC0d2oD95k
	F4tg==
X-Received: by 2002:a17:902:f543:b0:1d0:aeda:9add with SMTP id h3-20020a170902f54300b001d0aeda9addmr760544plf.42.1701873399985;
        Wed, 06 Dec 2023 06:36:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFF51pB0QUYA31e2w3CZA9gi/4hOKeElsSC4kGj7Rlr+9ddWTjbPpbsRjCM51t8eZGFeqC1Jg==
X-Received: by 2002:a17:902:f543:b0:1d0:aeda:9add with SMTP id h3-20020a170902f54300b001d0aeda9addmr760524plf.42.1701873399580;
        Wed, 06 Dec 2023 06:36:39 -0800 (PST)
Received: from LAP568U.mistral.in ([106.51.69.35])
        by smtp.gmail.com with ESMTPSA id s25-20020a639e19000000b005c67ca3c2c2sm265pgd.21.2023.12.06.06.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 06:36:39 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: reatmon@ti.com,
	denys@konsulko.com,
	praneeth@ti.com
Cc: meta-arago@lists.yoctoproject.org,
	u-kumar1@ti.com,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: [meta-arago][krikstone][PATCH RFC 4/4] branding-core: enable mmip for AM57x platform
Date: Wed,  6 Dec 2023 20:06:18 +0530
Message-Id: <20231206143618.27770-5-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20231206143618.27770-1-sinthu.raja@ti.com>
References: <20231206143618.27770-1-sinthu.raja@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1701873401-312114-12328-21950-1
X-BESS-VER: 2019.1_20231116.1739
X-BESS-Apparent-Source-IP: 209.85.214.197
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUirNy1bSUcovVrIyNDAwBLIygILGFikpSaam5k
	lGJommlhaGSUmWKeaphqbGZmmpBkZmKUq1sQAcA0S/QQAAAA==
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.252636 [from 
	cloudscan23-120.eu-central-1b.ess.aws.cudaops.com]
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
 <meta-arago@lists.yoctoproject.org>; Wed, 06 Dec 2023 14:36:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15037

From: Sinthu Raja <sinthu.raja@ti.com>

Now that the gstreamer plugins are enabled and ported to 1.20 enable
the mmip for AM57x platform

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-core.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index 79dadc11..85aa09b6 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -12,9 +12,6 @@ ALTERNATIVE_PRIORITY:pn-opencl-monitor-ipu = "1"
 # Raise priority for sample IPC FW images
 ALTERNATIVE_PRIORITY:pn-ti-ipc-rtos = "15"
 
-# Remove mmip - DRM allocator, KMS sink, Wayland sink need porting to GST 1.18
-MACHINE_FEATURES:remove = "mmip"
-
 # GC320 support requires out-of-tree drivers not available in until LTS prep is
 # complete. Disable for now.
 MACHINE_FEATURES:remove = "gc320"
-- 
2.36.1


