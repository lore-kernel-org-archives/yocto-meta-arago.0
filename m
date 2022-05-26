Return-Path: <priya.ns@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F09C433F5
	for <webhook@archiver.kernel.org>; Thu, 26 May 2022 13:54:03 +0000 (UTC)
Received: from egress-ip33b.ess.de.barracuda.com
 (egress-ip33b.ess.de.barracuda.com [18.185.115.237])
 by mx.groups.io with SMTP id smtpd.web12.20068.1653573233255370881
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 26 May 2022 06:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=QcIZxhrh;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.237,
 mailfrom: priya.ns@mistralsolutions.com)
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by mx-outbound47-49.eu-central-1c.ess.aws.cudaops.com
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 26 May 2022 13:53:50 +0000
Received: by mail-pg1-f198.google.com with SMTP id
 d125-20020a636883000000b003db5e24db27so877830pgc.13
        for <meta-arago@lists.yoctoproject.org>;
 Thu, 26 May 2022 06:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LBva88Ok45yuHAgFPf91qJAffgfXHKNtFwxTcBmiIXk=;
        b=QcIZxhrh/GoFv1EIBZmNbLVU5ba30/wVunE62ia/Qi4sUJZ5xi0yK81JHGgbrAzOod
         WLrAoPnDV+nlGKsK3cy1bzi9sB1L99/vkucoLQFZWcl0Qa0oHW0/yguKfGR+UE0SWuvj
         gbozzSNWH2LIRpeRAXGCF+uVv0U4boyA/9k4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LBva88Ok45yuHAgFPf91qJAffgfXHKNtFwxTcBmiIXk=;
        b=0Qvc4Y4Hm0D/4zHDZX3aF76E+aMGpBL6oPPAldJ0JD6iRKcWgt6jm20tXYK9PYn+I5
         PUQy773X6Q3iiL0KKrOF5kVUrX8lE2iCi2AkCEQesShCKYQYSM05fnpBjAd6QKFkhedI
         B+VgYnlX56ef92HXcadnWSDW5nBbksYlsp1Uh0H5ox5WQ0I749vi/LsTvL9v5aC4v5DF
         2s1SXZNGITKzKZIToefx12c0DMf+BH0lV/84Q7M277iHcoa3M+af4UbxaoaqzkKFQRmO
         NVGRmw+q8tv1BcNPNCXp4gmFMyuu1DSVwpCuyVZaJ7eo2xDXaqzE/g6qNBBYnc6HtqHs
         l23g==
X-Gm-Message-State: AOAM530blsXdDYstCJTM/DCZ+IVbiwy/qSrP1Z7clMFS+9FWhXJKw4Zn
	2fNeuH1dKU8vcrkHFZo3PasQ8UuauCq9wMSRUbw9RheKlmzLYS9WAZSDbGfrId2BMm5beX6QP8H
	AQMh88K/n7K1i6d6gBHg0JJfXWMa+TfMPN1aH7jIJdDvx9Isr354FgyV7o4cddSCG5s0=
X-Received: by 2002:a17:90a:d3c7:b0:1e0:d55e:35eb with SMTP id
 d7-20020a17090ad3c700b001e0d55e35ebmr2773829pjw.105.1653573228762;
        Thu, 26 May 2022 06:53:48 -0700 (PDT)
X-Google-Smtp-Source: 
 ABdhPJx3GT9WGUGN6IQ+vjS0kS3+QKys2JzmXRA33tlLjau9crSgrBEalzcomVRHQZ3DOOo89Tzmvw==
X-Received: by 2002:a17:90a:d3c7:b0:1e0:d55e:35eb with SMTP id
 d7-20020a17090ad3c700b001e0d55e35ebmr2773795pjw.105.1653573228342;
        Thu, 26 May 2022 06:53:48 -0700 (PDT)
Received: from LAP000507.mistral.in ([144.48.49.113])
        by smtp.gmail.com with ESMTPSA id
 l12-20020a170902d34c00b0015e8d4eb2b8sm1575719plk.258.2022.05.26.06.53.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 May 2022 06:53:46 -0700 (PDT)
From: Priya N S <priya.ns@mistralsolutions.com>
X-Google-Original-From: Priya N S <priya.ns@ti.com>
To: meta-arago@lists.yoctoproject.org
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Sekhar Nori <nsekhar@ti.com>,
	Sinthu Raja <sinthu.raja@ti.com>,
	Priya N S <priya.ns@ti.com>
Subject: [meta-arago][oe-layersetup][master][PATCH] configs: processor-sdk:
 Add AM335x 8.2 config file
Date: Thu, 26 May 2022 19:23:44 +0530
Message-Id: <20220526135345.20464-1-priya.ns@ti.com>
X-Mailer: git-send-email 2.19.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1653573229-312081-5532-52082-1
X-BESS-VER: 2019.1_20220523.1816
X-BESS-Apparent-Source-IP: 209.85.215.198
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
 rules version 3.2.2.240238 [from
	cloudscan21-102.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of
 KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 26 May 2022 13:54:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13881

Add 08.02 release config file for AM335x.

Signed-off-by: Priya N S <priya.ns@ti.com>
---
 .../processor-sdk-08.02.00.24-config.txt          | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-08.02.00.24-config.txt

diff --git a/configs/processor-sdk/processor-sdk-08.02.00.24-config.txt b/configs/processor-sdk/processor-sdk-08.02.00.24-config.txt
new file mode 100644
index 0000000..5768254
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-08.02.00.24-config.txt
@@ -0,0 +1,15 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.46,d22cc1e
+meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,716008bc1003478d2e6c3e0c741f0fd80dcee5fb,layers=
+meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.02.00.006,layers=meta-arago-distro:meta-arago-extras
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,6bfe29d,layers=
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,c5f61e5,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,0722ff6,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.02.00.006,layers=
+meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3,layers=meta-arm:meta-arm-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,dunfell,51844f2,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.19.1.windows.1


