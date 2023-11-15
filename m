Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 303D1C47074
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 11:00:49 +0000 (UTC)
Received: from egress-ip43b.ess.de.barracuda.com (egress-ip43b.ess.de.barracuda.com [18.185.115.247])
 by mx.groups.io with SMTP id smtpd.web10.10608.1700046046124656852
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 15 Nov 2023 03:00:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=OCpIbWAh;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.247, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199]) by mx-outbound40-15.eu-central-1c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 15 Nov 2023 11:00:43 +0000
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1cc49991f33so8600345ad.1
        for <meta-arago@lists.yoctoproject.org>; Wed, 15 Nov 2023 03:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google; t=1700046042; x=1700650842; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N68moMwrVYYGHr00cy43MEk115WIvbCnSdIFW77wutw=;
        b=OCpIbWAhcTHk7Cbyc7QeVDE+nkx7fMriHgzm/svUaOxccnfxD8t0iwclHHcjIEiG2n
         42SwwwXOH6/yYfi72ZAIRgYYQRlhda5D3ddoa0zsnSfxujKKDO+KxnctD+MLhmALCcer
         9gA1JGEynQPH8Hy5wYwh0PdfxM+R3fyiSfnfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700046042; x=1700650842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N68moMwrVYYGHr00cy43MEk115WIvbCnSdIFW77wutw=;
        b=pkJeXfAdBJ3w7CG+MgnILI2NbRkVsu641Uh95tuLozpTLrCoobsfNIpYfOSAEkxJap
         dYiAaQYICAaLNo9LQpKapqPuxkQRGwFSAily0z6oQA1y3mJXaMX3zl2ndRS3qK6o2qLJ
         An77o2UlzFhrdirFkcUAYBHfl3/a5lK2j47lg8NExKqrbTygmVTO3F+NqZNsVZx6pL5q
         5tS7N4O4Pfe8FhblRbC78JiB7AntbIgzk4Ps82m/2qdsJ8q8q1eBf0F+8Lmke0aQgNVz
         RFI2MFNGwwV8zMM9ZUQvnzCDZYkqx4VO8ZsijpRAkykE1GN7GKedDcUqAtvtPFzctWnm
         9y1Q==
X-Gm-Message-State: AOJu0Yz+VJ9zDhsQIzwxtV6UT2QJdTztINFiGfSfd5f/xIIzHU0Pe77j
	xaDjlituhq7jqSYDHNMuBCGTcPeqoqSJEOH9pYGqefaTit+imHkTSDoE/oHZiom9kZNaQXqhm3h
	KFLoH4YR/oh9+uw9TXV5uv/z+Z0AwfSnnUFgoExqDZMZMSTo9cUbwYE7NgpzCkreDWiU=
X-Received: by 2002:a17:902:e547:b0:1cc:2518:ef02 with SMTP id n7-20020a170902e54700b001cc2518ef02mr7223210plf.14.1700046042229;
        Wed, 15 Nov 2023 03:00:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHn8VkFuNGWR84aAS5/ny9mmQ5c2GoyY0WyekHMTcZSHzo4GHIYf8nGvTQuZLDTY3UZvgALBg==
X-Received: by 2002:a17:902:e547:b0:1cc:2518:ef02 with SMTP id n7-20020a170902e54700b001cc2518ef02mr7223178plf.14.1700046041876;
        Wed, 15 Nov 2023 03:00:41 -0800 (PST)
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id k7-20020a170902c40700b001bc2831e1a8sm7207427plk.80.2023.11.15.03.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 03:00:40 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: reatmon@ti.com,
	denys@ti.com,
	detheridge@ti.com,
	meta-arago@lists.yoctoproject.org
Cc: Sinthu Raja <sinthu.raja@ti.com>
Subject: [meta-arago][krikstone][PATCH 1/2] branding-core: Add gc320 driver for AM57x platforms
Date: Wed, 15 Nov 2023 16:30:32 +0530
Message-Id: <20231115110033.4746-2-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20231115110033.4746-1-sinthu.raja@ti.com>
References: <20231115110033.4746-1-sinthu.raja@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1700046042-310255-12353-3677-1
X-BESS-VER: 2019.1_20231114.2339
X-BESS-Apparent-Source-IP: 209.85.214.199
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUirNy1bSUcovVrIyNDY1BLIygIIWhmapBhapaW
	nmZsaGJoamxqmmKZYWpgZGFobGyaYGZkq1sQDSa6xbQQAAAA==
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.252154 [from 
	cloudscan19-217.eu-central-1b.ess.aws.cudaops.com]
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
 <meta-arago@lists.yoctoproject.org>; Wed, 15 Nov 2023 11:00:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15010

From: Sinthu Raja <sinthu.raja@ti.com>

Enable the GC320 driver support for AM57x platforms which was temporarily
disabled for LTS prep.

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---
 .../conf/distro/include/branding-core.inc           | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index 79dadc11..ed1dc6b8 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -15,6 +15,13 @@ ALTERNATIVE_PRIORITY:pn-ti-ipc-rtos = "15"
 # Remove mmip - DRM allocator, KMS sink, Wayland sink need porting to GST 1.18
 MACHINE_FEATURES:remove = "mmip"
 
-# GC320 support requires out-of-tree drivers not available in until LTS prep is
-# complete. Disable for now.
-MACHINE_FEATURES:remove = "gc320"
+MACHINE_FEATURES:remove:am62xx = "gc320"
+MACHINE_FEATURES:remove:am62axx = "gc320"
+MACHINE_FEATURES:remove:am64xx = "gc320"
+MACHINE_FEATURES:remove:j784s4 = "gc320"
+MACHINE_FEATURES:remove:j721s2 = "gc320"
+MACHINE_FEATURES:remove:j7200 = "gc320"
+MACHINE_FEATURES:remove:j721e = "gc320"
+MACHINE_FEATURES:remove:am335x = "gc320"
+MACHINE_FEATURES:remove:am65xx = "gc320"
+MACHINE_FEATURES:remove:am437x = "gc320"
-- 
2.36.1


