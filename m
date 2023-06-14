Return-Path: <res.sapp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03217EB64DB
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 03:45:21 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.3699.1686714313183723986
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Jun 2023 20:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PygcTxbr;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: res.sapp@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6b251ef7b77so3264975a34.0
        for <meta-arago@lists.yoctoproject.org>; Tue, 13 Jun 2023 20:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686714312; x=1689306312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IQ0LqD9EYtdEEN9WZpCdVp/aGDM5Z3MQamge/Ss3KTA=;
        b=PygcTxbraFmnFFJPeEV+XPl8fqABmz7hF5fk7wsNJLC3xBtcVzJ7RaqDwu2RBp5rip
         vLjQj73sIeLsW7MrN+L8Uuvb3cgl9SgwevVFZ1wB9gcZeYjo3iGZiIZKK1/S19ELbG74
         pS2bTgiz3Zb8sRRu2ZAMOCjXUYcsbfwFxDSnQa9zlYuN4TGrrKZGQcIlX+BcA789Ito1
         a1OAw8vYbTk/Nf4AVNd/4b1aeN8/6L74I2v90Y7fRb7pYy01d/zicvqupl6YKOH3JK6e
         rxhs8p4P1BBuVGlOHJeRxLPtjKiX5kVVYINcTT1704ucEqT7EyehzZGUpl0zM8ayFb1v
         E4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686714312; x=1689306312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IQ0LqD9EYtdEEN9WZpCdVp/aGDM5Z3MQamge/Ss3KTA=;
        b=ZT8IMz8SGMiGz7ZBUeMEMZw0BFLjlyf2B0jYWT6FDe0WN2kHkmbz5M164FNqKUDbpi
         znK3vwV2sScZzA0HAu2owS/BDbc0uRRSEZgJiV0BEKRMYXrGLB4TcoXI07MruMMz01V5
         vyO+dmN3HAyXNsWVrzj6XbgUcvQut+QN/l/kKxtyXdCKCRoNgDuIFifpQ2VI5VSQB9d7
         MmcR8L8nrllbr0FUPSp/ucrvkTo3TtWg8RQauHW7hHwc3YZK3gtOg8SK5tDers/lXsAL
         U3uJik0UXBKAZKP5voZBEH2d3uUpj0CDz5KzSFleTc4izLuJKHyiY6eIff/9G4BwtETc
         1sDw==
X-Gm-Message-State: AC+VfDyF4MFmZqc69EjXI1kCQOEFr0WAiwF1ecp1mmUoS7GbSrw2qRzC
	TFc3xxzXLe1nREh7j2b0NOk=
X-Google-Smtp-Source: ACHHUZ7YPAaWNKPc7ryIU0drErGOMKXrYBnUglFQUgoH/vxjszkBaLmbeiSm5ANAmtdooiuwSIvGhA==
X-Received: by 2002:a05:6830:154c:b0:6b2:94ab:6096 with SMTP id l12-20020a056830154c00b006b294ab6096mr239287otp.2.1686714312441;
        Tue, 13 Jun 2023 20:45:12 -0700 (PDT)
Received: from rig.lan ([104.182.101.14])
        by smtp.gmail.com with ESMTPSA id s9-20020a9d7589000000b006a662e9f074sm5367538otk.58.2023.06.13.20.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 20:45:12 -0700 (PDT)
From: Randolph Sapp <res.sapp@gmail.com>
To: denis@denix.org,
	reatmon@ti.com,
	afd@ti.com,
	nm@ti.com,
	rs@ti.com
Cc: meta-arago@lists.yoctoproject.org,
	Randolph Sapp <res.sapp@gmail.com>
Subject: [oe-layersetup][PATCHv2 00/16] Sacrifice your first born to the linter
Date: Tue, 13 Jun 2023 22:44:51 -0500
Message-ID: <20230614034507.598391-1-res.sapp@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 14 Jun 2023 03:45:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14605

A few days ago someone in the beagle community reported some cryptic
errors from oe-layersetup so I took the time to address all of the
issues reported by Shellcheck and add some extra sanity checks.

I tried to split it into reasonable segments.

Resubmitting with a sane email I guess. Probably good I had to resubmit
it. Apparently somewhere along the way a patch was dropped in the first
series.

Randolph Sapp (16):
  oe-layertool-setup: split logic and/or expressions
  oe-layertool-setup: prefer use of $() notation
  oe-layertool-setup: replace all x comparisons with -n/-z
  oe-layertool-setup: fix all the printf calls
  oe-layertool-setup: fix all quoting, switch eval to export
  oe-layertool-setup: only invoke read with -r
  oe-layertool-setup: check exit code directly
  oe-layertool-setup: guard all cd calls
  oe-layertool-setup: eliminate useless cat
  oe-layertool-setup: use subshell execution with redirect
  oe-layertool-setup: guard against invalid expression in case
  oe-layertool-setup: replace all calls to echo with printf
  oe-layertool-setup: drop unused variable
  oe-layertool-setup: add a path sanity check for oebase
  oe-layertool-setup: fix multi-line printfs
  oe-layertool-setup: add sanity check for layer names

 oe-layertool-setup.sh | 435 +++++++++++++++++++++---------------------
 1 file changed, 220 insertions(+), 215 deletions(-)

-- 
2.41.0


