Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F740C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 11:00:49 +0000 (UTC)
Received: from egress-ip43b.ess.de.barracuda.com (egress-ip43b.ess.de.barracuda.com [18.185.115.247])
 by mx.groups.io with SMTP id smtpd.web10.10607.1700046043068900290
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 15 Nov 2023 03:00:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=J1n82jGT;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.247, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199]) by mx-outbound22-47.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 15 Nov 2023 11:00:40 +0000
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1cc56a9ece7so79218065ad.3
        for <meta-arago@lists.yoctoproject.org>; Wed, 15 Nov 2023 03:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google; t=1700046039; x=1700650839; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=np25Va4Ia9xNXGiDmERHpzzMfduC7bSSyD1JZepxINY=;
        b=J1n82jGTsWffA2fnynEWEInbolbbotca+bI+kO5q15ECllCFtL+xBXKRHPvFxt3UTp
         oGi1e+fchIqnDQvINAd6y7yw6pwYlSw8VBw+/9bn+1kfX33az0c8pOgPNzi5McOOGiEm
         UJtG4wOmMWwadIG3v/jn3fpHnUd28Bh8lQJ9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700046039; x=1700650839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=np25Va4Ia9xNXGiDmERHpzzMfduC7bSSyD1JZepxINY=;
        b=MVyzoTT7xlDfUPobWjzLHJtre89L7/hPCzsoV0ie4j1+qy6AJ2WZrBl7qcmUKuCtPK
         Aa0uyAvdDehz+kzrsCnANkrvbI+2piJ+6k6VBPdp6XYqulVyAsanwM1IavT3c7buHVvC
         T+SEjE0mmheIpms9WLM7CpZIr4M3mfOBsqBrXrAYL6dC3UeQDU0zcVj+Di6BR2pqVdKM
         xUsSqMJYiE+wEZUUcPQfMBRx3IHa3AF64vtbCJtEZdfh9YkZd5QeSgHjj7GCUy5EorkQ
         dZIQAtwJpMCQ39jwPT6iCUEPBfJFT+mNK1fCtZ8m+cTY6jInCT3uM8gQAom4dj4PAs+M
         0oJQ==
X-Gm-Message-State: AOJu0YxcHLhkziP0TR6OVxXKxzCve0F+0lMPy/MvwxQaaxr0UR8g2KYn
	mop/OddTwJ9EDxEezl1RMYHpavAzlH5LRJJ9ELstwx01do9FHRLVX6QJ3yFwI/uW7Hb/dm3mnKx
	wx7cWbQvRgcRRuzvuEizGtnoIBznCFgh2ttRuNL4AxEL7RH8u09mtNoV0q7lMdln7tB8=
X-Received: by 2002:a17:903:1212:b0:1cc:688e:5b1e with SMTP id l18-20020a170903121200b001cc688e5b1emr4860613plh.67.1700046039468;
        Wed, 15 Nov 2023 03:00:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFq3xJ3QeScRUeAbyuybND7Dw5Y+G4ZIrPKsnEy6h4sHRtBm3Ikk5V5pwoeRtHH7PTpyDdFA==
X-Received: by 2002:a17:903:1212:b0:1cc:688e:5b1e with SMTP id l18-20020a170903121200b001cc688e5b1emr4860591plh.67.1700046039079;
        Wed, 15 Nov 2023 03:00:39 -0800 (PST)
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id k7-20020a170902c40700b001bc2831e1a8sm7207427plk.80.2023.11.15.03.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 03:00:38 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: reatmon@ti.com,
	denys@ti.com,
	detheridge@ti.com,
	meta-arago@lists.yoctoproject.org
Cc: Sinthu Raja <sinthu.raja@ti.com>
Subject: [meta-arago][krikstone][PATCH 0/2] Add gc320 driver support for
Date: Wed, 15 Nov 2023 16:30:31 +0530
Message-Id: <20231115110033.4746-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1700046040-305679-12397-3879-1
X-BESS-VER: 2019.1_20231114.2339
X-BESS-Apparent-Source-IP: 209.85.214.199
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUirNy1bSUcovVrIyNTMEMjKAYkkm5iYGqQZmZg
	YWSRYpxklJFmYWKSZpFhbGholJiUbJSrWxAF23WadAAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.252154 [from 
	cloudscan12-14.eu-central-1a.ess.aws.cudaops.com]
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
 <meta-arago@lists.yoctoproject.org>; Wed, 15 Nov 2023 11:00:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15009

From: Sinthu Raja <sinthu.raja@ti.com>

Hi All,
This patch series add support to enable gc320 driver on AM57x
platforms. Due to time constraint currently we are supporting 
only AM57x platform. Other platforms can be added eventually.

Sinthu Raja (2):
  branding-core: Add gc320 driver for AM57x platforms
  images: Add support to pack the gc320 device libraries

 .../conf/distro/include/branding-core.inc           | 13 ++++++++++---
 .../recipes-core/images/tisdk-default-image.bb      |  1 +
 2 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.36.1


