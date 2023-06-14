Return-Path: <res.sapp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F28EB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 03:45:32 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.3799.1686714323611521293
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Jun 2023 20:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=DcFnA74v;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: res.sapp@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-55b619e0ed1so228753eaf.3
        for <meta-arago@lists.yoctoproject.org>; Tue, 13 Jun 2023 20:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686714323; x=1689306323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Szb/fNuCkckT1a0XEXrN6vyHjFPnYIlFaWgxgd81Itc=;
        b=DcFnA74vvG7ZGyKuqggEZEr8U6znBhpxp47uA/gllt/r6a/z2uysg3cwgcBY1A7M5u
         KNtQ1ck1a/q+q1tuT7gMTdlQd2LlQF46vnJlLTf2MHuBr5PPf3XkU4y5a57WmbiXxG5B
         ahiL2zgsMcXmqNB1klyJJ7VycmBqEFb+5i9YF4O8jziQdUaFcdaTBCuRVL4SqY1xZUxv
         g54myHN77z6WUH08lbvD65VobnRi7NDRPxtPZObSPGlOoBO9SDMU9n3i46M7Ur8o7RoV
         IAuW6OUymRQx7pxDKKwyv5Qm+3hWhisBPCtWCe3QhHbfZEzJGQLbAJppZljlvGT3937L
         sTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686714323; x=1689306323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Szb/fNuCkckT1a0XEXrN6vyHjFPnYIlFaWgxgd81Itc=;
        b=Fi9OcD710yFy32V8xn2XizaEfoQ7MaZ+H0LNXWmiQwyHnGxrDBxxqNh3XvLcezgyUt
         /539Lt0JtHg7ftyoFbPM/rTIHaWqcrpec/O3KuABfa6mRdmw7f2pdR3MCy9VLVUP6GWX
         sgrKLpgqfrwzhwDre4BP/pD77TOBn9/7OZcwgqsP9+TYhHNoEtaVlgs8ljjFf9rWV8ul
         3YgwZLP5OkG8VaEpSZ/IV9D2lBnSpNDgfA+YRiUkayqN2r8dfVeG6uuTo/vwOaLSsZEk
         gs4peO7/RevOcKpqpuioHebhsneH2JJuW2lxBTqOtm6kpJBZ2bX8RKrJ3a/9ORZMzI9H
         KwQw==
X-Gm-Message-State: AC+VfDw4iMJ0AjF4azGYfATUgjjm1IOILE+Vc0wzGTUaG3c5F0afQ9IW
	gERDNzwQGXNj/+ck26VyuUM=
X-Google-Smtp-Source: ACHHUZ6tXth/tECiI53D74HsrUm3PuzgE09f9tWy5SG47riO12c2oWVgc75im2fPRToHqGRxnFDNpA==
X-Received: by 2002:a4a:e1d6:0:b0:55b:8573:b339 with SMTP id n22-20020a4ae1d6000000b0055b8573b339mr6296884oot.4.1686714322952;
        Tue, 13 Jun 2023 20:45:22 -0700 (PDT)
Received: from rig.lan ([104.182.101.14])
        by smtp.gmail.com with ESMTPSA id s9-20020a9d7589000000b006a662e9f074sm5367538otk.58.2023.06.13.20.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 20:45:22 -0700 (PDT)
From: Randolph Sapp <res.sapp@gmail.com>
To: denis@denix.org,
	reatmon@ti.com,
	afd@ti.com,
	nm@ti.com,
	rs@ti.com
Cc: meta-arago@lists.yoctoproject.org,
	Randolph Sapp <res.sapp@gmail.com>
Subject: [oe-layersetup][PATCHv2 16/16] oe-layertool-setup: add sanity check for layer names
Date: Tue, 13 Jun 2023 22:45:07 -0500
Message-ID: <20230614034507.598391-17-res.sapp@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230614034507.598391-1-res.sapp@gmail.com>
References: <20230614034507.598391-1-res.sapp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 14 Jun 2023 03:45:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14621

Due to POSIX shell string parsing limitations we currently can't parse
layer names with spaces. Display an error message and bail out when
detected.

Signed-off-by: Randolph Sapp <res.sapp@gmail.com>
---
 oe-layertool-setup.sh | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index 2b05550..16b7844 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -211,6 +211,13 @@ parse_repo_line() {
     then
         temp_layers=""
         temp=$(printf '%s\n' "$parsed_layers" | cut -d= -f2)
+        # sanity check for whitespace in layer names string
+        if printf '%s\n' "$temp" | grep -q '\s'
+        then
+            printf '%s\n' "Whitespace character detected in layer names string!" \
+                          "This is currently unsupported." ;
+            exit 1
+        fi
         # use tr to split the layers since we assume layer names don't have
         # whitespace characters later anyway
         for x in $(printf '%s\n' "$temp" | tr ':' ' ')
-- 
2.41.0


