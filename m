Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED5DC46CA3
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 14:36:48 +0000 (UTC)
Received: from egress-ip43b.ess.de.barracuda.com (egress-ip43b.ess.de.barracuda.com [18.185.115.247])
 by mx.groups.io with SMTP id smtpd.web10.33196.1701873400024625237
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 06 Dec 2023 06:36:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=U+gCgmvJ;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.247, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198]) by mx-outbound23-61.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 06 Dec 2023 14:36:37 +0000
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-35d59b965b9so51679685ab.2
        for <meta-arago@lists.yoctoproject.org>; Wed, 06 Dec 2023 06:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google; t=1701873397; x=1702478197; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8u6W9qgAQOsHh12vmjFPdGFu6ICcG35q0SUMNnvCPI=;
        b=U+gCgmvJYuc8Zj7KDmZlTv6ZxPAMCuSkEww04N0pGbK8EPRi9EJdb4vJDFqUeLhqBu
         MIuywP1DpYedlitQ3ceIPkq8xAXmTz5IMgVI/1fKPfTshs3XFZuI33WpIa3IF1Dnhnfn
         PCoq9bw0BG/q1f4rxL0wixL20AU9Bamnb9GDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701873397; x=1702478197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8u6W9qgAQOsHh12vmjFPdGFu6ICcG35q0SUMNnvCPI=;
        b=UulqQ/M6W02hW7NzdkE4hlkmqnI8DG87Bh/GLx3B4t9f+xmDCKZgwpLUHZvsNlhEvT
         mrMq2Zpi02eaRmWF6vlBxpX27dRPGrnOsg1k08OSVw+diaaLvP8sQt/D2vKxyGiRqdAl
         WidL5GHPjtItJiA33vojebish7xLBZyqQg0tHpnWDM/2XhjiSouPDs+lM9MaHIHwE8KY
         uZ3eMTykCfOpmThtCUHM/+DzB5Crjd5ISP9IU7JwafKSNc38dG5HfUdHUQVV9N+byMfx
         qdF3em++1cd7fBFrqSIr6afwY2NZbedhDERD0Hp/agA+w6mUIgosYuQThARDVKmWTSvc
         YZUw==
X-Gm-Message-State: AOJu0Yy+/G4VIP9XOWuV94qJgJA9o69mJl2LuC/Eu8yV4MoKnjsQxrB6
	nf5foj/D6QjXsgw8HvyBaESpyuSqim7yrWcclc+z9K4nyifPSRhAQZc8XFRPX+jrjDAMbx/TmOq
	WyZd/uNYLkJ/rNYGokUMVefd0lEgaS4LMK/QcIcysB73yfZW8JyexvTMr5CAikE79WKo=
X-Received: by 2002:a92:de0c:0:b0:35d:5ff1:7842 with SMTP id x12-20020a92de0c000000b0035d5ff17842mr1119260ilm.53.1701873397043;
        Wed, 06 Dec 2023 06:36:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/p5Ej+o8AzcRJcDajRIEacITbNerRr417iI9F98gIVreFT2TdTdhDXKBCMvflP8svj7sIMg==
X-Received: by 2002:a92:de0c:0:b0:35d:5ff1:7842 with SMTP id x12-20020a92de0c000000b0035d5ff17842mr1119253ilm.53.1701873396771;
        Wed, 06 Dec 2023 06:36:36 -0800 (PST)
Received: from LAP568U.mistral.in ([106.51.69.35])
        by smtp.gmail.com with ESMTPSA id s25-20020a639e19000000b005c67ca3c2c2sm265pgd.21.2023.12.06.06.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 06:36:36 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: reatmon@ti.com,
	denys@konsulko.com,
	praneeth@ti.com
Cc: meta-arago@lists.yoctoproject.org,
	u-kumar1@ti.com,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: [meta-arago][krikstone][PATCH RFC 3/4] ti-test: Remove OAMP-DRM test
Date: Wed,  6 Dec 2023 20:06:17 +0530
Message-Id: <20231206143618.27770-4-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20231206143618.27770-1-sinthu.raja@ti.com>
References: <20231206143618.27770-1-sinthu.raja@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1701873397-305949-12365-23170-1
X-BESS-VER: 2019.1_20231116.1739
X-BESS-Apparent-Source-IP: 209.85.166.198
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUirNy1bSUcovVrIyNDAxAbIygIKGxmnmpoamxi
	lmaeYWyUlGFqkGliapRgZJpokpZmbGJkq1sQCWvz9WQQAAAA==
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.252636 [from 
	cloudscan22-252.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_SC0_MISMATCH_TO, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 06 Dec 2023 14:36:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15036

From: Sinthu Raja <sinthu.raja@ti.com>

The omapdrm test is outdated and the required test cases shall be executed
using the GST commands. Disable the same until the omapdrm test is updated.

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---
 meta-arago-test/recipes-core/packagegroups/ti-test.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index cf720c03..9a6dc67a 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -87,15 +87,12 @@ TI_TEST_TI_TOOLS:append:ti43x = " \
     switch-config \
 "
 
-NOT_MAINLINE_MMIP_DEPS = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)}"
-
 TI_TEST_TI_TOOLS:append:omap-a15 = " \
     omapconf \
     pru-icss \
     switch-config \
     ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', " \
         ti-ipc-test \
-	    ${NOT_MAINLINE_MMIP_DEPS} \
     ", d)} \
 "
 
-- 
2.36.1


