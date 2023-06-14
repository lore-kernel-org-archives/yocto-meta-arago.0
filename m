Return-Path: <res.sapp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F630C001DF
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 03:45:22 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.3796.1686714321626332068
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Jun 2023 20:45:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=cQJXU2cM;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: res.sapp@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6b29c972e00so3568708a34.1
        for <meta-arago@lists.yoctoproject.org>; Tue, 13 Jun 2023 20:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686714321; x=1689306321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5qMJwAnyUijMjp9M/jvElIGghdIqf4zPUMk5TBI3V0=;
        b=cQJXU2cM9SqiIqa6iU3dvRP3cxajmdtwijYZnmE8utaZNdXvr7K51nSSxNrcjxxa3H
         RfZK9X+P5ka/IoX+OGOEO4ZmP68RCZaqm9tTFgkyiNZFrlMNY+osOOlK1ud0iV+39UQW
         diS18rAxpN4Nvk0mryr07RUsSDUK5+EanPdU/+QM8mRt+hQmF7wz50xnsvVOYor7vSJj
         mymu9q2Z72GuTpy3dHQcusaXX6R+UL87gTvtCJwKP21TmS1Yb+1Km7MfILxEju0UBZAF
         fdeBG3Voh+mgulsxzsSDXUz9F5flzvwlKz35cz5skLwGQeitbO1SoH2LimzYDwO8kIXI
         /XAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686714321; x=1689306321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5qMJwAnyUijMjp9M/jvElIGghdIqf4zPUMk5TBI3V0=;
        b=c6k5WEhiVeo8YH6/4JuX7LSV1wPSWnjiixGencsewvG3xJA60VVZZdrvFH+VpItt87
         HMwRafsG8RKe9z6pmPeP0uuSUnOQnz4faep+x0nbXplrMXEADhXLgcqbEaLDDkugpC2K
         BVcFNRRG5Y9TFSjOscx57z93rs7r6k5XamGg8HywE/IHLhIiuM27TB0tIiJEx0z7XVBv
         gqtXUXdb6wVOfB+fokG0UsT95/4YuTH/HK+9m87141JmTCV7XprTsItxhCVVIq5hNN2n
         q4M0LuHzNz+nXOQFtUuKJkH9LE33zZNIqlnyxTXZDXLAHAW3XxerZap1kfvU1p4PCh2N
         Vq5Q==
X-Gm-Message-State: AC+VfDzlJnSdRo5mEAO2lsnHm9yslOS9+nYTCj4ifiecYIaMoQ/SEN8O
	3XTDf3ndSnDFXX+1KRJQYRI=
X-Google-Smtp-Source: ACHHUZ4xSiF6uApYk5dnTNv3p4xojmpmNOUHGHYEXSuwINB9zukmpB3YPYy8ExV2NvdFdV2cqibh8A==
X-Received: by 2002:a05:6830:164c:b0:6b2:8ee8:b9ea with SMTP id h12-20020a056830164c00b006b28ee8b9eamr12621530otr.23.1686714320958;
        Tue, 13 Jun 2023 20:45:20 -0700 (PDT)
Received: from rig.lan ([104.182.101.14])
        by smtp.gmail.com with ESMTPSA id s9-20020a9d7589000000b006a662e9f074sm5367538otk.58.2023.06.13.20.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 20:45:20 -0700 (PDT)
From: Randolph Sapp <res.sapp@gmail.com>
To: denis@denix.org,
	reatmon@ti.com,
	afd@ti.com,
	nm@ti.com,
	rs@ti.com
Cc: meta-arago@lists.yoctoproject.org,
	Randolph Sapp <res.sapp@gmail.com>
Subject: [oe-layersetup][PATCHv2 13/16] oe-layertool-setup: drop unused variable
Date: Tue, 13 Jun 2023 22:45:04 -0500
Message-ID: <20230614034507.598391-14-res.sapp@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230614034507.598391-1-res.sapp@gmail.com>
References: <20230614034507.598391-1-res.sapp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 14 Jun 2023 03:45:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14618

Drop the unused IMAGES variable.

Signed-off-by: Randolph Sapp <res.sapp@gmail.com>
---
 oe-layertool-setup.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index e0cfe4e..0928959 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -848,7 +848,6 @@ print_motd() {
 print_image_names() {
     SOURCES="${1}"
     FOLDERS=$(find "${SOURCES}" -type d -a -iname images|grep recipes-core|sed -e "s/.*sources\///g"|cut -d '/' -f1|sort -u -r)
-    IMAGES=""
     for FOLDER in ${FOLDERS}
     do
         RECO=""
-- 
2.41.0


