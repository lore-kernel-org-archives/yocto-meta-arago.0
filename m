Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 814EFC43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 17:37:12 +0000 (UTC)
Received: from egress-ip4a.ess.de.barracuda.com
 (egress-ip4a.ess.de.barracuda.com [18.184.203.227])
 by mx.groups.io with SMTP id smtpd.web09.28497.1656610628496231015
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 30 Jun 2022 10:37:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=XoxOn10r;
 spf=pass (domain: mistralsolutions.com, ip: 18.184.203.227,
 mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by mx-outbound44-206.eu-central-1c.ess.aws.cudaops.com
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 30 Jun 2022 17:37:04 +0000
Received: by mail-pj1-f71.google.com with SMTP id
 n22-20020a17090ade9600b001ecdd9695c7so44818pjv.9
        for <meta-arago@lists.yoctoproject.org>;
 Thu, 30 Jun 2022 10:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/mU8cfGYMTwa+nCEiTDF/+F0p3MFy3YH42wYltZYZzQ=;
        b=XoxOn10rUMVUNHzDmETDYLDgf6tM/p4ExvzngEZ3xzccmXBsc9Mhtc7zkZMZllnz+N
         y/YWYwNHPmVNOFqQDnsDXhWpgbWbYDiSQoz5WS7UdA4gcnzlTLqKJqAl6ut/wtvlS1lt
         rJmGa3AnVMPK9T0nAv2TYoG5WWtBzDjiPIocg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/mU8cfGYMTwa+nCEiTDF/+F0p3MFy3YH42wYltZYZzQ=;
        b=FJBgVGcEpvbkAGnUKet1lYU5BnrQ7u9+BMJraX67LRRgn+RLKa92KSASgJJrZUagH/
         UvusMMeUQidDsckFCPZ8CPmZXp5h7rzPrDwGqlBlOfX+9513+Vl/2C65s/XXYTKbPy29
         RYdPO/ezD0LiinX2yTo7C8XA2STN6y7Z+PInmWyzfkS76ElGSn7MDJ1kbP2WeOP5vrQO
         MEOLfS6MTryYENl7ERUibcFQqrDsFMk8zG8d1gRIqOwLPXmJhoaWMCxwuUJlavNBRuJI
         U69Ye7Wf6787dOmhTATmieROjGNd9o4oIMfN2Ok4KdydOnCZEtDkDyhxHW8y6yTBoHe5
         86cg==
X-Gm-Message-State: AJIora/lYSs1S7jWy/OVjaGI8RcP5QxLYgcBsX7ADcH/Hdi2Gyulpc0m
	9MARdk3UGKt01NdSx5LrUoL1S3wztciEHtGYQ130PXx1M1TDgxcVEcHP/2002NzCIRAgZuOg5C0
	a1pm2A0g5nNi6vcrfwgd+0dYhnSfTtbKG2FqXDQDiAMpujQrC/zVDn5gJLb6iRarcvZY=
X-Received: by 2002:a05:6a00:1305:b0:512:ebab:3b20 with SMTP id
 j5-20020a056a00130500b00512ebab3b20mr17096645pfu.82.1656610622673;
        Thu, 30 Jun 2022 10:37:02 -0700 (PDT)
X-Google-Smtp-Source: 
 AGRyM1t5cvkq6BWquWMO7lV39edIpvIUbqKMTMARj9qkWWmRkw/JUXHcEgLGsNEhWf2ewdA8WUu50g==
X-Received: by 2002:a05:6a00:1305:b0:512:ebab:3b20 with SMTP id
 j5-20020a056a00130500b00512ebab3b20mr17096616pfu.82.1656610622230;
        Thu, 30 Jun 2022 10:37:02 -0700 (PDT)
Received: from localhost.localdomain ([49.207.220.78])
        by smtp.gmail.com with ESMTPSA id
 j2-20020a170902758200b0016a058b7547sm13504606pll.294.2022.06.30.10.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 10:37:01 -0700 (PDT)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: meta-arago@lists.yoctoproject.org
Cc: Lucas Weaver <l-weaver@ti.com>,
	yogeshs@ti.com,
	praneeth@ti.com,
	a-limaye@ti.com,
	reatmon@ti.com,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH V2] processor-sdk-linux: Add
 08.02.01.00 release config
Date: Thu, 30 Jun 2022 23:06:42 +0530
Message-Id: <20220630173642.4084-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1656610623-311470-5424-25583-1
X-BESS-VER: 2019.1_20220627.1822
X-BESS-Apparent-Source-IP: 209.85.216.71
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2,
 rules version 3.2.2.241048 [from
	cloudscan15-120.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.50 BSF_RULE7568M          META: Custom Rule 7568M
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS91090 scores of
 KILL_LEVEL=7.0 tests=BSF_RULE7568M, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 30 Jun 2022 17:37:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13929

From: Sinthu Raja <sinthu.raja@ti.com>

Add config file for processor-sdk-linux 08.02.01.00 release

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---
Change in V2:
------------
1.Addressed the following review comments
  Updated url from git:// to https://

 .../processor-sdk-linux-08_02_01_00.txt          | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 configs/processor-sdk-linux/processor-sdk-linux-08_02_01_00.txt

diff --git a/configs/processor-sdk-linux/processor-sdk-linux-08_02_01_00.txt b/configs/processor-sdk-linux/processor-sdk-linux-08_02_01_00.txt
new file mode 100644
index 0000000..b42f802
--- /dev/null
+++ b/configs/processor-sdk-linux/processor-sdk-linux-08_02_01_00.txt
@@ -0,0 +1,16 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,1.46,d22cc1e587c650fd5f90cda32f5720f8a3105aac
+meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.02.00.006,layers=meta-arago-distro:meta-arago-extras
+#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,6bfe29d9e8fdd5c2fd17c736814b6df859b3af50,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,c5f61e547b90aa8058cf816f00902afed9c96f72,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,0722ff6f021df91542b5efa1ff5b5f6269f66add,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.02.00.006,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,HEAD,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,51844f2d60d77fb8cb46ffe460402f76ae216ca5,layers=meta
+meta-psdkla,https://git.ti.com/git/jacinto-linux/meta-psdkla.git,am57xx_8.x,PSDKLA-AM57XX-08_02_01_00,layers=
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
+
-- 
2.36.1


