Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C69BC4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 14:36:38 +0000 (UTC)
Received: from egress-ip43b.ess.de.barracuda.com (egress-ip43b.ess.de.barracuda.com [18.185.115.247])
 by mx.groups.io with SMTP id smtpd.web11.32823.1701873391007216022
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 06 Dec 2023 06:36:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=a0nCH8qi;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.247, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199]) by mx-outbound23-61.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 06 Dec 2023 14:36:28 +0000
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3b9d731fd1bso175699b6e.1
        for <meta-arago@lists.yoctoproject.org>; Wed, 06 Dec 2023 06:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google; t=1701873387; x=1702478187; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IsQq+GHOlXVeDmxhXMGhlQmcAhDZ4hzSUwSYdgs+XPU=;
        b=a0nCH8qiWZPbAIkCTfkT3sGXrCrFGQ1CcGyeXk1LFj74lNHmCve0it3sV+qRYQRLq2
         cPkc+uBl30TWgtVIl9OdIJcSU1OAOtmVFXH54IH0zfP+s4g43e7C3Spg3w7A7Wz37xMM
         8VghDVroNvwkVkeZ9E1xj4hLoRvjbm6uofsmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701873387; x=1702478187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IsQq+GHOlXVeDmxhXMGhlQmcAhDZ4hzSUwSYdgs+XPU=;
        b=MOPD0awH5xXeJEp0p8IOZGUjSNuORfayREkuz0++Be/Hp/qQJc2ARJNXLhiFr6mdAW
         64aQz6w95jW9yEYgpD44UuDX55HpdBRpkcvLnVG+9WrMmzB4ok7NE44h37lypOrwmYYL
         R2pUSMvqm/8yJqntUDKIKByyYE2vAHk2Cq7dG5/DQwqnppUoIi2L+6dH8UflXiLtPHrC
         JMFlEi7ots1kLIIrpyQjNDDpJ29M42D7TAB4xt2Rk9vSawrf9wPT69jGvdFxbosjWSP+
         GwWEQLQMmLgG14Iv6XJrbHQnNOTG2aMCBhqNVk/4NcZtpWiqauExH76iQ/ZA/DabrTo/
         84TQ==
X-Gm-Message-State: AOJu0YwNDBoKn74EL/WrydjupkuGzcMLLBUKLrH5x8am3+J6yU9THnuz
	021+tky2JJM7c7VgZMXzhzeIFTCrN2A24HPVzCfDxeGjJ4+JZu0/8fAe3gVFY9vAvhd9OqOJOjs
	tFRd7ZtSAFAC5unxb0QgAt5v/AUbQdQf1FSyU2fUinC+WlNxNpOaUqrpWHAjVXWJ0gZU=
X-Received: by 2002:a05:6359:71cd:b0:170:17eb:14c1 with SMTP id uf13-20020a05635971cd00b0017017eb14c1mr920378rwb.49.1701873387460;
        Wed, 06 Dec 2023 06:36:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4JtqPKVFfesSWGXkJTlCho1FSWaPyYU7mlAUnTpMeyejQF/ffG6CRTL8EGMyYx7+NIQr71g==
X-Received: by 2002:a05:6359:71cd:b0:170:17eb:14c1 with SMTP id uf13-20020a05635971cd00b0017017eb14c1mr920366rwb.49.1701873387143;
        Wed, 06 Dec 2023 06:36:27 -0800 (PST)
Received: from LAP568U.mistral.in ([106.51.69.35])
        by smtp.gmail.com with ESMTPSA id s25-20020a639e19000000b005c67ca3c2c2sm265pgd.21.2023.12.06.06.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 06:36:26 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: reatmon@ti.com,
	denys@konsulko.com,
	praneeth@ti.com
Cc: meta-arago@lists.yoctoproject.org,
	u-kumar1@ti.com,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: [meta-arago][krikstone][PATCH RFC 0/4] Add gstreamer 1.20
Date: Wed,  6 Dec 2023 20:06:14 +0530
Message-Id: <20231206143618.27770-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1701873387-305949-12367-23167-1
X-BESS-VER: 2019.1_20231116.1739
X-BESS-Apparent-Source-IP: 209.85.167.199
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUirNy1bSUcovVrIyNLK0BLIygIIpZmkGiZZJlo
	nGhqmpxkkpFubJyQZmFokGiRZJqUlJaUq1sQAWvxNIQQAAAA==
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.252636 [from 
	cloudscan13-205.eu-central-1a.ess.aws.cudaops.com]
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15033

From: Sinthu Raja <sinthu.raja@ti.com>

Hi All,
This patch series add supports to gstreamer 1.20 plugins-bad for AM57x
platform and also it enables the mmip along with VPE and Ducati plugins.

Sinthu Raja (4):
  gstreamer1.0-plugins-bad: Add patches to support DRM allocator
  gst-plugins-ti: Enable network task flag for do_configure
  ti-test: Remove OAMP-DRM test
  branding-core: enable mmip for AM57x platform

 .../conf/distro/include/branding-core.inc     |   3 -
 .../gstreamer1.0-plugins-ducati_git.bb        |   2 +
 .../gstreamer1.0-plugins-vpe_git.bb           |   2 +
 ...mallocator-Add-DRM-allocator-support.patch | 367 ++++++++++++++++++
 ...drm-and-tidss-in-the-list-of-drivers.patch | 160 ++++++++
 .../gstreamer1.0-plugins-bad_1.20.%.bbappend  |  15 +
 .../recipes-core/packagegroups/ti-test.bb     |   3 -
 7 files changed, 546 insertions(+), 6 deletions(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstdrmallocator-Add-DRM-allocator-support.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.%.bbappend

-- 
2.36.1


