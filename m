Return-Path: <res.sapp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228F2C3DA41
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 03:45:22 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web10.3706.1686714320323256926
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Jun 2023 20:45:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=hgg219tj;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: res.sapp@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6b2c6238cf3so3403402a34.3
        for <meta-arago@lists.yoctoproject.org>; Tue, 13 Jun 2023 20:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686714319; x=1689306319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1ar81No7R0tYh6SXtYtcr/HyVs/GUQFauT/xovrGsY=;
        b=hgg219tjWul6n30btYEOi2AdbyIZAnFLuc42VCgT+wZnFlZwn3qsGPtQf43zexBX0/
         Egb9p1xWtCrGGCoXELJfOagffZGYFAItBuqjuT6E7fvU2c49IaYO/+opnVDEw7/gkd+1
         IbXuN/i7KxAwvyTQB7i5/gfzLF7LC66h7BnFC7PTjlCCuuTE/bcMizRf2ACzWMsnibG7
         Y862NFHckiGYQ0I3MGtMaxLQWkEreb8KVvhxqR/9i4dA0ammKyr9nwFzxvtLA/ixSX8Q
         5eBqVi9f8OCTwmOEa+wrfyI+UuS4OzLj7Uqx/W6Xl303D9rQj0sAvcRYdNdqRX6tOh3S
         IBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686714319; x=1689306319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1ar81No7R0tYh6SXtYtcr/HyVs/GUQFauT/xovrGsY=;
        b=ghQOc0FdE7rj2ism1ewPFjjIJWuJFprWiH8g2dlVhFVbuS+C2+DFOJv5msCHYhJQRh
         jBqqyzb9zPrNSxBjIyjb2vkf+xiVyERTlu67X72Y3ca9ztVgUE1nXvq9ZmQFIc/g7FjG
         e2KPEjgo1/c5Rg6CdG7rzKWE8axh+roec0u9P4M7n+mrE9vwa4aXXDlF+ntA3OaKha6a
         Ivz04ScgHUin9fynENHtgZ3CltLFsOMVYex8V5ZOst2DAUmd/K4BrWiAAE6gPnbiF9sB
         VN21Rayp56+eON/xtS4FFuEf9fOIG6EMnTfydLqg6eQDEnS0cn/467rZN923DnNrmzZ3
         A5wg==
X-Gm-Message-State: AC+VfDyWlYW1OWXSI70vkxAN3AqTL2S+KFgzA708z41l9rioSdZaiqTO
	C/XnDE0iL+WEDRxKkYzF4pE=
X-Google-Smtp-Source: ACHHUZ5RPDAzD0IdJ4Gd25yFVGYbPpGwK6TnrTmbeOXMFukn0RX2HVOLlAeoAoCajwMLawA/jjseWQ==
X-Received: by 2002:a05:6830:1d97:b0:6aa:ef9c:cb80 with SMTP id y23-20020a0568301d9700b006aaef9ccb80mr11802053oti.33.1686714319643;
        Tue, 13 Jun 2023 20:45:19 -0700 (PDT)
Received: from rig.lan ([104.182.101.14])
        by smtp.gmail.com with ESMTPSA id s9-20020a9d7589000000b006a662e9f074sm5367538otk.58.2023.06.13.20.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 20:45:19 -0700 (PDT)
From: Randolph Sapp <res.sapp@gmail.com>
To: denis@denix.org,
	reatmon@ti.com,
	afd@ti.com,
	nm@ti.com,
	rs@ti.com
Cc: meta-arago@lists.yoctoproject.org,
	Randolph Sapp <res.sapp@gmail.com>
Subject: [oe-layersetup][PATCHv2 11/16] oe-layertool-setup: guard against invalid expression in case
Date: Tue, 13 Jun 2023 22:45:02 -0500
Message-ID: <20230614034507.598391-12-res.sapp@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230614034507.598391-1-res.sapp@gmail.com>
References: <20230614034507.598391-1-res.sapp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 14 Jun 2023 03:45:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14616

Guard against and invalid expression in the main option case statement.

Signed-off-by: Randolph Sapp <res.sapp@gmail.com>
---
 oe-layertool-setup.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index 8e29f9a..e427393 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -962,7 +962,7 @@ do
         o ) outputfile="$OPTARG";;
         d ) dldir="$OPTARG";;
         b ) oebase="$OPTARG";;
-        h ) usage;;
+        * ) usage;;
     esac
 done
 
-- 
2.41.0


